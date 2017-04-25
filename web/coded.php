
<?php
include 'functions.php';

$id = 0;
$dest = ("Aspen,CO");
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

//$pow = get_pow("Boulder,CO",$dest, $snowdepth);

?>

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
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="https://www.amcharts.com/lib/3/gauge.js"></script>


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

</script>

<script>
var chart = AmCharts.makeChart("gaugediv", {
  "theme": "light",
  "type": "gauge",
  "axes": [{
    "topTextFontSize": 20,
    "topTextYOffset": 70,
    "axisColor": "#31d6ea",
    "axisThickness": 1,
    "endValue": 100,
    "gridInside": true,
    "inside": true,
    "radius": "50%",
    "valueInterval": 10,
    "tickColor": "#67b7dc",
    "startAngle": -90,
    "endAngle": 90,
    // "unit": "%",
    "bandOutlineAlpha": 0,
    "bands": [{
      "color": "#0080ff",
      "endValue": 100,
      "innerRadius": "105%",
      "radius": "170%",
      "gradientRatio": [0.5, 0, -0.5],
      "startValue": 0
    }, {
      "color": "#3cd3a3",
      "endValue": 0,
      "innerRadius": "105%",
      "radius": "170%",
      "gradientRatio": [0.5, 0, -0.5],
      "startValue": 0
    }]
  }],
  "arrows": [{
    "alpha": 1,
    "innerRadius": "35%",
    "nailRadius": 0,
    "radius": "170%"
  }]
});
randomValue()
// setInterval(randomValue, 2000);

// set random value
function randomValue() {
  var pow = parseInt(<?php echo $pow?>);
  var value = Math.round(pow);
  chart.arrows[0].setValue(value);
  chart.axes[0].setTopText(value);
  // adjust darker band to new value
  chart.axes[0].bands[1].setEndValue(value);
}
</script>





<script>
function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 40.015, lng: -105.2705}
        });
        directionsDisplay.setMap(map);
        calculateAndDisplayRoute(directionsService, directionsDisplay);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        directionsService.route({
          origin: 'Boudler,CO',
          destination: '<?php echo $dest?>',
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
      </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc&callback=initMap">
</script>


<body>

<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta charset="utf-8" />
  <title> Aspen </title>
  <!-- <link rel="stylesheet" type="text/css" href="style/main.css" /> -->

</head>
<section id="pagecontent">

<!-- <div id="header">
  <header>
     <h1>Aspen</h1>
  </header>
</div> -->

<!-- <li><iframe
  width="350"
  height="250"
  align = "right"
  frameborder="0" style="border:0"

  src ="https://www.google.com/maps/embed/v1/directions?key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc&origin=Boulder+CO&destination=Aspen+CO&avoid=tolls"

</iframe></li> -->

<!--  src = "https://www.google.com/maps/embed/v1/place?key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc&q=Aspen+Ski+Resort,Aspen+CO" allowfullscreen>

</iframe></li>
-->

<div id="nav">
  <div id="map"></div>
</div>

<div id="gaugediv"></div>
<div id="chartdiv"></div>

<footer>Copyright &copy; Snowbuffs.team</footer>
</body>
</html>
