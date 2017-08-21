function giveRatings(number)  {
  number = Math.round(number)
  number > 5 ? number = 0: number;
  number === null ? number = 0: number;
  star_bad = `<span class="glyphicon glyphicon-star" aria-hidden="true" style="color:black" ></span>`
  star_good = `<span class="glyphicon glyphicon-star" aria-hidden="true" style="color:#EF651A" ></span>`
  rating = ""
  for(var i = 1; i < 6; i++) {
    if ( number < i){
      rating += star_bad
    } else {
      rating += star_good
    }
  }
  return rating
}

function addGooglePictures(place){
  pictures = place.photos
  for (var y = 0; y < pictures.length; y++) {
      picture = `<img src=${pictures[y].getUrl({maxWidth:500})} class="img-thumbnail">
      `
      $("#pictures").prepend(picture)
  }
}
