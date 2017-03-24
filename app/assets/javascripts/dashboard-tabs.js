$(document).ready(function() {
$(function(){

  // var id = location.hash

  // $(".active").removeClass("active")

  // $(id).addClass("active")

  $(".form").on("submit", function(e){
      // Change active tab
      $(".tab").removeClass('active');
      $("#profile").removeClass('hidden');
      $("#profile").addClass('active');
    });


  $(".tab").on("click", function(e){
    // Change active tab
    $(".tab").removeClass('active');
    $(this).addClass('active');
    //location.hash = $(this).data("target")
    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass('hidden');
    // Show target tab-content (use class="hidden")
    $($(this).data('target')).removeClass('hidden');
  });

});
});
