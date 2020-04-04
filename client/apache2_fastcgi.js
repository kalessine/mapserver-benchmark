import 'ol/ol.css';
import Map from 'ol/Map';
import View from 'ol/View';
import {getWidth} from 'ol/extent';
import TileLayer from 'ol/layer/Tile';
import {get as getProjection} from 'ol/proj';
import OSM from 'ol/source/OSM';
import TileWMS from 'ol/source/TileWMS';
import TileGrid from 'ol/tilegrid/TileGrid';


var projExtent = getProjection('EPSG:3857').getExtent();
var startResolution = getWidth(projExtent) / 256;
var resolutions = new Array(22);
for (var i = 0, ii = resolutions.length; i < ii; ++i) {
  resolutions[i] = startResolution / Math.pow(2, i);
}
var tileGrid = new TileGrid({
  extent: [-22307382.3347,-15380353.0834,23246640.5383,16789240.3888],
  resolutions: resolutions,
  tileSize: [512, 256]
});

var layers = [
  new TileLayer({
    source: new OSM()
  }),
  new TileLayer({
    source: new TileWMS({
      url: 'http://localhost/cgi-bin/mapserv?map=/data/map.map',
      params: {'LAYERS': 'raster,points', 'TILED': true, 'TRANSPARENT':true},
      serverType: 'mapserver',
      tileGrid: tileGrid
    })
  })
];
var map = new Map({
  layers: layers,
  target: 'map',
  view: new View({
    center: [-10997148, 4569099],
    zoom: 4
  })
});

