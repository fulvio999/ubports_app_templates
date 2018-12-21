import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Layouts 1.0
import QtQuick.LocalStorage 2.0

import "./js/Storage.js" as Storage


MainView {

    id: root

    objectName: "mainView"
    automaticOrientation: true
    anchorToKeyboard: true

    applicationName: "{{cookiecutter.project_name}}"   

    property string appVersion : "{{cookiecutter.project_version}}"

    width: units.gu(100)
    height: units.gu(75)

    Settings {
        id:settings
        /* to create DB table on first application use */
        property bool isFirstUse : true;
    }

    Component.onCompleted: {
       if(settings.isFirstUse == true) {
          Storage.createTable();
          settings.isFirstUse = false
        }
    }

    AdaptivePageLayout {

        id: adaptivePageLayout
        anchors.fill: parent

        /* first page to load */
        primaryPage: FirstPage{}
    }

}
