var myUls;
var listDiv;
function addMyJumps() {
  myUls = $("ul:has(a.mine)");
  listDiv = $(".jumpList");
  listDiv.hide();
  myUls.on("click", "a.mine", function(e) {
    e.preventDefault();
    var link = $(this).attr("href");
    listDiv.toggle("fast", function(){
      listDiv.load(link);
    })
  })
};

function addOtherJumps() {
  otherUls = $("ul:has(a.others)");
  listDiv = $(".jumpList");
  listDiv.hide();
  otherUls.on("click", "a.others", function(e) {
    e.preventDefault();
    var link = $(this).attr("href");
    listDiv.toggle("fast", function(){
      listDiv.load(link);
    })
  })
};