
window.onscroll = scroll;

function scroll(){
  if(window.pageYOffset > 1){
    $('.navbar-index').removeClass('nav-index-top');
    $('.navbar-index').addClass('nav-index-scroll');
  }else{
    $('.navbar-index').addClass('nav-index-top');
    $('.navbar-index').removeClass('nav-index-scroll');
  }
}

$(document).ready(function(){
  $('.add-investment').hide();

  $('.input-investment').focus(function(){
    console.log("clicked");
    $('.add-investment', $(this).parent()).show();
  });

  $('tr').mouseenter(function(){
    // var original_background = this.css("background-color");
    $(this).css("background-color", "#428bca");
  }).mouseleave(function(){
    $(this).css("background-color", "#fff");
  });


});
