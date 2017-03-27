$(document).ready(function() {
$(function(){

$("#btn_card").on("click", function(e){
    // Change active tab
    $(".message-container").removeClass('active');
    $(".message-container").addClass('hidden');
  })
    // $(this).addClass('active');
    //location.hash = $(this).data("target")
    // Hide all tab-content (use class="hidden")
    // $(".tab-content").addClass('hidden');
    // // Show target tab-content (use class="hidden")
    // $($(this).data('target')).removeClass('hidden');

});
});
