$(document).ready(function(){

  // var friendid  = @friend.id
  var profilepicture = $('#userprofilepicture').html();
  console.log(profilepicture);
  // var currentid= $('#friendshipid').html();
  // console.log(currentid);
  var currentemail= $('#friendemail').html();
  console.log(currentemail);

  $('.accept_request').click(function(){
    var currentid=$(this).data("id");
    console.log(currentid);
    // console.log('hi');
    console.log();
    var ajaxcall = $.ajax({
      url: '/friendships',
      dataType: 'json',
      method: 'put',
      data: {id: currentid, state: "accepted"},
      success: function(result){
        console.log(result);
        // return // var friend_id = console.log(result.friend_id);
          $('#'+currentid).hide();
          $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+"><img width='150' height='150' src='"+profilepicture+"'></a>"+currentemail+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>");

          // $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+"><img width='150' height='150' src='/assets/defaultpic-798db6c38393a747c11c1c37e5e5cbe6dbbb042cb5c26acc714b70653659417d.jpg'alt='Defaultpic 798db6c38393a747c11c1c37e5e5cbe6dbbb042cb5c26acc714b70653659417d'></a>"+currentemail+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>");
          // $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+">+"+"'"+friendid.profile_picture+"'+"+currentemail+"'"+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>"                         
       }
    });



  });

  $('.decline_request').click(function(){
    var currentid=$(this).data("id");
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