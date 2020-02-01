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

// $(function(){
//   let effect_pos = 50; // 画面下からどの位置でフェードさせるか(px)
//   let effect_move = 50; // どのくらい要素を動かすか(px)
//   let effect_time = 800; // エフェクトの時間(ms) 1秒時 = 1000

//   //フェードする前のcssを定義
//   $('.section-all--index__wrap__contents__content').css({
//     opacity: 0,
//     transform: 'trancelateY('+ effect_move +'px)',
//     transition: effect_time + 'ms'
//   });

//   //スクロールまたはロードするたびに実行
//   $(window).on('scroll', function(){
//     let scroll_top = $(this).scrollTop();
//     let scroll_btm = scroll_top + $(this).height();
//     effect_pos = scroll_btm - effect_pos;

//     //effect_posがthis_posを超えた時にエフェクト開始
//     $('.section-all--index__wrap__contents__content').each(function(){
//       console.log('ok')
//       const this_pos = $(this).offset().top;
//       if ( effect_pos > this_pos ){
//         $(this).css({
//           opacity: 1,
//           trnsform: 'trncelateY(0)'
//         });
//       }
//     });
//   });
// });