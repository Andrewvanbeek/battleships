$(".space").on("submit", function(e){
      e.preventDefault();

      var $shot = $(this);
      var x_coord = $shot.attr("value");
      var y_coord = $shot.closest("tr").attr("value")

      $.ajax({
        url: '/shots',
        method: "POST",
        data: {param1: 'value1'},
        })
       .fail(function() {
      })
      .done(function(data) {
      });
  })
