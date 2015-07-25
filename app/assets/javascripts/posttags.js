$(document).ready(function(){
  $('.post_tagged_user').click(function(){
    // console.log('hi');
    var value = $(this).data('id');
    $.ajax({
      url: '/taggedpost/'+value+'/edit',
      method: 'put',
      dataType: 'json',
      data: {status: "Read"},
      success: function(data)
      {
        console.log(data);
      }
    });
  });

});
