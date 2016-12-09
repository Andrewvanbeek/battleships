$(document).on('ready page:load', function () {
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
      if(data.ready === true && ($("#playername").attr("name") === data.player1)){
        console.log("IT WAS TRUE")

         $("#opponent").on("click", ".space", function(e){
      e.preventDefault();

      var $shot = $(this);
      var x_coord = $shot.attr("value");
      var y_coord = $shot.closest("tr").attr("value");
      var data = {x_coord: x_coord, y_coord: y_coord};

      $.ajax({
        url: '/shots',
        method: "POST",
        data: data
      }) .fail(function() {
      }) .done(function(data) {
        $shot.addClass("miss");
      });
  })





      }
      console.log(data.ready)
      setTimeout(updateShots, 1000);
    });

  };
  setTimeout(updateShots, 1000);

});


