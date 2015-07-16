$(document).ready(function(){

$('.messageemail').click(function(){
  alert('hi');
  var messageid= $('.messageid').html();
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
