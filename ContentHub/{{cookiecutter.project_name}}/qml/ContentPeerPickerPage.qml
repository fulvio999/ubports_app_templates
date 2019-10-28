import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0
import Ubuntu.Content 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

/*
   The content of this page is created by the UBports component named 'ContentPeerPicker' (see after)
   with the list of Device App registered as Pictures providers
   (or other content-type of interest, depends on how the ContentPeerPicker component is configured (see after) )
*/
Page{
    id: contentPeerPickerPage

    header: PageHeader {
       title: i18n.tr("Choose images source App")
    }

    /* placeholder */
    Rectangle {
        color: "transparent"
        width: parent.width
        height: units.gu(8)
    }

    /*
       UBports core component that insert the list of Apps that are registers as "Pictures Content Sources"
       in the device
     */
     ContentPeerPicker {
           id:root
           anchors { fill: parent;  }
           handler: ContentHandler.Source /* we want only the Apps registerd as Pictures sources (eg: Gallery App, ...) */
           contentType: ContentType.Pictures /* content type of our interest */

           onPeerSelected: {
               /* User has selected from the list the Picture source App */
               console.log("Got onPeerSelected event: Pictures source App chosen, starting transfer");
               peer.selectionType = ContentTransfer.Multiple /* we can moe images to import */
               peer.request();
               /* user has made the choice: come back to the previous page */
               pageStack.pop(contentPeerPickerPage)
           }

           onCancelPressed: {
               console.log("Cancel pressed, no transfer to perform");
               /* user has presseed 'undo' no transfer to perform, just come back to the previous page */
               pageStack.pop(contentPeerPickerPage)
           }
    }
}
