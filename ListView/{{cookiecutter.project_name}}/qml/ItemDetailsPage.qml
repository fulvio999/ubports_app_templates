import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3


/*
   This page show some details for a selected item.
   Shown when the user press 'Details' button icon in the Delegate page
*/
Page {
   id: itemDetailsPage
   anchors.fill: parent

   /* thes are two properties used in the page, whose values are passaed as input when user click on details button/icon
     (See ListItemDelegate.qml)
   */
   property string name;
   property string surname;
   property string job;
   property string status;

   header: PageHeader {
      id: header
      title: i18n.tr("Details for")+": "+ itemDetailsPage.name +" "+itemDetailsPage.surname
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
               spacing: units.gu(3)
               anchors.horizontalCenter: parent.horizontalCenter

               Label{
                  text: i18n.tr("Job")+": "+itemDetailsPage.job
                  textSize: Label.Large
               }
         }

         Row {
               spacing: units.gu(3)
               anchors.horizontalCenter: parent.horizontalCenter

               Label{
                  text: i18n.tr("Status")+": "+itemDetailsPage.status
                  textSize: Label.Large
               }
         }

    }
}
