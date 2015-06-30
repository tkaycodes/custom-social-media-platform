$(document).ready(function(){
  var ajaxcall = $.ajax({
      url: '/users.json',
      dataType: "json",
      method: 'get',
      async: false
      // success: function(result){
      //   result.map(function(x){
      //     var availableTags = x.email;
      //     return availableTags;
      //   });
      // }
    });
  var objects = ajaxcall.responseJSON;
  var mapped = objects.map(function(x){
    return x.email;
  });
 // var availableTags = ["hi", "bye", "hippo"];
   $('#usersearchbox').autocomplete({
    source: mapped,
    select: function(event, ui){
      event.preventDefault();
    }
  });

   $('#usersearchbox').on("autocompleteselect", function(event, ui){
    console.log("the" + ui.item + " was selected");
   });



});

