import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0

Page {
   id: firstPage
   anchors.fill: parent

   header: PageHeader {
       id: header
       title: i18n.tr('App PageStack Template')

       /* the menu on the left side */
       leadingActionBar.actions: [

            Action {
                 id: aboutPopover
                 iconName: "info"
                 text: i18n.tr("About")
                 onTriggered:{
                     PopupUtils.open(Qt.resolvedUrl("./dialog/ProductInfoDialog.qml"))
                 }
            }
        ]

        /* the menu on the right side */
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

   Button{
        id:showSecondPageButton
        anchors.centerIn: parent
        text: i18n.tr("Show Second Page")
        width: units.gu(20);      
        onClicked:{
           pageStack.push(Qt.resolvedUrl("SecondPage.qml"));
       }
   }
}
