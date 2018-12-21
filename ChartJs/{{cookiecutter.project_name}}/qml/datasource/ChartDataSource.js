/*
  Function to create the X-Y data for the chart.
  NOTE: in a real scenario that values, would be loaded from a different source (eg. a sqlite database)
*/

/*
  Main function invoked from qml file to get chart dataset
*/
function getChartData(){

    var ChartBarData = {
        labels: getXvalues(),

        datasets: [{
                  fillColor: "rgba(220,220,220,0.5)",
                  strokeColor: "rgba(220,220,220,1)",
                  data: getYvalues()
              }
        ]
    }
    return ChartBarData;
}

/*
  Create the X VALUES for the chart
*/
function getXvalues(){

    var x_values = ["Label_1","Label_2","Label_3"];

    return x_values;
}


 /*
    Create the Y VALUES for the chart
 */
function getYvalues(){

    var y_values = [10,15,5];

    return y_values;
}
