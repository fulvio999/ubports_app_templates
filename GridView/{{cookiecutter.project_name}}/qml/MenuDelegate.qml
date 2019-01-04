import QtQuick 2.4
import Ubuntu.Components 1.3

/*
   Define how to Dislay an Item contained in the ListModel (MenuModel.qml)
*/
Item {
     id: menuItem
     width: gridView.cellWidth;
     height: gridView.cellHeight

     Column {
            anchors.fill: parent
            spacing:units.gu(1)
            Row{
                Rectangle {
                      radius: 5
                      width: gridView.cellWidth - units.gu(1)
                      height: gridView.cellHeight - units.gu(1)
                      color: UbuntuColors.green
                      border.color: "black"

                      MouseArea {
                            anchors.fill: parent;

                            Text {
                                 anchors.centerIn: parent
                                 text: name
                            }

                            onClicked: {
                                 pageStack.push(Qt.resolvedUrl(pageToOpen));
                            }
                      }
                }
           }
      }
}
