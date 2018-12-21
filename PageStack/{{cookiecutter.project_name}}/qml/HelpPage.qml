import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0

Page {
    id: secondPage
    anchors.fill: parent
    visible: false

    header: PageHeader {
       title: i18n.tr("Help Page")
    }

    Label {
       anchors.centerIn: parent
       text: i18n.tr("Welcome in the Help Page")
    }
}
