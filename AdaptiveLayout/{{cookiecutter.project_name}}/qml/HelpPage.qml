import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Layouts 1.0
import Ubuntu.Components.ListItems 1.3 as ListItem

/*
  Help page
*/
Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Help Page')
        }

        Label {
            anchors.centerIn: parent
            text: i18n.tr('Welcom to Help Page!')
        }
    }
