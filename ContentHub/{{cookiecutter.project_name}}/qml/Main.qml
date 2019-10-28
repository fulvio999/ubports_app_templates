import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0
import Ubuntu.Content 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

/*
  Custom plugin to perform some operations with files on the device
*/
import Fileutils 1.0

/* import a folder content */
import "./dialog"

MainView {

    id: root

    objectName: "mainView"
    automaticOrientation: true
    anchorToKeyboard: true

    applicationName: "{{cookiecutter.project_name}}"
    property string appVersion : "{{cookiecutter.project_version}}"

    /* application hidden folder where are saved the imported image. (the path is fixed by App confinement rules) */
    property string imagesSavingRootPath: ".local/share/{{cookiecutter.project_name}}"

    /* local variable to be monitored to get info about Content-hub image transfer status */
    property var activeTransfer: null

    /* signal emitted when user press Import image button */
    signal importRequested

    width: units.gu(100)
    height: units.gu(75)

    /* list of imported images */
    ListModel{
       id: importedImagesListModel
    }

    /* ------------- Mandatory blocks: Connection with the ContentHub component ---------------
    Note: must is placed in the MainView Component of the App, not in others Pages Component */
    Connections {
         target: ContentHub

         /* handler for event 'importRequested' raised when user press 'Browse' button or 'Add' button to chose an image to import */
         onImportRequested: {
                console.log("ImportRequested event raised: import image process started...");

                /* bind the 'transfer' property of the ContentHub, to the local var 'activeTransfer' (see above) */
                root.activeTransfer = transfer

                if (root.activeTransfer.state === ContentTransfer.Charged){
                   /* image transfer completed from chosen Pictures App sources */
                   root.processPictures(root.activeTransfer.items)
                }
         }
    }

    /* Connection with the 'activeTransfer' local variabile which is binded with the 'transfer' object of the
       ContentHub (see above).
       This variable in monitored to get trasfer status
    */
    Connections {
        target: root.activeTransfer
        onStateChanged: {
           console.log("Transfer State Changed to status: " + root.activeTransfer.state);
           if (root.activeTransfer.state === ContentTransfer.Charged){
               /* transfer is completed from the chosen Pictures App source */
               root.processPictures(root.activeTransfer.items)
           }
       }
    }
    //------------------------------------------------------------------------------------

    PageStack {
        id: pageStack

        anchors.fill: parent

        /* load the firts page */
        Component.onCompleted: {
            pageStack.push(Qt.resolvedUrl("HomePage.qml"))
        }
    }

    /*
       Callback function called when the Images(s) transfer from an Image App source (eg. Gallery) is completed.
       By default, the imported image(s) are placed by ContentHub under the Device folder:
       "/home/phablet/.cache/<project_name>/HubIncoming/<id>"

       Where "<id>" is a progressive integer number created after each import by ContentHub.

       IMPORTANT: After device reboot, '<id>' folder will be removed, remains only his parent folders !
       For that reason is necessary move the image(s) from that folder to a persistent folder under App confinement
       (ie in a subfolder of: /home/phablet/.local/share/<project_name>/).
       The following 'processPictures' function perform this task.

       NOTE: Running on Device the App base folder is "/home/phablet", on Desktop is '/.tmp/' (see Clickable doc).
    */
    function processPictures(items)
    {
        /* the base device folder where place the image */
        var homeFolder = Fileutils.getHomePath();

        /* An iteration is necessary if more images are imported */
        for (var i = 0; i < items.length; i++)
        {
            /* full path of the image to import */
            var url = items[i].url

            var imageName = getImageNameFromPath(String(url));

            /* The folder where Contenthub has placed the selected image.
               (ie: "/home/phablet/.cache/<project_name>/HubIncoming/<id>" )
            */
            var sourcePath = getPathFromUrl(url).replace(imageName, "");

            /* The file system location where move the image, must be under the App confinement one */
            var destinationPath = Fileutils.getHomePath()+"/"+root.imagesSavingRootPath+"/images";

            console.log("Moving image from path: " + sourcePath +" To destination path: " + destinationPath);
            Fileutils.moveImage(sourcePath, destinationPath,imageName);          
        }
    }

    /*
      Utility to extract the image name from a full path
    */
    function getImageNameFromPath(url){
        var imageName = url.split("/");
        return imageName[imageName.length -1];
    }

    /*
      Utility to remove 'file://' prefix
    */
    function getPathFromUrl(url){
        return url.toString().replace("file://", "");
    }
}
