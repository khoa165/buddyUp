import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { delegator } from '../functions/photoUploadDelegator';
import { scrollLastMessageIntoView } from '../functions/scrollToLastMessage';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { loadDynamicBannerText } from '../components/banner';
import { dynamicResponses } from '../components/response';
import "../plugins/predicthq";

initMapbox();
delegator();
loadDynamicBannerText();
dynamicResponses();
scrollLastMessageIntoView();
