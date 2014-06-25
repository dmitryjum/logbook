var canvas;
var context;
var radius;
var saveButton;

function canvasFunc(userid) {  
  canvas = document.getElementById('canvas');
  context = canvas.getContext('2d');
  saveButton = $('#save-signature');
  

  canvas.width = 250;
  canvas.height = 80;
  radius = 3;
  
  // switch to be able to drag and keep on putting dots down
  var dragging = false;
  //setting up thikness of connecting line to the width of the dot
  context.lineWidth = radius * 2;
  context.fillStyle = "black";
  context.strokeStyle = "black";

  var putPoint = function(e){
    if (dragging){
      //connects 2 dots in memory
    context.lineTo(e.offsetX, e.offsetY);
    // striking the line between 2 dots on canvas
    context.stroke();
    context.beginPath();
    //creating the dot based on parameters below(in memory)
    context.arc(e.offsetX, e.offsetY, radius, 0, Math.PI*2);
    //placing the dot from memory to canvas
    context.fill();
    //starts that path over
    context.beginPath();
    //begins dot connecting process
    context.moveTo(e.offsetX, e.offsetY);
    }
  };

  var engage = function(e) {
    dragging = true;
    putPoint(e);
  };

  var disengage = function() {
    dragging = false;
    //clearing the current path in order not to lineTo()
    // between dots every time we "mouseup" and "mousedown"
    context.beginPath();
  };
  // puts dot down
  canvas.addEventListener('mousedown', engage);
  // puts dots while dragging
  canvas.addEventListener('mousemove', putPoint);
  // stops putting dots
  canvas.addEventListener('mouseup', disengage);

};

function saveUpdate(userid) {
  var signatureId;
  var signatures;

  function saveSignature(code) {
    $.ajax({
      type: "POST",
      url: "/users/" + userid + "/signatures",
      data: {signature: {"code_url": code}}
    })
  };

  function updateSignature(signatureId, code) {
    $.ajax({
      type: "PUT",
      url: "/users/" + userid + "/signatures/" + signatureId,
      data: {signature: {"code_url": code}}
    })
  };

  function getAllSignatures() {
    $.getJSON("/users/" + userid + "/signatures", function(response) {
      if (response.length > 0){
        signatureId = response[0].id;
      };
      signatures = response.length
      console.log(signatureId);
      console.log(response);
      switchBoard(signatures);
    })
  };

  function switchBoard(signatures) {
    if (signatures === 0) {
        saveButton.click(function(e) {
          e.preventDefault();
          var code = canvas.toDataURL();
          saveSignature(code);
        });
        console.log(signatures)
    } else if (signatures >= 1) {
        saveButton[0].innerText = "Update your signature";
        saveButton.click(function(e) {
          e.preventDefault();
          var code = canvas.toDataURL();
          updateSignature(signatureId, code)
        })
    }
  };

getAllSignatures();
};
