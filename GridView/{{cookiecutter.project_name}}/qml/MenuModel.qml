import QtQuick 2.4
import Ubuntu.Components 1.3

/*
  Create a ListModel with the items to display in FirstPage.qml
  The items are a set of pages to open when the user select an item
 */
ListModel {
    id:menuModel

    /* note: fill Listmodel with this method because allow you to use of i18n */
    Component.onCompleted: {
          menuModel.append( { name: i18n.tr("Open page 1"), pageToOpen: i18n.tr("PageOne.qml")} );
          menuModel.append( { name: i18n.tr("Open page 2"), pageToOpen: i18n.tr("PageTwo.qml") } );
          menuModel.append( { name: i18n.tr("Open page 3"), pageToOpen: i18n.tr("PageThree.qml") } );
          menuModel.append( { name: i18n.tr("Open page 4"), pageToOpen: i18n.tr("PageFour.qml") } );

          /* if necessary add here new items */
    }
}
