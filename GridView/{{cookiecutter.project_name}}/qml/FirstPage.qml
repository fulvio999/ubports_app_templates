import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.0


/*
  First page pushed on PageStack shown on startup: Present a pages menu as a Grid
*/
Page {
    id:mainPage
    visible:false

    header: PageHeader {
        title: "{{cookiecutter.project_name}}"

        leadingActionBar.actions: [
            Action {
                id: aboutPopover
                iconName: "info"
                text: i18n.tr("About")
                onTriggered:{
                    PopupUtils.open(Qt.resolvedUrl("AppInfoDialogue.qml"))
                }
            }
        ]

        /* trailingActionBar is the bar on the right side */
        trailingActionBar.actions: [
                Action {
                         iconName: "help"
                         text: i18n.tr("Help")
                         onTriggered:{
                            pageStack.push(Qt.resolvedUrl("HelpPage.qml"))
                        }
                }
        ]
    }

    /*
       Draw Itmes listed in MenuModel.qmls as a grid.
       Informations how to draw an item are in MenuDelegate.qmls
     */
    GridView {
          id: gridView
          anchors.margins: units.gu(10) /* amount of blanck space around */
          anchors.fill: parent
          model: MenuModel{} /* file: MenuModel.qml */
          focus: true
          clip: true
          delegate: MenuDelegate{} /* file: MenuDelegate.qml */
    }
}
