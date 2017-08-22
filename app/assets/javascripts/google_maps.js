  function getGoogleID(search_term) {
    var map = new google.maps.Map(document.createElement('div'), {
      center: this_rest,
      zoom: 15
    });

    var request = {
      location: this_rest,
      radius: '100',
      type: ['restaurant'],
      query: search_term
    };
    var infowindow = new google.maps.InfoWindow();
    var service = new google.maps.places.PlacesService(map);
    service.textSearch(request, callback);
    function callback(result) {
      result = result.shift();
    //make an ajax call -> update our restaurauasdiaser.google_id with place_id
    updateGoogleID(result.place_id,'/restaurants/'+Rid)
    map_init(result.place_id) // this is technically our google_id
  }
}

function map_init(place_id) {
  var map = new google.maps.Map(document.getElementById('map-container'), {
    center: this_rest,
    zoom: 15
  });

  var infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);

  service.getDetails({
    placeId: place_id
  },
   function callback(result, status) {
    updateRestaurantInfo(result)
    ///// Its placing the Marker///////
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      var marker = new google.maps.Marker({
        map: map,
        position: result.geometry.location
      });
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<div><strong>' + result.name + '</strong><br>' +
          result.formatted_address + '</div>');
        infowindow.open(map, this);
      });
    }
  });
 }


$( document ).ready(function() {
  if($('#map-container').length >= 1){
    if (google_id == "")  {
      getGoogleID(resName)
    } else  {
      map_init(google_id)
    }

});


//_____________________________________________________________________________________

