import QtQuick 2.4
import Ubuntu.Components 1.3

/*
 Custom component used to highlight using a chosen color and shape the selected Item in a ListView (or UbuntuListView).
 The association between highlightComponent and ListView (or UbuntuListView) is made in the ListView (or UbuntuListView)
 declaration setting the 'highlight' field

*/
Component {
      id: highlightComponent

      Rectangle {
          width: 180; height: 44
          color: "green";
          radius: 2
          /* to move the Rectangle on the currently selected item */
          y: listItemUbuntuListView.currentItem.y

          /* show an animation on change Item selection */
          Behavior on y {
              SpringAnimation {
                  spring: 0 /* we won't oscillation on item selected */
                  damping: 0.1
              }
          }
     }
}
