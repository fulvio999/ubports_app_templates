import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3

/*
  PAPGE TWO: shown when the user click on second Rectangle
*/
Page {
      id: secondPage
      visible: false

       header: PageHeader {
          title: i18n.tr("Page Two")
       }

       Label{
          anchors.centerIn: parent
          text: i18n.tr("Welcome, i'm PageTwo.qml")
       }
}
