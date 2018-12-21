import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components.ListItems 1.3 as ListItem

import "./js/Storage.js" as Storage

/* import folder */
import "./dialog"

/*
   Add a new isInputTextEmpty
*/
Page {
    id: addNewItemPage

    header: PageHeader {
       title: i18n.tr("Add new Item page")
    }

    Component {
        id: exampleDialogue
        OperationResultDialog{msg:i18n.tr("Welcome Dialog)")}
    }

    Button {
        anchors.centerIn: parent
        text: i18n.tr("Open a Dialog")

        onClicked: {
            PopupUtils.open(exampleDialogue);
        }
     }

}
