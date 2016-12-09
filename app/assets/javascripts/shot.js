$(document).on('ready page:load', function () {
   var updateShots = function () {
    $.ajax({
      url: window.location.pathname,
      method: "GET",
      data: {param1: 'value1'},
    })
    .fail(function() {
      setTimeout(updateShots, 10);
    })
    .done(function(data) {
      console.log(data.player)
      if(data.ready === true && ($("#playername").attr("name") === data.player)){
        console.log($("#playername").attr("name"))
        console.log("IT WAS TRUE")
        console.log(data.hit_ships)
     $("#opponent").one("click", ".space", function(e){
      e.preventDefault();

      var $shot = $(this);
      var y_coord = $shot.attr("value");
      var x_coord = $shot.closest("tr").attr("value");
      var data = {shot: {x_coord: x_coord, y_coord: y_coord}};

      $.ajax({
        url: window.location.pathname + '/shots',
        method: "POST",
        data: data
      }) .fail(function() {
      }) .done(function(data) {
        $shot.addClass("miss");
         data.hit_ships.forEach(function(ship){
          var Allrow = $("#opponent tr")
          var good_coord = Math.floor(ship.x_coord)
          var rowToUpdate = Allrow[good_coord]
          var allSpots = $(rowToUpdate).find("td")
          var right_coord = Math.floor(ship.y_coord)

          var hitSpot = allSpots[right_coord]
          console.log(hitSpot)
          $(hitSpot).removeClass("miss")
          $(hitSpot).addClass("hit")
        })
         setTimeout(updateShots, 10);
      });
  })
      }
      setTimeout(updateShots, 10);
    });

  };
  setTimeout(updateShots, 10);

});


