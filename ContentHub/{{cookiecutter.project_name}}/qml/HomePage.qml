import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0
import Ubuntu.Content 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

/* import folder */
import "./dialog"

/*
   Application Home page loaded at startup:
   Here user can:
   - import new images from others image source Apps
   - manage the already imported images
*/
Page {
    id: importImagePage

    header: PageHeader {
       title: "<b>"+i18n.tr("Welcome")+"</b>"
    }

    Column {
            id: addNewImageColumn
            anchors.fill: parent
            spacing: units.gu(3.5)
            anchors.leftMargin: units.gu(4)

            Rectangle{
                color: "transparent"
                width: parent.width
                height: units.gu(6)
            }

            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: units.gu(4)

                Button {
                      id: chooseImagesToImportButton
                      text: i18n.tr("Import image")+"..."
                      width: units.gu(22)
                      onClicked: {

                        /* Emit a signal named 'importRequested' to notify that we want import an image.
                           The signal handler is in Main.qml  file: it connect with Contenthub to start a transfer.
                        */
                        root.importRequested()

                        /* show a page containing the App in the device that are registered as "Image source" */
                        pageStack.push(Qt.resolvedUrl("ContentPeerPickerPage.qml"))
                      }
                  }
               }

               Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Button {
                         id: showImportedImagesButton
                         text: i18n.tr("Show imported images")
                         width: units.gu(22)
                         onClicked: {
                             pageStack.push(Qt.resolvedUrl("ShowImagesNamesListPage.qml"))
                         }
                   }
              }
         }
}
