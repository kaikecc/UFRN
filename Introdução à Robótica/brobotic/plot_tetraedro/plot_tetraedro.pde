
int[] P0 = {276,0,131};
int[] P1 = {297,58,35}; // y trocado de sinal
int[] P2 = {294,-46,30}; // y trocado de sinal
int[] P3 = {236,0,46};

PVector i = new PVector(300,0,0);
PVector j = new PVector(0,-300,0);
PVector k = new PVector(0,0,300);
float angleY, angleZ = PI/2;

void setup()
{
  size(1000, 600, P3D);
 // String[] coordenadas = loadStrings("coordenadas.txt");
//  printArray(coordenadas);
}
void draw(){
 background(0); 

text("P0(27.6049, 0 , 13.0840)",30,30);
text("P1(29.7518, -5.7832 , 3.5395)",30,60);
text("P2(29.3909, 4.6551 , 3.0343)",30,90);
text("P3(23.6088, 0 , 4.61073)",30,120);

push();
translate(100, 450, 0);
scale(1,1,1);


 if (keyPressed) {
    if (key == 'D' || key == 'd') {
       angleY = angleY + 1;
              
    }
      else if (key == 'A' || key == 'a') {
       angleY = angleY - 1;
          
    }
     else if (key == 'W' || key == 'w') {
       angleZ = angleZ + 1;
          
    }
     else if (key == 'S' || key == 's') {
       angleZ = angleZ - 1;
          
    }
     
  } 
  
 
rotateY((PI/4)+angleY);
rotateX(PI/2);
rotateZ(PI/2 + angleZ);


noFill();


stroke(255,0,0); // RED
line(0,0,0,i.x,i.y,i.z);
noStroke();
stroke(0,128,0); // GREEN
line(0,0,0,j.x, j.y,j.z);
noStroke();
stroke(0,0,255); // BLUE
line(0,0,0,k.x,k.y,k.z);
noStroke();

stroke(255);
beginShape();


vertex(P0[0],P0[1],P0[2]); //  P0
vertex(P1[0],P1[1],P1[2]); //  P1
vertex(P2[0],P2[1],P2[2]); //  P2

vertex(P0[0],P0[1],P0[2]); //  P0
vertex(P3[0],P3[1],P3[2]); //  P3
vertex(P1[0],P1[1],P1[2]); //  P1
vertex(P3[0],P3[1],P3[2]); //  P3
vertex(P2[0],P2[1],P2[2]); //  P2


endShape();
pop();
delay(100);
}
