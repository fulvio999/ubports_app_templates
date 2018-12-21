import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Layouts 1.0

import QtQuick.LocalStorage 2.0

import "./js/Storage.js" as Storage

/* import folder */
import "./dialog"

Page {
       id: thirdPage
       anchors.fill: parent

       header: PageHeader {
           id: header
           title: i18n.tr('Third Page')
       }

       Label {
          anchors.centerIn: parent
          text: i18n.tr('I am the third Page!')
      }
 }
