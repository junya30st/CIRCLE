$(function(){
  $('.section-all--index__wrap__contents__content').css({
      opacity : 0,
      transform: 'translateY('+ 50 +'px)',
      transition: 800 + 'ms',
    });


  $(window).on('scroll load',function (){
      $('.section-all--index__wrap__contents__content').each(function(){
          var targetElement = $(this).offset().top;
          var scroll = $(window).scrollTop();
          var windowHeight = $(window).height();
          if (scroll > targetElement - windowHeight + 200){
              $(this).css('opacity','1');
              $(this).css('transform','translateY(0)');
          }
      });
  });
});

$(document).ready(function() {
  $('.section-all--index__wrap__contents__content--image').error(function() {
      $(this).attr({
          src: '/images/noImage.png',
          alt: 'no image'
      });
  });
});