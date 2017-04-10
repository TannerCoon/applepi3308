


<?php
$url = "https://api.mlab.com/api/1/databases/snow/collections/buffs?apiKey=mbr-kRZgMhvMykk7NZfV4r5tRKT04me5";
//$aspen = "https://api.mlab.com/api/1/databases/snow/collections/buffs?q={"_id" : "ObjectId(FFFFFFFFFFFFFFFFFFFF0001)"}&apiKey=mbr-kRZgMhvMykk7NZfV4r5tRKT04me5";
$json = file_get_contents($url);
$json_data = json_decode($json);
$res = $json_data[0];
$conditions = $res->weather->snow_report->conditions;
$daymax = $res->weather->forecast[0]->day_max_temp;
$nightmin = $res->weather->forecast[0]->night_min_temp;
$tempunit = $res->weather->forecast[0]->temp_unit;






//$uri = "mongodb://snowbuffs:snowbuffs3308@ds157380.mlab.com:57380/snow"
// try{
//   $m = new MongoClient("mongodb://snowbuffs:snowbuffs3308@ds157380.mlab.com:57380/snow");
//   $db = $m->selectDB('snow');
//   $collection = $db->selectCollection('buffs');
// }
// catch(MongoConnectionException $e){
//   die("Failed to connect to database".$e->getMessage());
// }
//$id = array('_id' => 'ObjectId(FFFFFFFFFFFFFFFFFFFF0001)')
// $cursor = $collection->find();
// foreach($cursor as $doc){
//   echo ["_id"] . "\n";
// }
// $doc = array("test"=>"test");
// $collection->insert($doc);
?>

<html>
<body>
<head>
  <meta charset="utf-8" />
<title>Snow buffs </title>
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
<h2>Aspen</h2>

<?php echo "Current Conditions: $conditions"?>
<br>
<?php echo "Max Temperature For Day: $daymax $tempunit"?>
<br>
<?php echo "Min Temperature For Night: $nightmin $tempunit"?>


<!-- <p id = "status"> Current Aspen ski resort status is  open</p>
<p id = "weather"> Current Aspen ski resort weather is sunny</p>
<p id = "temperature" >The lower temperature is </p>
<p id = "temperature" >The higher temperature is </p> -->
</div>

</body>
</html>
