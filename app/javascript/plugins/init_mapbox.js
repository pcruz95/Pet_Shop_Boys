import mapboxgl from 'mapbox-gl';

const initMapbox = (location) => {
  const mapElement = document.getElementById('map');

  console.log(location);
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = 'pk.eyJ1IjoicGFzZGZwYXNkZiIsImEiOiJjazJlbXp2dmUwNzBmM2xvZWt6d3hxZG9oIn0._ZSpkNCsjuojhqd-LO7FiA';
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: location,
      zoom: 11
    });

    const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
  }
};

export { initMapbox };
