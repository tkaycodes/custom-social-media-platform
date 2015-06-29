$(document).ready(function(){
  var availableTags = ["hi", "bye"];
  $('#usersearchbox').autocomplete({
    source:  availableTags
    // var keycode = event.keyCode;
    // var character = String.fromCharCode(keycode);
    // var searchvalue = $(this).value;
    // console.log(searchvalue);
    // var searchvalue = (this.value);
    // $.ajax({
    //   url: '/users.json',
    //   dataType: "json",
    //   method: 'get',
    //   success: function(result){
    //     console.log(result);
    //   }
    // });
  });
});

