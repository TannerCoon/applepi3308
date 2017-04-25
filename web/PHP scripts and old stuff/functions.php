<?php

#map_pull function would be used to change the destination displayed on map depending on resort with optimum pow

function map_pull($resort)
{
}

function data_pull($num)
{
  $mongourl = "https://api.mlab.com/api/1/databases/snow/collections/buffs?apiKey=mbr-kRZgMhvMykk7NZfV4r5tRKT04me5";
  $json = file_get_contents($mongourl);
  $json_data = json_decode($json);
  $res = $json_data[(int)$num];
  return $res;
}

function get_drive_time($orig, $dest)
{
  $gapi = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$orig&destinations=$dest&key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc";
  $gjson = file_get_contents($gapi);
  $gdata = json_decode($gjson);
  $commute = $gdata->rows[0]->elements[0]->duration->value;
  return $commute;
}

function get_pow($orig, $dest, $depth)
{
  $commute = get_drive_time($orig, $dest);
  $pow = (((int)$depth * 1000) / ((int)$commute + 1));
  return $pow;
}

function day_temp($num)
{
  $res = data_pull($num);
  $data = $res->weather->forecast[0]->day_max_temp;
  return $data;
}

function night_temp($num)
{
  $res = data_pull($num);
  $data = $res->weather->forecast[0]->night_min_temp;
  return $data;
}

function temp_unit($num)
{
  $res = data_pull($num);
  $data = $res->weather->forecast[0]->temp_unit;
  return $data;
}

function get_conditions($num)
{
  $res = data_pull($num);
  $data = $res->weather->snow_report->conditions;
  return $data;
}

function upper_snow($num)
{
  $res = data_pull($num);
  $data = $res->weather->snow_report->upper_snow_depth;
  return $data;
}
