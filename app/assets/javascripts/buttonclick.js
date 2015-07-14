$(document).ready(function(){

  // var friendid  = @friend.id

  var currentid= $('#friendshipid').html();
  console.log(currentid);
  var currentemail= $('#friendemail').html();
  console.log(currentemail);

  $('#accept_request').click(function(){
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
          // $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+">Profile</a>"+ currentemail+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>");
          $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+">+"+"'"+friendid.profile_picture+"'+"+currentemail+"'"+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>"
                                      
                                  );
       }
    });

    var ajaxcall2 = $.ajax({
      url: '/friendships',
      dataType: 'json',
      method: 'get',
      data: {id: currentid, state: "accepted"},
      success: function(result){
        console.log(result);
        // return // var friend_id = console.log(result.friend_id);
          $('#'+currentid).hide();
          // $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+">Profile</a>"+ currentemail+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>");
          $('#friendslist').append("<a href='/user/"+result.friend_id+"'"+">+"+"'"+friendid.profile_picture+"'+"+currentemail+"'"+"<a rel='nofollow' data-method='DELETE' href='/friendships/"+currentid+"'"+">Remove Friend</a>"
                                      
                                  );
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
    $('#'+currentid).hide();
  });

});