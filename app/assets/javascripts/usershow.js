var videoCells;
var videoDiv;
var curLi;
function addVideoContent() {  
  videoCells = $("li:has(a.video)");
  videoDiv = $("<div class='videoContent'>")
  videoCells.on("click", "a.video", function(evt) {
    evt.preventDefault();
    curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
    console.log(curLi);
    curLi.appendChild(videoDiv[0]);
    videoDiv.load($(this).attr("href"))
    console.log(videoDiv);
  });
}
