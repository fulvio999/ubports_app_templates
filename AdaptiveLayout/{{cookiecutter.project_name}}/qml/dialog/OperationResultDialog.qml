import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


/*
   Generic dialog
*/
Dialog {

    id: operationResultDialog

    /* the message to display */
    property string msg;

    title: i18n.tr("Sample Dialog")

    Column{
        spacing: units.gu(2)

        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: i18n.tr("Close")
                onClicked:{
                    PopupUtils.close(operationResultDialog)
                }
            }
         }

         Row {
             anchors.horizontalCenter: parent.horizontalCenter

             Label{
               text: i18n.tr("Received input is")+": "+msg
             }
         }
    }
}
