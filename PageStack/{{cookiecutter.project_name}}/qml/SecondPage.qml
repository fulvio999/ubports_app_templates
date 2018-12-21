import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


Page {
    id: secondPage
    anchors.fill: parent
    visible: false

    header: PageHeader {
       title: i18n.tr("Second Page")
    }

    Button{
         id:showSecondPageButton
         anchors.centerIn: parent
         text: i18n.tr("Open Third Page")
         width: units.gu(20);
         onClicked:{
            pageStack.push(Qt.resolvedUrl("ThirdPage.qml"));
         }
    }

}
