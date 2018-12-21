import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

import "./lib/chart/QChart.js" as Charts

/* The X-Y datasource provider for the chart */
import "./datasource/ChartDataSource.js" as ChartDataSource

/* Import QChart qml Component */
import "./lib/chart"

/*
   Sample APP to show chart creation using Javascript
*/
MainView {
    id: root
    objectName: 'mainView'
    applicationName: "{{cookiecutter.project_name}}"
    automaticOrientation: true

    property string appVersion : "{{cookiecutter.project_version}}"

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
           id: header
           title: i18n.tr('{{cookiecutter.project_name}}')
        }

        Rectangle{
           id: container
           anchors.fill: parent
           anchors.topMargin: units.gu(7)
           anchors.margins :units.gu(1)
           border.color: "black"
           border.width: 1

           QChart{
                id: sampleCahrt;
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                chartAnimated: true;
                chartData: ChartDataSource.getChartData();
                chartType: Charts.ChartType.BAR;
            }
         }
    }
}
