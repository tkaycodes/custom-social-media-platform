$(document).ready(function(){

  var currentid= $('#friendshipid').html();
  console.log(currentid);

  $('#accept_request').click(function(){
    console.log(currentid);
    // console.log('hi');
    console.log();
    $.ajax({
      url: '/friendships',
      dataType: 'json',
      method: 'put',
      data: {id: currentid, state: "accepted"},
      success: function(result){
        console.log(result);
      }
    });
  });

  $('#decline_request').click(function(){
    console.log(currentid);
    $.ajax({
      url: '/friendships',
      dataType: 'json',
      method: 'put',
      data: {id: currentid, state: "declined"},
      success: function(result){
        console.log(result);
      }
    });
  });

});