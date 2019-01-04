import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3

/*
  PAPGE ONE: shown when the user click on first Rectangle
*/
Page {
      id: firstPage
      visible: false

       header: PageHeader {
          title: i18n.tr("Page One")
       }

       Label{
          anchors.centerIn: parent
          text: i18n.tr("Welcome, i'm PageOne.qml")
       }
}
