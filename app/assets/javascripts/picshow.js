function deleteComment(pictureid) {
  var comments = $("li:has(a.delete_comment)");
    comments.on("click", "a.delete_comment", function(e) {
      e.stopPropagation();
      e.preventDefault();
      var curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
      var commentId = curLi.id;
      $.ajax({
        type: "DELETE",
        url: "/picture_comments/" + commentId,
        data: {"picture_id": pictureid},
        success: function() {
          curLi.remove();
        }
      })
    })
};

function postComment(pictureid, avatar) {
  var commentUl = $("#comment-list ul");
  var commentTextField = $("#picture_comment_comment");
  var commentPostButton = $("#submit-comment");
  commentPostButton.on("click", function(e) {
    e.preventDefault();
    var commentText = commentTextField.val();
    $.ajax({
      type: "POST",
      url: "/pictures/" + pictureid + "/picture_comments",
      data: {picture_comment: {"comment": commentText}},
      success: function(response){
        var newCommentLi = $('<li id="'+ response[0].id + '"><div class="reply_table"><div class="reply_wrapper"><img alt="' + response[1].first_name + '" src="' + avatar + '" class="reply_image" /><div class="reply_info"><p class="reply_author"><strong>' + response[1].first_name + ' ' + response[1].last_name + '</strong></p><p class="prely_text">' + response[0].comment + '</p><p class="reply_date">' + new Date(Date.parse(response[0].created_at)) + '<a class="delete_comment">X</a></p>');
        commentUl.append(newCommentLi);
        commentTextField.val("");
      }
    })
  })
}