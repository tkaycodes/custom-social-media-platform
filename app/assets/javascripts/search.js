$(document).ready(function(){
  $("#usersearchbox").keyup(function(event){
    // console.log(event);
    console.log($(this).val());
    var typedsearch = $(this).val();
  var ajaxcall = $.ajax({
      // url: '/users.json',
      url: '/finduser/'+typedsearch,
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
     return {label: x.username, desc: x.first_name + " "+ x.last_name, value: x.id};
  });
  console.log(mapped);
 // var availableTags = ["hi", "bye", "hippo"];
   $('#usersearchbox').autocomplete({
     source: mapped,
// focus: function( event, ui ) {
//         $( "#usersearchbox" ).val( ui.item.label );
//         return false;
//       },

     // source: availableTags,
    select: function(event, ui){
      event.preventDefault();
      // console.log(User.all);
      console.log(ui);
      url = "/user/"+ ui.item.value;
      window.location = url;

    }

  }).data("uiAutocomplete")._renderItem =  function( ul, item ) 
       {

         return $( "<li>" )
         .append( "<a>" + "<strong>"+item.label+"</strong>" + "<br>" + "<em>"+item.desc+"</em>" + "</a>" )
         .appendTo( ul );
       };

    // $("#Id").autocomplete().data("uiAutocomplete")._renderItem =  function( ul, item ) 
    //    {
    //      return $( "<li>" )
    //      .append( "<a>" + item.label + "<br>" + item.desc + "</a>" )
    //      .appendTo( ul );
    //    };

   // .autocomplete("usersearchbox")._renderItem = function( ul, item ) {
  //     return $( "<li>" )
  //       .append( "<a>" + item.label + "<br>" + item.desc + "</a>" )
  //       .appendTo( ul );
  //   };

   // $('#usersearchbox').on("autocompleteselect", function(event, ui){
   //  console.log("the" + ui.item + " was selected");
   // });

});



});

