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
  console.log(ajaxcall);
  var objects = ajaxcall.responseJSON;
  var mapped = objects.map(function(x){
    // var userinfo = {};
    // return x.email;
     return {label: x.email, value: x.id};
  });
  console.log(mapped);
 // var availableTags = ["hi", "bye", "hippo"];
   $('#usersearchbox').autocomplete({
     source: mapped,
     // source: availableTags,
    select: function(event, ui){
      event.preventDefault();
      // console.log(User.all);
      console.log(ui);
      url = "/user/"+ ui.item.value;
      window.location = url;

    }
  });

   // $('#usersearchbox').on("autocompleteselect", function(event, ui){
   //  console.log("the" + ui.item + " was selected");
   // });



});

