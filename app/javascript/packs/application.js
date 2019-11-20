import "bootstrap";
import { initMapbox } from "../plugins/init_mapbox.js";

const getPosition = (event) => {
  navigator.geolocation.getCurrentPosition((data) => {
    const lat = data.coords.latitude;
    const long = data.coords.longitude;
    const coordinates = [long, lat];
    console.log(coordinates);
    initMapbox(coordinates);
  });
}

getPosition();
