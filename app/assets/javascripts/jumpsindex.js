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

function changeCounter(jump) {
  var mineField = $("#" + jump.date).find(".mine");
  var mineFieldTextArr = mineField.text().split(" ");
  mineFieldTextArr[2] = parseInt(mineFieldTextArr[2]) - 1;
  if (mineFieldTextArr[2] <= 0) {
    mineField.parent().remove();
  } else {
    mineField.text(mineFieldTextArr.join(" "))
  };
};

function signJump(userFirstName, userLastName) {
  var signLi = $("li:has(a.sign-jump)");
  var jumpId;
  var curLi;
  var curTd;
  signLi.on("click", "a.sign-jump", function(e) {
    e.preventDefault();
    curTd = this.parentNode;
    curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
    jumpId = curLi.id;
    $.getJSON("/jumps/" + jumpId + "/sign", function(response) {
      var signature = response;
      $(curTd).empty();
      $(curTd).append("The jump was signed by " + userFirstName + " " + userLastName + "<div class='signature'><img src=" + signature.code_url + "></div>");
    })
  })
}

function deleteJumpUsershow(userid) {
  var deleteLi = $('li:has(a.delete-jump)');
  var jumpId;
  var curLi;
  deleteLi.on("click", "a.delete-jump", function(e) {
    e.preventDefault();
    curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
    jumpId = curLi.id;
    $.ajax({
      type: "DELETE",
      url: "/jumps/" + jumpId,
      success: function() {
        curLi.remove();
      }
    })
  })
};

function deleteJumpJumpday(userid) {
  var deleteLi = $('li:has(a.delete-jump)');
  var jump;
  var jumpId;
  var curLi;
  deleteLi.on("click", "a.delete-jump", function(e) {
    e.preventDefault();
    curLi = this.parentNode.parentNode.parentNode.parentNode.parentNode;
    jumpId = curLi.id;
    $.getJSON("/jumps/" + jumpId, function(response) {
      jump = response;
    });
    $.ajax({
      type: "DELETE",
      url: "/jumps/" + jumpId,
      success: function() {
        curLi.remove();
        changeCounter(jump);
      }
    })
  })
};