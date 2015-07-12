$(document).ready(function(){

  var currentid= $('#friendshipid').html();
  console.log(currentid);
  var currentemail= $('#friendemail').html();
  console.log(currentemail);

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
  $('#'+currentid).hide();
  $('#friendslist').append("<a href='/user/'"+currentid+">Profile</a> "+ currentemail+ "<a rel='nofollow' data-method='DELETE' href='/friendships/'"+currentid+">Remove Friend</a>");
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
    $('#'+currentid).hide();
  });

});