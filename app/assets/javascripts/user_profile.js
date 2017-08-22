$( document ).ready(function() {
  $('#location_edit_form').hide();
  $('#edit_location').click(function(event) {
    $('#location_edit_form').toggle();
  })
  $('#location_edit_form').submit(function(event) {
    $('#location_edit_form').hide();
    // $("#map_tab").show();
    // map_init_item(user_location)
  })
});
