import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


/* PopUp with general info about the application */
Dialog {
       id: aboutProductDialogue
       title: i18n.tr("Application Info")
       text: "Application version "+root.appVersion+"<br/>"

       Button {
           text: "Close"
           onClicked: PopupUtils.close(aboutProductDialogue)
       }
}
