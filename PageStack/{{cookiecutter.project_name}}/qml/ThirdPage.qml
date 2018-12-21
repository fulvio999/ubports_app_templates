import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


Page {
    id: thirdPage
    anchors.fill: parent
    visible: false

    header: PageHeader {
       title: i18n.tr("Third Page")
    }

    Label {
       anchors.centerIn: parent
       text: i18n.tr("Welcome, press Back link to return at second Page")
    }

}
