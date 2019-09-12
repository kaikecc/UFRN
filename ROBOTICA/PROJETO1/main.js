let Brobotic;

function setup(){
  createCanvas(windowWidth, windowHeight);
 Brobotic = new brobotic();
}

function draw(){
background(255,255,255);
//Brobotic.move();
Brobotic.show();


textSize(32);
text(mouseX, 10, 30);
text(mouseY, 10, 60);
text(windowWidth/2, 10, 90);
text(windowHeight/2, 10, 120);

}
