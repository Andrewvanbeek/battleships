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

         $("#opponent").one("click", ".space", function(e){
      e.preventDefault();

      var $shot = $(this);
      var x_coord = $shot.attr("value");
      var y_coord = $shot.closest("tr").attr("value");
      var data = {shot: {x_coord: x_coord, y_coord: y_coord}};

      $.ajax({
        url: window.location.pathname + '/shots',
        method: "POST",
        data: data
      }) .fail(function() {
      }) .done(function(data) {
        $shot.addClass("miss");

      });
  })





      }
      console.log(data.ready)
      setTimeout(updateShots, 10);
    });

  };
  setTimeout(updateShots, 10);

});


