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
        data: data
      }) .fail(function() {
      }) .done(function(data) {

      });
  })

  var updateShots = function () {
    $.ajax({
      url: window.location.pathname,
      method: "GET",
      data: {param1: 'value1'},
    })
    .fail(function() {
      setTimeout(updateShots, 100);
    })
    .done(function(data) {
      console.log()
      $("#ok").text(data.hey)
      setTimeout(updateShots, 1000);
    });

  };
  setTimeout(updateShots, 1000);

});

  $( document ).ready(function() {
    $(".new_ship").on("submit", function(e){
      e.preventDefault();
      var button = $(this)
      button.addClass("done")
      $(".new_ship").hide()
      button.show()
      var newShipForm = $(this)
      var url = newShipForm.attr("action")
      var value = newShipForm.find("input")
      var value = $(value[2]).attr("value")
      console.log(value)
      if(value === "carrier"){
        $("#player td").on("click", function(e){
          var size = 5
          e.preventDefault();
          var spot = $(this)
          var row = $(this).closest("tr")
          var rowTableDatas = $(row).children()
          var xCoord = $(row).attr("value")
          var yCoord = $(rowTableDatas).index(spot)
          var endSpot = spot.next().next().next().next()
          $("#player td").removeClass("placer")
          $(endSpot).addClass("placer")
          spot.addClass("placer")
          spot.nextUntil(endSpot).addClass("placer")
          var shipSize = $("#player .placer").length
          var data = {ship: {x_coord: xCoord, y_coord: yCoord, size: 5, classification: value}}
          if(shipSize === 5){
            spot.on("dblclick", function(e){
              e.preventDefault();
              $.ajax({
                url: url,
                method: "POST",
                data: data,
              })
              .fail(function() {
              })
              .done(function(data) {
                $(".new_ship").show()
                $(".placer").addClass("perm-placer")
                $(".perm-placer").removeClass("placer")
                button.addClass("done")
                $(".done").hide()
              });
            })
          }
        else {
          alert("destroyer has to be 5 spaces")
        }
      })
    }

  else if(value === "battleship") {
    $("#player td").on("click", function(e){
      var size = 4
      e.preventDefault();
      var spot = $(this)
      var row = $(this).closest("tr")
      var rowTableDatas = $(row).children()
      var xCoord = $(row).attr("value")
      var yCoord = $(rowTableDatas).index(spot)
      var endSpot = spot.next().next().next()
      $("#player td").removeClass("placer")
      $(endSpot).addClass("placer")
      spot.addClass("placer")
      spot.nextUntil(endSpot).addClass("placer")
      var shipSize = $("#player .placer").length
      var data = {ship: {x_coord: xCoord, y_coord: yCoord, size: 4, classification: value}}
      if(shipSize === 4){
        spot.on("dblclick", function(e){
          e.preventDefault();
          $.ajax({
            url: url,
            method: "POST",
            data: data,
          })
          .fail(function() {
          })
          .done(function(data) {
            $(".new_ship").show()
            $(".placer").addClass("perm-placer")
            $(".perm-placer").removeClass("placer")
            button.addClass("done")
            $(".done").hide()
          });
        })
      }
    else {
      alert("batteship has to be 4 spaces")
    }
  })
}

else if(value === "cruiser") {
$("#player td").on("click", function(e){
  var size = 3
  e.preventDefault();
  var spot = $(this)
  var row = $(this).closest("tr")
  var rowTableDatas = $(row).children()
  var xCoord = $(row).attr("value")
  var yCoord = $(rowTableDatas).index(spot)
  var endSpot = spot.next().next()
  $("#player td").removeClass("placer")
  $(endSpot).addClass("placer")
  spot.addClass("placer")
  spot.nextUntil(endSpot).addClass("placer")
  var shipSize = $("#player .placer").length
  var data = {ship: {x_coord: xCoord, y_coord: yCoord, size: 3, classification: value}}
  if(shipSize === 3){
    spot.on("dblclick", function(e){
      e.preventDefault();
      $.ajax({
        url: url,
        method: "POST",
        data: data,
      })
      .fail(function() {
      })
      .done(function(data) {
        $(".new_ship").show()
        $(".placer").addClass("perm-placer")
        $(".perm-placer").removeClass("placer")
        button.addClass("done")
        $(".done").hide()
      });
    })
  }

else {
  alert("cruiser has to be 3 spaces")
}

})

}
else if(value === "submarine") {
$("#player td").on("click", function(e){
var size = 3
e.preventDefault();
var spot = $(this)
var row = $(this).closest("tr")
var rowTableDatas = $(row).children()
var xCoord = $(row).attr("value")
var yCoord = $(rowTableDatas).index(spot)
var endSpot = spot.next().next()
$("#player td").removeClass("placer")
$(endSpot).addClass("placer")
spot.addClass("placer")
spot.nextUntil(endSpot).addClass("placer")
var shipSize = $("#player .placer").length
var data = {ship: {x_coord: xCoord, y_coord: yCoord, size: 3, classification: value}}
if(shipSize === 3){
spot.on("dblclick", function(e){
  e.preventDefault();
  $.ajax({
    url: url,
    method: "POST",
    data: data,
  })
  .fail(function() {
  })
  .done(function(data) {
    $(".new_ship").show()
    $(".placer").addClass("perm-placer")
    $(".perm-placer").removeClass("placer")
    button.addClass("done")
    $(".done").hide()
  });
})
}

else {
alert("submarine has to be 3 spaces")
}

})

}

else if(value === "destroyer") {
  $("#player td").on("click", function(e){
  var size = 2
  e.preventDefault();
  var spot = $(this)
  var row = $(this).closest("tr")
  var rowTableDatas = $(row).children()
  var xCoord = $(row).attr("value")
  var yCoord = $(rowTableDatas).index(spot)
  var endSpot = spot.next()
  $("#player td").removeClass("placer")
  $(endSpot).addClass("placer")
  spot.addClass("placer")
  spot.nextUntil(endSpot).addClass("placer")
  var shipSize = $("#player .placer").length
  var data = {ship: {x_coord: xCoord, y_coord: yCoord, size: 2, classification: value}}
  if(shipSize === 2){
  spot.on("dblclick", function(e){
    e.preventDefault();
    $.ajax({
    url: url,
    method: "POST",
    data: data,
    })
    .fail(function() {
    })
    .done(function(data) {
      $(".new_ship").show()
      $(".placer").addClass("perm-placer")
      $(".perm-placer").removeClass("placer")
      button.addClass("done")
      $(".done").hide()
    });
    })
}

else {
alert("destroyer has to be 2 spaces")
}

})

}

})

});










