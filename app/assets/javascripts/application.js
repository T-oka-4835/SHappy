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
//= require fullcalendar
//= require bootstrap-sprockets
//= require_tree .
//Topに戻るボタン
document.addEventListener("turbolinks:load", function() {
$(function() {
  $('.back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});
})

// ハンバーガー
document.addEventListener("turbolinks:load", function() {
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
})

$(document).on('turbolinks:load', () => {
   $('#calendar').fullCalendar ({
      header: {
      left: 'prev,next today',
      center: 'month,agendaWeek,agendaDay',
      right: 'title'
            },
            
      buttonText: {
      prev: "<",
      next: ">"
            },

      timezone: 'UTC',
      events: '/stresses.json',
      navLinks: true,
      selectable: true,
      selectHelper: true,
      // 日付クリック
    dayClick : function ( date , jsEvent , view ) {
       $('#inputScheduleForm').modal('show');
           },

      // event クリックで編集、削除
    eventClick : function(event, jsEvent , view) {
       jsEvent.preventDefault();
         $(`#inputScheduleEditForm${event.id}`).modal('show');
          },

    eventMouseover : function(event, jsEvent , view) {
       jsEvent.preventDefault();
          }
        })
  })
