jQuery(document).on 'turbolinks:load', ->
  $('.scroller').slick({
    dots: true,
    slidesToScroll: 1,
    slidesToShow: 2,
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
      },
      ],
})