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
      curLi.appendChild(videoDiv[0]);
      videoDiv.load(link, function() {
      deleteVideo(curLi.id);
      uploadVideo(curLi.id);        
      });
    })
  });
};

function deleteVideo(jumpId) {
  var videos = $("div:has(a.delete-video)");
  videos.on("click", "a.delete-video", function(e) {
    e.preventDefault();
    var curDiv = this.parentNode;
    var videoId = curDiv.id;
     $.ajax({
      type: "DELETE",
      url: "/videos/" + videoId,
      data: {"jump_id": jumpId},
      success: function() {
        curDiv.remove();
        console.log("Deleted!")
      }
    })
  });
}

function uploadVideo(jumpId) {
  var videoForm = $("div:has(form.new_video)");
  videoForm.on("click", "a.submit-video", function(e) {
    e.preventDefault();
    var videoName = videoForm.find("#video_name").val();
    var videoUrl = videoForm.find("#video_video_url").val();
    $.ajax({
      type: "POST",
      url: "/jumps/" + jumpId + "/videos",
      data: {video: {"name": videoName, "video_url": videoUrl}},
      success: function() {
        videoDiv.load(link);
      }
    })
  })
};

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