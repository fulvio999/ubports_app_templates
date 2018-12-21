import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


MainView {
    id: root
    objectName: 'mainView'
    applicationName: '"{{cookiecutter.project_name}}"'
    automaticOrientation: true

    property string appVersion : "{{cookiecutter.project_version}}"

    width: units.gu(100)
    height: units.gu(75)

    PageStack {
         id: pageStack

         /* set the firts page of the application */
         Component.onCompleted: {
             pageStack.push(Qt.resolvedUrl("FirstPage.qml"));
         }
     }
}
