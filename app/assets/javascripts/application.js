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
//= require activestorage
//= require turbolinks
//= require moment
//= require bootstrap-sprockets
//= require_tree .

//Topに戻るボタン
$(document).on('turbolinks:load', function() {
$(function() {
  $('.back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});


// ハンバーガー
  $(function() {
  $('.hamburger').click(function() {
    $(this).toggleClass('active');

  if ($(this).hasClass('active')) {
    $('.globalMenuSp').addClass('active');
  } else {
    $('.globalMenuSp').removeClass('active');
  }
    });
  });

// アクションが起きると、ハンバーガーを閉じる
  $('#manu a[href]').on('click', function(event) {
        $('.hamburger').trigger('click');
    });

// aboutへのスクロール
  $(function() {
$('a[href^="#"]').click(function() {
  var speed = 1000;
  var href = $(this).attr("href");
  var target = $(href == "#" || href == "" ? 'html' : href);
  var position = target.offset().top + -70;
  $('body,html').animate({
    scrollTop: position
  }, speed, 'swing');
  return false;
});
});

// 浮かび上がらせるアクション
  $(function() {
  var fadeIn = $('.fade-in');
  $(window).scroll(function () {
    $(fadeIn).each(function () {
      var offset = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > offset - windowHeight + 150) {
        $(this).addClass("scroll-in");
      }
    });
  });
});
});