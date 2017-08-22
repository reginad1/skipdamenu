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
  var image = {
  url: 'http://maps.google.com/mapfiles/kml/pal2/icon32.png',
  // This marker is 20 pixels wide by 32 pixels high.
  size: new google.maps.Size(32, 32),
  // The origin for this image is (0, 0).
  origin: new google.maps.Point(0, 0),
  // The anchor for this image is the base of the flagpole at (0, 32).
  anchor: new google.maps.Point(0, 32)
  };
 for(var i = 0; i < restaurants.length; i++) {
  var this_rest = new google.maps.LatLng(restaurants[i].latitude,restaurants[i].longitude);
  var resName = restaurants[i].name
  var items = filter_items(item_data, restaurants[i].id)
  var marker = new google.maps.Marker({
    map: map,
    position: this_rest,
    title: resName,
    item: items,
    icon: image,
    item_url: `/items/${item_data[i].id}`,
    rest_url: `/restaurants/${restaurants[item_data[i].restaurant_id].id}`
    });
    add_markers(marker, infowindow, map)
  }
}
function filter_items(item_data,restaurantsId) {
   let item = item_data.filter(function(item){
    return item.restaurant_id == restaurantsId
  })
   return item
}

function add_markers(marker, infowindow, map) {
  items =""
  for(let y = 0; y < marker.item.length; y++) {
    items += `<div><a href="/items/${marker.item[y].id}"> ${marker.item[y].name}  </a></div>`
  }
  google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(`<div><strong><a href=${marker.rest_url}> ${marker.title} </a></strong>${items}`);
        infowindow.open(map, this);
    })
}






