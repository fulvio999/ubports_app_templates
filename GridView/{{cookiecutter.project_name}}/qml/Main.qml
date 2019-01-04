import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


/*
   Aplication MainView
*/
MainView {

    id: root
    objectName: "mainView"

    automaticOrientation: true
    anchorToKeyboard: true

    /* applicationName needs to match the "name" field of the click manifest */
    applicationName: "{{cookiecutter.project_name}}"

    property string appVersion : "{{cookiecutter.project_version}}"

    width: units.gu(100)
    height: units.gu(75)

    PageStack {
        id: pageStack

        /* set the firts page to show on startup */
        Component.onCompleted: {
           pageStack.push(Qt.resolvedUrl("FirstPage.qml"));
        }
    }
 }
