import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Layouts 1.0

import QtQuick.LocalStorage 2.0

import "./js/Storage.js" as Storage

/* import folder */
import "./dialog"

Page {
       id: secondPage
       anchors.fill: parent

       header: PageHeader {
           id: header
           title: i18n.tr('Second Page')
       }

       Row {
           spacing: units.gu(2)
           anchors.centerIn: parent

           Button {
                text: i18n.tr('Remove Second Page')
                onClicked: {
                    adaptivePageLayout.removePages(secondPage);
                }
           }

           Button {
                text: i18n.tr('Show Third Page')
                onClicked: {
                     adaptivePageLayout.addPageToNextColumn(secondPage, Qt.resolvedUrl("ThirdPage.qml"))
                }
           }
     }
 }
