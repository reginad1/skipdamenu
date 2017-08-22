

function map_init_item(place_id) {
  var map = new google.maps.Map(document.getElementById('map-container2'), {
    center: place_id,
    zoom: 10
  });

  var infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);


   for(var i = 0; i < item_data.length; i++) {
      var this_rest = new google.maps.LatLng(restaurants[item_data[i].restaurant_id].latitude,restaurants[item_data[i].restaurant_id].longitude);
      var resName = restaurants[item_data[i].restaurant_id].name
      var marker = new google.maps.Marker({
        map: map,
        position: this_rest,
        title: resName,
        item: item_data[i].name
        });
        add_markers(marker, infowindow, map)
      }
}

function add_markers(marker, infowindow, map) {
  console.log(marker)
  google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<div><strong>' + marker.title + '</strong><br>' +
        marker.item + '</div>');
        infowindow.open(map, this);
    })
}


$( document ).ready(function() {
  if($('#map-container2').length >= 1){
      console.log("you found me")
      map_init_item(user_location)
  }
})

