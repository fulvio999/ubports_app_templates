import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3

/*
  PAPGE THREE: shown when the user click on third Rectangle
*/
Page {
      id: thirdPage
      visible: false

       header: PageHeader {
          title: i18n.tr("Page Three")
       }

       Label{
          anchors.centerIn: parent
          text: i18n.tr("Welcome, i'm PageThree.qml")
       }
}
