$(document).on('ready page:load', function () {
 $("#opponent").on("click", ".space", function(e){
      e.preventDefault();

      var $shot = $(this);
      var x_coord = $shot.attr("value");
      var y_coord = $shot.closest("tr").attr("value");
      var data = {x_coord: x_coord, y_coord: y_coord};
      console.log(x_coord)
      console.log(y_coord)

      $.ajax({
        url: '/shots',
        method: "POST",
        data: data
      }) .fail(function() {
      }) .done(function(data) {
        $shot.addClass("miss");
      });
  })
});
