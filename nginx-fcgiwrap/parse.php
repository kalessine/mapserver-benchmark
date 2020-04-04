<?php
require "knucklelog/KnuckleLog.php";
$i = 0;
$data = new KnuckleLog('./logs/access.log', '%h %l %u %t "%r" %>s %O "%{Referer}i" \"%{User-Agent}i"',$i,100);
// Get array of data & data count
$array = $data->worker();
$wc = $array['totalLines'];
while($i<$wc) {
   $value = $array['data'];
   foreach($array['data'] as $value){
      $path = explode(" ",$value->request)[1];
      $query = str_replace("/cgi-bin/mapserv?map=/data/map.map&","",$path);
      file_put_contents("fastcgi_requests.log",$argv[1]."/cgi-bin/mapserv?map=/data/map.map&".$query."\n",FILE_APPEND);
      file_put_contents("mapserv_php_requests.log",$argv[1]."/service.php?".$query."\n",FILE_APPEND);
      }
$data = new KnuckleLog('./logs/access.log', '%h %l %u %t "%r" %>s %O "%{Referer}i" \"%{User-Agent}i"',$i,100);
// Get array of data & data count
$array = $data->worker();
$i=$i+100;
}
?>
