
document.addEventListener("DOMContentLoaded", function(){
 let thisCanvas = document.getElementById("mycanvas");
 thisCanvas.width = 500;
 thisCanvas.height = 500;
 //this wasn'ts pelled out anywhere in the homework.
 //i shouldnt have to google search
 let thisContext = thisCanvas.getContext("2d");
 thisContext.fillStyle = "rgb(200,0,0)";
 thisContext.fillRect(10, 10, 50, 50);
//  first two args: position x,y third arg: width, fourth arg: height
//Whichsoever argument corresponds to what attribute  should have been spelled
//out on the instruction page. that's why they're called  instructions.

//the fact i needed to call this on the context should have been explained.
thisContext.beginPath();
thisContext.arc(75, 75, 50, 0, Math.PI * 2, true);
thisContext.strokeStyle = "black";
thisContext.lineWidth = 1;
thisContext.stroke();
thisContext.fillStyle = "orange";
thisContext.fill();

thisContext.beginPath();
thisContext.fillStyle = "green";
  thisContext.moveTo(75, 50);
  thisContext.lineTo(100, 75);
  thisContext.lineTo(100, 25);
  thisContext.fill();

});
