// app/javascript/packs/map.js
import GMaps from 'gmaps/gmaps.js';
import SnazzyInfoWindow from 'snazzy-info-window'

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

  map.markers.forEach(function(marker) {

    var contentString = '<div class="map-article">'+
    '<div class="map-article-image" style="background-image: url('+ marker.imageUrl +')"></div>'+
    '<h4 class="map-article-title">'+ marker.latest_article_title +'</h4>'+
    '<h5 class="map-article-user">'+ "👤" + marker.name + " " + marker.location +'</h5>'+
    '</div>'

    // var infowindow = new google.maps.InfoWindow({
    //   content: contentString
    // });

    var info = new SnazzyInfoWindow({
    marker: marker,
    content: contentString,
    closeOnMapClick: false
    });

    marker.addListener('mouseover', function() {
      info.open(map, marker);
    });

    // marker.addListener('mouseout', function() {
    //   infowindow.close();
    // });

    marker.addListener('click', function() {
      window.location.href = marker.url;
    });
  });
}
