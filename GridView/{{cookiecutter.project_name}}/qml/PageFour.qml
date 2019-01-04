import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3

/*
  PAPGE FOUR: shown when the user click on fourth Rectangle
*/
Page {
      id: fourthPage
      visible: false

       header: PageHeader {
          title: i18n.tr("Page Four")
       }

       Label{
          anchors.centerIn: parent
          text: i18n.tr("Welcome, i'm PageFour.qml")
       }
}
