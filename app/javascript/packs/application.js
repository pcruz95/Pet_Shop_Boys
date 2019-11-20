import "bootstrap";
import "../plugins/flatpickr";
import "./application.css"
import { initFlatPickr } from '../plugins/flatpickr'
import { initMapbox } from "../plugins/init_mapbox.js";
import { getPosition } from "../plugins/mapbox_position.js";

initMapbox();
getPosition();
initFlatPickr();
