// app/javascript/packs/map.js
import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  console.log(markers)


  map.addMarkers(markers);

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  console.log(map.markers)

  map.markers.forEach(function(marker) {
    marker.addListener('click', function() {
      window.location.href = marker.url;
    });
  });
  // markers.addListener(marker, 'click', function() {
  //   window.location.href = marker.url;
  // });
}
