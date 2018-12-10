// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery.slick
//= require activestorage
//= require initialize
//= require bootstrap-sprockets
//= require turbolinks

$(document).ready(function(){
  $.ajax({
    type: 'get',
    url: '/admin/books',
    dataType: 'json',
    success: function(data){
    }
  });
  $('.scroller').slick({
      autoplay: false,
      slidesToScroll: 1,
      slidesToShow: 2,
      infinite:false,
      nextArrow: '<div class="slick-next"><i class="material-icons">keyboard_arrow_right</i></div>',
      prevArrow: '<div class="slick-prev"><i class="material-icons">keyboard_arrow_left</i></div>',
      responsive: [
      {
        breakpoint: 991,
        settings: {
          centerMode: false,
          centerPadding: '40px',
          slidesToShow: 2,
          speed: 10,
          draggable:false,
          swipe:false,
        }
      },
      {
        breakpoint: 768,
        settings: {
          centerMode: true,
          centerPadding: '40px',
          slidesToScroll: 1,
          slidesToShow: 1,
          speed: 10,
          draggable:false,
          swipe:false,

        }
      },
      {
        breakpoint: 480,
        settings: {
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 1,
          speed: 10,
          draggable:false,
          swipe:false,

        }
      }
      ]
    })
});

