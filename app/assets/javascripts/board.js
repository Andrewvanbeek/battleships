$(document).on('ready page:load', function () {

var updateBoard = function () {
      $.ajax({
        url: window.location.pathname,
        method: "GET"
      })
      .fail(function() {
        setTimeout(updateBoard, 1000);
      })
      .done(function(data) {

        if (data.gameStart){
          $(".new_ship").remove();


            //render all the ships of this player
            var ships = data.playerShips
            ships.forEach(function(ship){
              var Allrow = $("#player tr");
              var good_coord = Math.floor(ship.x_coord);
              var rowToUpdate = Allrow[good_coord];
              var allSpots = $(rowToUpdate).find("td");
              var right_coord = Math.floor(ship.y_coord);
              var shipStart = allSpots[right_coord];
              var end = Math.floor(ship.size);
              var shipEnd = allSpots[end];
               $(shipStart).addClass("perm-placer");
               $(shipEnd).addClass("perm-placer");
               $(shipStart).nextUntil(".perm-placer").addClass("perm-placer");
            })

            //render all the players shots
            var shots = data.playerShots
            shots.forEach(function(shot){
              var Allrow = $("#opponent tr");
              var good_coord = Math.floor(shot.x_coord);
              var rowToUpdate = Allrow[good_coord];
              var allSpots = $(rowToUpdate).find("td");
              var right_coord = Math.floor(shot.y_coord);
              var shotPos = allSpots[right_coord];
              if (shot.hit){
                $(shotPos).addClass("hit");
              } else {
                $(shotPos).addClass("miss");
              }
            })

            //render all opponent shots
            var shots = data.opponentShots
            shots.forEach(function(shot){
              var Allrow = $("#player tr");
              var good_coord = Math.floor(shot.x_coord);
              var rowToUpdate = Allrow[good_coord];
              var allSpots = $(rowToUpdate).find("td");
              var right_coord = Math.floor(shot.y_coord);
              var shotPos = allSpots[right_coord];
              if (shot.hit){
                $(shotPos).addClass("hit");
                $(shotPos).removeClass("perm-placer");
              } else {
                $(shotPos).addClass("miss");
              }
            })

          if(data.player == data.activePlayer){
            // notify player who's turn it is
            $("#playername").text("It's Your Turn")



         //allows active player to make a shot
            $("#opponent").on("click",".space", function(e){
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
              })

              })

           } else {
            $("#playername").text("It's Your Opponents Turn")

            var ships = data.playerShips
            ships.forEach(function(ship){
              var Allrow = $("#player tr")
              var good_coord = Math.floor(ship.x_coord)
              var rowToUpdate = Allrow[good_coord]
              var allSpots = $(rowToUpdate).find("td")
              var right_coord = Math.floor(ship.y_coord)
              var shipStart = allSpots[right_coord]
              var end = Math.floor(ship.size)
              var shipEnd = allSpots[end]
               $(shipStart).addClass("perm-placer")
               $(shipEnd).addClass("perm-placer")
               $(shipStart).nextUntil(".perm-placer").addClass("perm-placer")
            })
          }
        }
        setTimeout(updateBoard, 1000);


      })
    }

  setTimeout(updateBoard, 1000);



})

