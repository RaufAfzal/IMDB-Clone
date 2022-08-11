$(document).on("turbolinks:load",() =>{
 $("#movies").sortable({
     update: function(e, ui){
        
        $.ajax({
            type: "PATCH",
            url: "/movies/sort",
            data: $(this).sortable('serialize'),
          });
     }
 });
 });



 