// app/javascript/packs/map.js
import GMaps from 'gmaps/gmaps.js';


const styles = [{
        "featureType": "landscape",
        "stylers": [
            {
                "hue": "#FFBB00"
            },
            {
                "saturation": 43.400000000000006
            },
            {
                "lightness": 37.599999999999994
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.highway",
        "stylers": [
            {
                "hue": "#FFC200"
            },
            {
                "saturation": -61.8
            },
            {
                "lightness": 45.599999999999994
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "stylers": [
            {
                "hue": "#FF0300"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 51.19999999999999
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.local",
        "stylers": [
            {
                "hue": "#FF0300"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 52
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "hue": "#0078FF"
            },
            {
                "saturation": -13.200000000000003
            },
            {
                "lightness": 2.4000000000000057
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "poi",
        "stylers": [
            {
                "hue": "#00FF6A"
            },
            {
                "saturation": -1.0989010989011234
            },
            {
                "lightness": 11.200000000000017
            },
            {
                "gamma": 1
            }
        ]
    }];



const mapElement = document.getElementById('map');
const writerInfoElement = document.getElementById('writer-info')

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  console.log(markers)

  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

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


  // map.markers.forEach(function(marker) {
    var infoString = '<div class="avatar-info">'+
            // '<h1 id="Name">'${marker.name}'</h1>'+
              '<div id="bodyContent">'+
              '<p><b>Uluru</b>'+
              '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
              'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
              '(last visited June 22, 2009).</p>'+
              '</div>'+
            '</div>';
  // })

  var infowindow = new google.maps.InfoWindow({
          content: infoString
        });

  map.markers.forEach(function(marker) {
    marker.addListener('click', function() {
      window.location.href = marker.url;
    });

    marker.addListener('mouseover', function() {
      infowindow.open(map, marker);
    });
  });
  // markers.addListener(marker, 'click', function() {
  //   window.location.href = marker.url;
  // });
}
