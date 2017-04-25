
<?php
include 'functions.php';

$id = 14;
$dest = ("Keystone,CO");
$conditions = get_conditions($id);
$daymax = day_temp($id);
$nightmin = night_temp($id);
$tempunit = temp_unit($id);
$snowdepth = upper_snow($id);
$commute = get_drive_time("Boulder,CO",$dest);
$pow = get_pow("Boulder,CO",$dest, $snowdepth);

?>

<body>
<head>
  <meta charset="utf-8" />
<title>Keystone</title>

<li><iframe
  width="550"
  height="400"
  align ="right"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc&q=Keyston+Ski+Resort,Keyston+CO" allowfullscreen>
</iframe></li>


  <link rel="stylesheet" type="text/css" href="style/main.css" />
</head>
<section id="pagecontent">

<div id="header">
<h1>Snow reports</h1>
</div>

<div id="nav">
<li><a href="index.php">Aspen</a></li>
<li><a href="Keystone.php">Keystone</a></li>
<li><a href="Monarch.php">Monarch Mountain</a></li>
</div>
<div id="section">
<h2>Keystone</h2>

<?php echo "POW/COMMUTE RATIO: $pow"?>
<br>
<?php echo "Current Conditions: $conditions"?>
<br>
<?php echo "Max Temperature For Day: $daymax $tempunit"?>
<br>
<?php echo "Min Temperature For Night: $nightmin $tempunit"?>
<br>

<h3> Map to Destination </h3>



</div>

</body>
</html>
