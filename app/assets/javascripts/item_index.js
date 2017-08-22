$( document ).ready(function() {
  $('#map_tab').hide();
  $('#tab2_map').click(function(event) {
    $('.text-list').hide();
    if ($(".init-Map").length == 0) {
      $('#map_tab').show();
        map_init_item(user_location)
      $('#map_tab').addClass("init-Map")
    } else{
        $('#map_tab').show();

    }

  })

  $('#tab1').click(function(event) {
    $('.text-list').show();
    $('#map_tab').hide();
    // $("#map_tab").show();
    // map_init_item(user_location)
  })
})
