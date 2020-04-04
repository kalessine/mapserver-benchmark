<?php

$request = ms_newowsrequestobj();

$request->loadparams();

ms_ioinstallstdouttobuffer();

$oMap = ms_newMapobj("/data/map.map");

$oMap->owsdispatch($request);

$contenttype = ms_iostripstdoutbuffercontenttype();

if ($contenttype == 'image/png')
   header('Content-type: image/png');

ms_iogetStdoutBufferBytes();

ms_ioresethandlers();

?>
