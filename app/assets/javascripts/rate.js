$(function() {
    $("select").change(function() {
      var student_to_id = ($(this).attr("id").split("_"))[4];

      var interesting_select = $('.compute_avg_'+student_to_id);

      console.log (interesting_select);
      var sum = 0;
      var borneMax = 0;

      for(i=0; i<interesting_select.length; ++i) {
          var entry_id = $(interesting_select[i]).val();
          if(entry_id!="") {
              borneMax++;
              $.getJSON('../entries/' + entry_id, function(data) {

              }).done(function(data) {
                sum = sum+data["real_value"];
              });
          }
      }
      var i=0;
      $(document).ajaxComplete(function() {
        if(i == borneMax-1) {
            console.log("jai pige")
            console.log("je divise " + sum + "et  " + interesting_select.length);
            sum = sum/interesting_select.length;
            $("#avg_"+student_to_id).html(sum.toFixed(2));
            $(".computed_avg").removeClass("hidden");
        }
        i++;
      });


    });
});