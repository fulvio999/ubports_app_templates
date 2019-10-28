import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0
import Ubuntu.Components.ListItems 1.3 as ListItem

/* import folder */
import "./dialog"

/* custom plugin */
import Fileutils 1.0


/*
  Page that show a list of imported images using a ListItem Component.
  With swipe movements on right/left on a item allow to:
  - delete the image
  - show the image
*/
Page {
     id: showImagesNamesListPage

     /* the currently selected image name in the ListItem */
     property string targetImageName;

     /* Popup used to show an imported image (see: TmageZoomDialog.qml) */
     Component {
        id: imageZoomDialog
        ImageZoomDialog{ targetImagePath:Fileutils.getHomePath()+"/"+root.imagesSavingRootPath+"/images/"+showImagesNamesListPage.targetImageName; imageName: showImagesNamesListPage.targetImageName }
     }

    header: PageHeader {
       title: i18n.tr("Images found")+": "+importedImagesListModel.count
    }

    Component.onCompleted: {
       /* load the already imported images */
       getImagesList();
    }

    /*
      Show the images imported
    */
    UbuntuListView {
        id: imagePhotoListView
        anchors.fill: parent
        anchors.topMargin: units.gu(6)
        model: importedImagesListModel
        /* delegate component used to draw an item (ie an image item) in the UbuntuListView */
        delegate: ImageNamesListDelegate{}
    }

    /*
      Load from the App folder (/home/phablet/.local/share/<project_name>) the imported images names
    */
    function getImagesList()
    {
        var imagePath = Fileutils.getHomePath()+"/"+root.imagesSavingRootPath+"/images";
        console.log("Importing images from folder: "+imagePath);
        var fileList = Fileutils.getMomentImages(imagePath);

        importedImagesListModel.clear();

        /* fill the ListModel with the images found */
        for(var i=0; i<fileList.length; i++) {
            console.log("Found image name: "+fileList[i])
            importedImagesListModel.append( { imageName: fileList[i], imagePath: imagePath, value:i } );
        }
    }
}
