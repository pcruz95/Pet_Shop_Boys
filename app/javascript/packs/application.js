import "bootstrap";
import "../plugins/flatpickr";
import "./application.css"
import { initFlatPickr } from '../plugins/flatpickr'
import { initMapbox } from "../plugins/init_mapbox.js";
import { getPosition } from "../plugins/mapbox_position.js";
import { scrollNavbar } from "../plugins/scroll_navbar.js";
import { dragMoveListener } from "../plugins/drag_drop.js";

scrollNavbar();
initMapbox();
getPosition();
initFlatPickr();
dragMoveListener();

