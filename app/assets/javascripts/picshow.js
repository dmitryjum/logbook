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
}