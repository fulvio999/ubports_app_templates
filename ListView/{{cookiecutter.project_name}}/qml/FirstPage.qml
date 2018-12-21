import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3


/*
   This is the first page loaded in the PageStack on application startup
*/
Page {
   id: mainPage
   anchors.fill: parent

   header: PageHeader {
      id: header
      title: i18n.tr('ListView Sample App')
   }

   /* the ListModel containing the Itme to display */
   ListModel{
       id: itemListModel
   }

   /* An Ubuntu QML Component to keep sorted a ListModel using a provided sorting order */
   SortFilterModel {
      id:  sortedItemsModel
      model: itemListModel
      sort.order: Qt.AscendingOrder
      sortCaseSensitivity: Qt.CaseSensitive
   }

   /* UbuntuListView Component add at QML ListView additional features such as expanding/collapsing items */
   UbuntuListView {
        id:  listItemsUbuntuListView
        anchors.fill: parent

        /* amount of space from the above component */
        anchors.topMargin: units.gu(30)
        model: sortedItemsModel
        delegate: ListItemDelegate{}

        /* disable the dragging features of the ListModel elements */
        boundsBehavior: Flickable.StopAtBounds

        /* set the custom Component to highLight the selected component */
        highlight: ItemHighlighterComponent{}
        focus: true
        /* set clip:true to prevent that UbuntuListView draw out of his assigned rectangle, default is false */
        clip: true
   }

   /* to have a scroll bar we ListModel size exceed the page heigth */
   Scrollbar {
      flickableItem:  listItemsUbuntuListView
      align: Qt.AlignTrailing
   }

   Column{
         anchors.fill: parent
         spacing: units.gu(2)

         /* transparent placeholder */
         Rectangle {
             color: "transparent"
             width: parent.width
             height: units.gu(8)
         }

         Row {
               id:filteredItemsRow
               spacing: units.gu(3)
               anchors.horizontalCenter: parent.horizontalCenter

               Button{
                  id:showNetworksButton
                  text:i18n.tr("Load Model")
                  enabled:true
                  width: filterTextField.width
                  color: UbuntuColors.green
                  onClicked:{

                        /*
                           onClicked event, fill the model with some items.
                           NOTE: in a real case, they could be loaded from a local Database or come from an API call
                        */

                        loadingItemListActivity.running = ! loadingItemListActivity.running /* start animation */

                        /* clean old values (optional) */
                        itemListModel.clear();

                        /* Add a json object in the ListModel associated at the ListView  */

                        /* Item 1 */
                        itemListModel.append({
                               "Name": "Jhon",
                               "Surname": "Doe",
                               "Address": "1st Street Avenue",
                               "City": "Berlin",
                               "Country": "Germany",
                               "Job": "Driver",
                               "Status": "married"
                        });

                        /* Item 2 */
                        itemListModel.append({
                              "Name": "Peter",
                              "Surname": "Doe",
                              "Address": "Monument Plaza",
                              "City": "New York",
                              "Country": "USA",
                              "Job": "Developer",
                              "Status": "single"
                        });

                        /* Item 3 */
                        itemListModel.append({
                              "Name": "Jenny",
                              "Surname": "Martin",
                              "Address": "king street 237",
                              "City": "London",
                              "Country": "United Kingdom",
                              "Job": "Hostess",
                              "Status": "married"
                        });

                        /* Item 4 */
                        itemListModel.append({
                              "Name": "Linda",
                              "Surname": "Brown",
                              "Address": "Rue Bonaparte 10",
                              "City": "Paris",
                              "Country": "France",
                              "Job": "Teacher",
                              "Status": "single"
                        });

                        itemsFoundLabel.visible = true
                        filterTextField.enabled = true

                        loadingItemListActivity.running = ! loadingItemListActivity.running  /* stop animation */
                   }
               }
         }

         Row {
               id:cityRow
               spacing: units.gu(3)
               anchors.horizontalCenter: parent.horizontalCenter

               TextField{
                   id: filterTextField
                   placeholderText: i18n.tr("Filter items by Name")
                   width: units.gu(25)
                   enabled:false
                   inputMethodHints: Qt.ImhNoPredictiveText /* disable text prediction with underlining */
                   onTextChanged:{

                      if(text.length > 0 ) /* do filtering items */
                      {
                          /* flag "i" means ignore case */
                          sortedItemsModel.filter.pattern = new RegExp( filterTextField.text, "i")
                          sortedItemsModel.sort.order = Qt.AscendingOrder
                          sortedItemsModel.sortCaseSensitivity = Qt.CaseSensitive

                          /* filter by Name and keep sorting by Surname property */
                          sortedItemsModel.sort.property = "Surname"
                          sortedItemsModel.filter.property = "Name"

                      } else { /* show all items */
                          sortedItemsModel.filter.pattern = /./
                          sortedItemsModel.sort.order = Qt.AscendingOrder
                          sortedItemsModel.sortCaseSensitivity = Qt.CaseSensitive
                      }
                  }
             }
         }

         Row{
             id: bikeNetworksFoundRow
             anchors.horizontalCenter: parent.horizontalCenter

             ActivityIndicator {
                id: loadingItemListActivity
             }

             Label{
                 id: itemsFoundLabel
                 visible:false
                 text: i18n.tr("Found")+" "+  listItemsUbuntuListView.count +" "+i18n.tr("item(s)")
             }
        }
    }
}
