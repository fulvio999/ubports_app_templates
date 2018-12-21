import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Layouts 1.0

import QtQuick.LocalStorage 2.0
import "./js/Storage.js" as Storage

/* import folder */
import "./dialog"


/*
  The first page loaded
*/
Page{
    id: mainPage   

    header: PageHeader {
        title: i18n.tr("I am the Main Page")

        /* the bar on the left side */
        leadingActionBar.actions: [
            Action {
                id: aboutProductPage
                iconName: "info"
                text: i18n.tr("About")
                onTriggered:{
                    PopupUtils.open(Qt.resolvedUrl("./dialog/AboutProductDialog.qml"))
                }
            },

            Action {
                id: helpPage
                iconName: "help"
                text: i18n.tr("Help")
                onTriggered:{
                    adaptivePageLayout.addPageToNextColumn(mainPage, Qt.resolvedUrl("HelpPage.qml"))
                }
            }
        ]

        /* the bar on the rigth side */
        trailingActionBar.actions: [
            Action {
                iconName: "list-add"
                text: i18n.tr("Add")
                onTriggered:{

                    /* depending on the root page width decide the page to load */
                    var addPage = Qt.resolvedUrl("AddNewItemPage.qml");

                    adaptivePageLayout.addPageToNextColumn(mainPage, addPage )
                }
            },

            Action {
                iconName: "delete"
                text: i18n.tr("Delete")
                onTriggered:{
                    PopupUtils.open(Qt.resolvedUrl("./dialog/ConfirmDeleteDialog.qml"))
                }
            }
        ]
    }

    Button {
           anchors.centerIn: parent
           text: i18n.tr('Show right Page')

           onClicked: {
                adaptivePageLayout.addPageToNextColumn(mainPage, Qt.resolvedUrl("SecondPage.qml"))
           }
    }
}
