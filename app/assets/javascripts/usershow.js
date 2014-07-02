var videoCells;
var videoDiv;
var curLi;
var picCells;
var link;
function addVideoContent() {  
  videoCells = $("li:has(a.video)");
  videoDiv = $("<div class='videoContent'>");
  videoCells.on("click", "a.video", function(e) {
    e.preventDefault();
    curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
    console.log(curLi);
    link = $(this).attr("href");
    // videoDiv.empty();
    videoDiv.toggle("fast", function(){
      videoDiv.load(link);
      curLi.appendChild(videoDiv[0]);
    })
  });
};

function deleteVideo(jumpId) {
  var videos = $("div:has(a.delete-video)");
  var videoId;
  var curDiv;
  videos.on("click", "a.delete-video", function(e) {
    e.preventDefault();
    curDiv = this.parentNode;
    videoId = curDiv.id;
    $.ajax({
      type: "DELETE",
      url: "/videos/" + videoId,
      data: {"jump_id": jumpId},
      success: function() {
        curDiv.remove();
      }
    })
  });
}

function addPictureContent() {
  picCells = $("li:has(a.pic-link)");
  picDiv = $("<div class='picContent'>");
  picCells.on("click", "a.pic-link", function(e) {
    e.preventDefault();
    curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
    console.log(curLi);
    var link = $(this).attr("href");
    // picDiv.empty();
    picDiv.toggle("fast", function(){
      picDiv.load(link);
      curLi.appendChild(picDiv[0]);
    })
  })
}