import QtQuick 2.4

import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Content 1.1

import Fileutils 1.0

/* import folder */
import "./dialog"

/*
   Delegate component used to manage the imported images.
   The available management operations (open and delete) are shown with a Swipe movement.
*/
ListItem {
    id: standardItem

    Label {
        id: label
        verticalAlignment: Text.AlignVCenter
        text: "<b>"+imageName+"</b>"
        height: parent.height
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
    }

    MouseArea {
        id: selectableMouseArea
        anchors.fill: parent
        onClicked: {
            imagePhotoListView.currentIndex = index
        }
    }

    /*
       Swipe to right movement: delete image file
       NOTE: is deleted the App local copy (ie: the one under: /home/phablet/.local/share/<project_name>/images/),
       NOT the original one owned by the App source chosen
     */
    leadingActions: ListItemActions {
        actions: [
           Action {
               iconName: "delete"
               onTriggered: {
                   /* image name without path */
                   var imageToDelete = importedImagesListModel.get(index).imageName;
                   var imagePath = Fileutils.getHomePath()+"/"+root.imagesSavingRootPath+"/images/"+imageToDelete;

                   /* remove image file from the device file system */
                   Fileutils.removeImage(imagePath);

                   /* update the ListModel */
                   importedImagesListModel.remove(index);
               }
           }
        ]
     }

    /* Swipe to right movement: show the image in a popup Dialog */
    trailingActions: ListItemActions {
         actions: [
               Action {
                   iconName: "find"  /* the lens icon */
                   onTriggered: {
                        imagePhotoListView.currentIndex = index
                        showImagesNamesListPage.targetImageName = importedImagesListModel.get(index).imageName
                        /* show image */
                        PopupUtils.open(imageZoomDialog)
                   }
               }
         ]
    }

}
