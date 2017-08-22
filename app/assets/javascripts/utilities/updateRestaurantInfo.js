function appendGoogleRating(place) {
  $("#rating").append(giveRatings(place.rating))
}

function appendPhoneNumber(place)  {
   $("#phone_number").html(place.formatted_phone_number)
}

function format_hours(hours){
  return `<p> ${hours.join("</p> <p>")} </p> `
}

function appendHours(place)  {
  $("#hours").html(format_hours(place.opening_hours.weekday_text))
}

function appendAddress(place)  {
  $("#address").html(place.formatted_address)
}

function updateRestaurantInfo(place) {
  appendGoogleRating(place)
  appendPhoneNumber(place)
  appendHours(place)
  appendAddress(place)
  addGooglePictures(place)
}

function updateGoogleID(place_id,url) {
  console.log("got here")
  $.ajax({
    method:"put",
    url:url,
    data:{map:place_id}
  })
}
