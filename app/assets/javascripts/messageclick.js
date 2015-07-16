$(document).ready(function(){


$(".messageemail").click(function(){
  var messageid = $(this).data('id');
   alert(messageid);
  console.log(messageid);
  $.ajax({
    method: 'PUT',
    url: '/messages/'+messageid,
    dataType: 'json',
    data: {message: {status: "Read"}},
    success: function(result){
      console.log(result);
    },
    error: function(result){
      console.log(result);
    }
  });
});
});
