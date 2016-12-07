// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('ready page:load', function () {
   $(".new_shot").on("submit", function(e){
      e.preventDefault();
        $.ajax({
          url: '/shots',
          method: "POST",
          data: {param1: 'value1'},
          })
         .fail(function() {
        })
        .done(function(data) {
          $("form").prepend("<h1>HEY</h1>")
          });
        })
var doStuff = function () {
  $.ajax({
    url: "/shots",
    method: "GET",
    data: {param1: 'value1'},
    })
   .fail(function() {
  })
  .done(function(data) {
    $("#ok").text(data.hey)
    });
};
setInterval(doStuff, 1000);

});