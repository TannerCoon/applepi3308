
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
//$pow = get_pow("Boulder,CO",$dest, $snowdepth);

?>

<html>
<body>
<head>
  <meta charset="utf-8" />
<title>Snowbuffs </title>
  <link rel="stylesheet" type="text/css" href="style/main.css" />
</head>
<section id="pagecontent">

<div id="header">
<h1>Snow Reports</h1>
</div>

<li><iframe
  width="550"
  height="400"
  align = "right"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc&q=Aspen+Ski+Resort,Aspen+CO" allowfullscreen>
</iframe></li>

<div id="nav">
<li><a href="index.php">Aspen</a></li>
<li><a href="Keystone.php">Keystone</a></li>
<li><a href="Monarch.php">Monarch Mountain</a></li>
</div>
<div id="section">
<h2>Aspen</h2>
<?php
$orig = ('Boulder,CO');
echo '<input type="text" name="name1" value="'.$orig.'">';
$pow = $pow = get_pow($orig,$dest, $snowdepth);
?>
<br>
<?php echo "POW/COMMUTE RATIO: $pow"?>
<br>
<?php echo "Current Conditions: $conditions"?>
<br>
<?php echo "Max Temperature For Day: $daymax $tempunit"?>
<br>
<?php echo "Min Temperature For Night: $nightmin $tempunit"?>
<br>

<!-- <p id = "status"> Current Aspen ski resort status is  open</p>
<p id = "weather"> Current Aspen ski resort weather is sunny</p>
<p id = "temperature" >The lower temperature is </p>
<p id = "temperature" >The higher temperature is </p> -->
</div>

</body>
</html>
