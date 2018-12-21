import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3



    /*
       Delegate component used to display an Item conteined in a ListView (or UbuntuListView)
       It receives as in input the ListModel and can extract items properties values from the items
       (ie the keys of Json obejct)
    */
   Item {
         id:  itemToShow

         width: mainPage.width
         height: units.gu(15) /* heigth of the rectangle container */
         visible: true;

         /* create a container for each job */
         Rectangle {
             id: background
             x: 2; y: 2; width: parent.width - x*2; height: parent.height - y*1
             border.color: "black"
             radius: 5
         }

         /* The mouse region covers the entire delegate */
          MouseArea {
             id: selectableMouseArea
             anchors.fill: parent
             onClicked: {
                 /* move the highlight component to the currently selected item
                   'index' is a property of the ListView Component
                 */
                 listItemsUbuntuListView.currentIndex = index
             }
          }

          /* create a row for each item in the ListModel */
          Row {
                id: topLayout
                x: 10; y: 7;
                height: background.height;
                width: parent.width
                spacing: units.gu(3)

                /* Show item property */
                Column{
                      id: itemInfoColumn
                      width: topLayout.width - detailsColumn.width - units.gu(10)
                      height:  itemToShow.height
                      spacing: units.gu(0.5)

                      Label {
                          /* To access at a property use the corresponding json key in the ListModel */
                          text: i18n.tr("Name")+": " + Name
                          fontSize: "medium"
                      }

                      Label {
                          text: i18n.tr("Surname")+": " + Surname
                          fontSize: "medium"
                      }

                      Label {
                          text: i18n.tr("Address")+": " + Address
                          fontSize: "medium"
                      }

                      Label {
                          text: i18n.tr("City")+": " + City
                          fontSize: "medium"
                      }

                      Label {
                          text: i18n.tr("Country")+": " + Country
                          fontSize: "medium"
                      }
                  }

                  /* Lens Icon Networks details */
                  Column{
                         id: detailsColumn
                         width: units.gu(4);
                         height:  itemToShow.height
                         spacing: units.gu(0.5)
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.Right

                         Image {
                                id:  detailsImage
                                source: Qt.resolvedUrl("./graphics/lens.png")
                                height: parent.height - units.gu(5)
                                width: height - units.gu(5)
                                fillMode: Image.PreserveAspectFit

                                MouseArea {
                                      width:  detailsImage.width
                                      height:  detailsImage.height
                                      onClicked: {

                                                /* onClicked event go to details page, passing to it some current item property */
                                                pageStack.push(Qt.resolvedUrl("ItemDetailsPage.qml"),
                                                                  {
                                                                      /* the pattern is:
                                                                         <new-page-variable-name> : <item-property-value-to-pass>
                                                                      */
                                                                      name : Name,
                                                                      surname : Surname,
                                                                      job: Job,
                                                                      status: Status
                                                                    }
                                                               )

                                                    /* move the highlight component to the currently selected item
                                                      'index' is a property of the ListView Component
                                                    */
                                                    listItemsUbuntuListView.currentIndex = index
                                            }
                                }
                          }

                    }

            }
    }
