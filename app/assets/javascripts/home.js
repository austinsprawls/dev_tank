
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

$('.add-investment').hide();

$('.input-investment').click(function(){
  console.log("clicked");
  $('.add-investment').show();
});
