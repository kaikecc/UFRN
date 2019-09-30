PImage ombro_1;

PVector v1 = new PVector(0, 0);
PVector v2 = new PVector(0, 0);
PVector v3 = new PVector(0, 0);
//PVector center = new PVector(0, 0);
float a = PI/2;
float center_x = 0;
float center_y = 0;

void setup() {
  size(550, 400);

  ombro_1 = loadImage("65-75.jpg");
  rectMode(CENTER);
}


void draw() {
  background(0);
  strokeWeight(4);
  image(ombro_1, 0, 0);
  translate(center_x, center_y);

  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      println("CENTRO MARCADO");
      // center.set(mouseX, mouseY);
      center_x = mouseX;
      center_y = mouseY;
    } else if (key == '1') {
      println("VETOR 1 MARCADO");
      v1.set(mouseX, mouseY);
    } else if (key == '2') {
      println("VETOR 2 MARCADO");
      v2.set(mouseX, mouseY);
    }
  } 



  line(0, 0, v1.x - center_x, v1.y - center_y);
  line(0, 0, v2.x - center_x, v2.y -  center_y);



  a = PVector.angleBetween(v1, v2);

  println("ANGULO ENTRE V1 e V2: ", degrees(v1.heading()) - degrees(v2.heading()));
  println("V1: ", degrees(v1.heading()), " - ", "V2: ", degrees(v2.heading()));
}
