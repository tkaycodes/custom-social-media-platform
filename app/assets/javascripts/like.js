// $(document).ready(function(){
//   console.log($('#likebutton'));
//   console.log("fasfa");
//   $('#likebutton').on("click", function(){
//     console.log("sdfaf");
//   });
//     // alert('hi');
 
// });

$(document).ready(function(){
  $('.likeonindex').click(function(){
    var postid=$(this).data("postid");
    var likebutton=$(this);
    var unlikebutton=$('.unlikeonindex');
    // alert('liked');
    $.ajax({
      // using $this in here, will refer to the ajax call,
      // therefore if i want this as in the like button, use likebutton
      // defined above
      url: 'likes',
      method: 'post',
      dataType: 'json',
      data: {id: postid},
      success: function(data)
      {
      likebutton.hide();
      likebutton.siblings('.unlikeonindex').show();
      console.log('sucess');
      $('.unlikeonindex').data('likeid', data.id);
           console.log(data);
      var col1=likebutton.siblings('.unlikeonindex').parent();
      var col8=col1.siblings('.col-md-8');
      var thumb = col8.find('.fa-thumbs-up');
      var oldval = thumb.html();
      var newval =parseInt(oldval, 10)+1;
      thumb.html(newval);
      },
      error: function(result){
        console.log(result);
        console.log('error');
      }
    });
  });

   $('.unlikeonindex').click(function(){
     // alert('unliked');
      var likeid = $(this).data("likeid");
      console.log(likeid);
      var unlikebutton=$(this);
      var likebutton=$('.likeonindex');

      $.ajax({
        url: 'likes/'+likeid,
        method: 'delete',
        dataType: 'json',
        success: function(data)
        {
        console.log('sucesssfully unliked');
        unlikebutton.hide();
        unlikebutton.siblings(".likeonindex").show();
        var thumb=(unlikebutton.siblings(".likeonindex").parent()).siblings('.col-md-8').find('.fa-thumbs-up');
        var oldval=thumb.html();
        var newval=parseInt(oldval,10)-1;
        thumb.html(newval);
        },
        error: function(error){
          console.log(error);
        }
      });
    });

});
