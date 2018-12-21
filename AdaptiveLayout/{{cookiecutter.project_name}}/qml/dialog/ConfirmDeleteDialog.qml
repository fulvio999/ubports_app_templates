import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

import QtQuick.LocalStorage 2.0
import "../js/Storage.js" as Storage


/*
   Confirm Dialog where the user can choose to delete ALL database content
 */
Dialog {
    id: confirmEraserDialog
    text: "<b>"+ i18n.tr("Remove ALL")+" ?"

    Rectangle {
        width: 180;
        height: 50
        Item{

            Column{
                spacing: units.gu(1)

                Row{
                    spacing: units.gu(1)

                    /* placeholder */
                    Rectangle {
                        color: "transparent"
                        width: units.gu(3)
                        height: units.gu(3)
                    }

                    Button {
                        id: closeButton
                        text: i18n.tr("Close")
                        width: units.gu(12)
                        onClicked: PopupUtils.close(confirmEraserDialog)
                    }

                    Button {
                        id: importButton
                        text: i18n.tr("Delete")
                        width: units.gu(12)
                        color: UbuntuColors.red
                        onClicked: {
                            /* TODO perform delete  */     
			    deleteOperationResult.text =  i18n.tr("Delete button pressed")                    
                        }
                    }
                }

                Row{
 		    anchors.horizontalCenter : parent.horizontalCenter
                    Label{
                        id: deleteOperationResult
                    }
                }
            }
        }
    }
}
