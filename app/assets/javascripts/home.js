
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
    var defaultValue = $('.default-portfolio-input').val();
    $(this).val(defaultValue);
    $('.add-investment', $(this).parent()).show();
  });

  $('.estimate-returns').hide();

  $('.loan-table-row').mouseenter(function(){
    // var original_background = this.css("background-color");
    $(this).css("background-color", "#428bca");
    $('.estimate-returns', $(this)).show();
  }).mouseleave(function(){
    $(this).css("background-color", "#fff");
    $('.estimate-returns', $(this)).hide();
  });

  $('.investment-input').keyup(function(){
    console.log('input change');
    var investment = $(this).val();
    console.log("ivestment", investment)
    var $rate = $(this).parent().parent().parent().parent().find('.rate').val();
    console.log("rate", $rate);
    var returns = (parseFloat(investment)*parseFloat($rate)/100.0).toFixed(2);
    console.log("returns", returns)
    $('.investment-estimate').text(returns);
  });

  $("#loansTable").tablesorter({
    theme : 'blue',
    // sort on the first column and second column in ascending order
    sortList: [[5,1]]
  });

  $("#lenderTable").tablesorter({
    theme : 'blue',
    // sort on the first column and second column in ascending order
    sortList: [[0,0]]
  });

});
