$(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  

});


function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

/**** Sets the delay for the flash message ***/
$(function() {
   $('#flash').delay(500).fadeOut(2000); 
});

/*** show image on mouseover ***/ 

$(document).ready(function() {
  $('.lineitem').mouseover(function(){
      $('.deleteimage').show();
  // $('#lineitem<%= @line_item.id %>').mouseover(function(){
  //   $('.deleteimage').show();
  });
  $('.lineitem').mouseout(function(){
    $('.deleteimage').hide();
  });
});
