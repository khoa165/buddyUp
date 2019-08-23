import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { delegator } from '../functions/photoUploadDelegator';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { loadDynamicBannerText } from '../components/banner';
import { dynamicResponses } from '../components/response';

initMapbox();
delegator();
loadDynamicBannerText();
dynamicResponses();
