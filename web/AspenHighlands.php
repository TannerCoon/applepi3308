
<?php
include 'functions.php';

$id = 3;
$dest = ("AspenHighlands,CO");
$conditions = get_conditions($id);
$daymax = day_temp($id);
$nightmin = night_temp($id);
$tempunit = temp_unit($id);
$snowdepth = upper_snow($id);
$commute = get_drive_time("Boulder,CO",$dest);
$pow = get_pow("Boulder,CO",$dest, $snowdepth);
$resort_status = get_resort_status($id);
$lifts_open = get_lifts_open($id);
$beginner_open = get_beginner_open($id);
$intermediate_open = get_intermediate_open($id);
$advanced_open = get_advanced_open($id);
$a = array();
for($i = 0; $i < 6; $i++){
  array_push($a, get_forecast($id, $i));
}
$ajson = json_encode($a);

?>

              <div class="row titleRow">
                <div class="col-xs-6 title projectName">
                        <a href="index.php">
                        <img class = "img-responsive" src="./images/SB Logo 4.png">
                        </a>
                </div>
              </div>


<html>
<link rel="stylesheet" type="text/css" href="stylesheets/test.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!--Data Charts-->
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/dark.js"></script>


<!-- /*<style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
  background-color : #555555;
}
</style>*/ -->

<script>

var chart = AmCharts.makeChart("chartdiv", {
    "theme": "dark",
    "type": "serial",
    "titles": [{
      "text": "Weather Forecast",
      "size": 20
		}],
    "marginRight": 100,
    "autoMarginOffset": 30,
    "marginTop":50,
    "dataDateFormat": "YYYY-MM-DD",
    "dataProvider": <?echo $ajson?>,
    "valueAxes": [{
      "id": "v1",
      "axisAlpha": 0.1,
      "title": "Temperature in Degrees Celcius"
    } ],
    "graphs": [{
        id: "g1",
        title: "Day Temp",
        //"useNegativeColorIfDown": true,
        //"balloonText": "[[category]]<br><b>value: [[value]]</b>",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletBorderColor": "#FFFFFF",
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "lineColor": "#f44242",
        //"negativeLineColor": "#67b7dc",
        "valueField": "daytemp"
    },{
        id: "g2",
        title: "Night Temp",
        //"useNegativeColorIfDown": true,
        //"balloonText": "[[category]]<br><b>value: [[value]]</b>",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletBorderColor": "#111111",
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "lineColor": "#67b7dc",
        //"negativeLineColor": "#67b7dc",
        "valueField": "nighttemp"
    }],
    /*
    "chartScrollbar": {
        "scrollbarHeight": 5,
        "backgroundAlpha": 0.1,
        "backgroundColor": "#868686",
        "selectedBackgroundColor": "#67b7dc",
        "selectedBackgroundAlpha": 1
    },
    */
    "chartCursor": {
        "zoomable": false,
        "valueLineEnabled": true,
        "valueLineBalloonEnabled": true
    },
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true,
        "axisAlpha": 0,
        "minHorizontalGap": 60
    },
    legend: {
      bulletType: "round",
      equalWidths: false,
      valueWidth: 120,
      useGraphSettings: true,
      color: "#FFFFFF"
    },

    "export": {
        "enabled": true
    }
});

//chart.addListener("dataUpdated", zoomChart);
//zoomChart();

// function zoomChart() {
//     if (chart.zoomToIndexes) {
//         chart.zoomToIndexes(130, chartData.length - 1);
//     }
// }
</script>

<body>

<div id="chartdiv"></div>

</body>
</html>
