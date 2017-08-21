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
      picture = `<div class="col-lg-6 col-md-6 col-sm-6 center-cropped" style="background-image: url(${pictures[y].getUrl({maxWidth:300,maxHeight:300})});"> </div>
      `
      $("#pictures").prepend(picture)
  }
}
