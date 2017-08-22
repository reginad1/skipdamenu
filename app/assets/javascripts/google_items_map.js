$( document ).ready(function() {
  if($('#map-container2').length >= 1){
      map_init_item(user_location)
  }
})


function map_init_item(place_id) {
  var map = new google.maps.Map(document.getElementById('map-container2'), {
    center: place_id,
    zoom: 11
  });

  var infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);


   for(var i = 0; i < item_data.length; i++) {
    var image = {
    url: 'http://maps.google.com/mapfiles/kml/pal2/icon32.png',
    // This marker is 20 pixels wide by 32 pixels high.
    size: new google.maps.Size(32, 32),
    // The origin for this image is (0, 0).
    origin: new google.maps.Point(0, 0),
    // The anchor for this image is the base of the flagpole at (0, 32).
    anchor: new google.maps.Point(0, 32)
  };
      var this_rest = new google.maps.LatLng(restaurants[item_data[i].restaurant_id].latitude,restaurants[item_data[i].restaurant_id].longitude);
      var resName = restaurants[item_data[i].restaurant_id].name
      var marker = new google.maps.Marker({
        map: map,
        position: this_rest,
        title: resName,
        item: item_data[i].name,
        icon: image
        });
        add_markers(marker, infowindow, map)
      }
}

function add_markers(marker, infowindow, map) {

  google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<div><strong>' + marker.title + '</strong><br>' +
        marker.item + '</div>');
        infowindow.open(map, this);
    })
}






