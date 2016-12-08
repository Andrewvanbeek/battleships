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
  $("#opponent").on("click", ".space", function(e){
      e.preventDefault();

      var $shot = $(this);
      var x_coord = $shot.attr("value");
      var y_coord = $shot.closest("tr").attr("value");
      var data = {x_coord: x_coord, y_coord: y_coord};
      console.log($shot);
      console.log(data);

      $.ajax({
        url: '/shots',
        method: "POST",
        data: data,
      }) .fail(function() {
      }) .done(function(data) {

      });
  })

  // var updateShots = function () {
  //   $.ajax({
  //     url: "/shots",
  //     method: "GET",
  //     data: {param1: 'value1'},
  //     })
  //   .fail(function() {
  //     setTimeout(updateShots, 100);
  //   })
  //   .done(function(data) {
  //     $("#ok").text(data.hey)
  //     setTimeout(updateShots, 1000);
  //   });
  // };

  // setTimeout(updateShots, 1000);

});


$( document ).ready(function() {
  $(".new_ship").on("submit", function(e){
  e.preventDefault();

  var newShipForm = $(this)
  var value = newShipForm.find("input")
  var value = $(value[2]).attr("value")
  console.log(value)

  if(value === "carrier"){
    $("#player_1 td").on("click", function(e){
      var size = 5
      e.preventDefault();
      var spot = $(this)
      var row = $(this).closest("tr")
      var rowTableDatas = $(row).children()
      var xCoord = $(row).attr("value")
      var yCoord = $(rowTableDatas).index(spot)
      var endSpot = spot.next().next().next().next()
      $("#player_1 td").removeClass("placer")
      $(endSpot).addClass("placer")
      spot.addClass("placer")
      spot.nextUntil(endSpot).addClass("placer")
      var shipSize = $("#player_1 .placer").length
      var data = {x_coord: xCoord, y_coord: yCoord, size: 5}
      if(shipSize === 5){
        spot.on("dblclick", function(e){
          e.preventDefault();
            $.ajax({
              url: '/ships',
              method: "POST",
              data: data,
              })
             .fail(function() {
            })
            .done(function(data) {
              });
        })
      }
      else {
        alert("destroyer has to be 5 spaces")
      }
    })
  }
  else if(value === "destroyer") {
       $("#player_1 td").on("click", function(e){
      e.preventDefault();
      var spot = $(this)
      var row = $(this).closest("tr")
      var rowTableDatas = $(row).children()
      console.log(rowTableDatas)
      var xCoord = $(row).attr("value")
      var yCoord = $(rowTableDatas).index(spot)
      var data = {classification: "carrier", size: 5, }
    })
  }
  else if(value === "destroyer") {
       $("#player_1 td").on("click", function(e){
      e.preventDefault();
      var spot = $(this)
      var row = $(this).closest("tr")
      var rowTableDatas = $(row).children()
      console.log(rowTableDatas)
      var xCoord = $(row).attr("value")
      var yCoord = $(rowTableDatas).index(spot)
      var data = {classification: "carrier", size: 5, }
    })
  }
})

});
