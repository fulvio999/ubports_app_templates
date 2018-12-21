import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


/*
   Info about the application
*/
Dialog {
       id: aboutProductDialogue
       title: i18n.tr("Product Info")
       text: i18n.tr("Application version")+root.appVersion+"<br>"
       Button {
           text:  i18n.tr("Close")
           onClicked: PopupUtils.close(aboutProductDialogue)
       }
}
