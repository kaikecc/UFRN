import processing.serial.*;

 Serial myPort;
 
int origem_x = 400, origem_y = 550;
  
float L0 = 43, L1 = 25, L2 = 147, L3 = 184, L4 = 86, r = 20;
  
float tetha1 = 90, tetha2 = 90, tetha3 = 90, tetha4 = 90;


 PVector center0 = new PVector(0,0);
 
 PVector v2 = new PVector(0, -(L0 + L1+ 3*r));
 PVector v3 = new PVector(0, -(L0 + L1+ L2 + 3*r));
 PVector v4 = new PVector(0, -(L0 + L1+ L2 + L3 + 3*r));
 PVector v5 = new PVector(0, -(L0 + L1+ L2 + L3 + L4 + 3*r));
    
  void setup() {
    size(800, 600);
 
     
 //  String portName = Serial.list()[0];
 //  myPort = new Serial(this, portName, 9600);
 
 //  println(portName);
         
     // print((v3.sub(v2)).mag());
  }
  
  void draw() {
  
    background(255);
     translate(origem_x, origem_y);

   show();
    move(mouseX  - origem_x, mouseY  - origem_y);
   
  }
  void move(float px,  float py){
    PVector mouse = new PVector(px,py);
    
    tetha1 = PVector.angleBetween(center0, v3);
    tetha1 = PVector.angleBetween(center0, v3);
    
    if(mousePressed){
      
       
   
   if(dist(mouse.x, mouse.y, v3.x, v3.y) < r)
    { 
      float a = PVector.angleBetween(v2, v3);
      println(degrees(a));//147
      v3.sub(center0);
        mouse.normalize();
        mouse.mult(275);
       mouse.setMag(275);
    // mouse.limit(275);
       v3.set(mouse.x,mouse.y);
    }
    
    /*
    else if(dist(mouse.x, mouse.y, v4.x, v4.y) < r){
       
       v4.sub(center0);
       mouse.normalize();
        mouse.mult(459);
     mouse.setMag(459);
       v4.set(mouse.x,mouse.y);
    }
   
    if(dist(mouse.x, mouse.y, v5.x, v5.y) < r){
       v5.sub(center0);
       mouse.normalize();
        mouse.mult(545);
     mouse.setMag(545);
       v5.set(mouse.x,mouse.y);
  
    }
    */
    }
    
   
  }
  void show(){
     strokeWeight(4);

   
    line(0, 0, 0, -(L0 + r)); // ELO: L0
  
    // *********** JUNTA DA OMBRO  ******************
    triangle(0, -L0, - r/2, -(L0 + r), r/2, -(L0+r));
    triangle(0,  -(L0 + 2*r),- r/2, -(L0 + r), r/2, -(L0+r));
  
    
    
    line(0, -(L0 + 2*r), v2.x, v2.y); // EL0: L1
    
   
    // *********** JUNTA COTOVELO ***************
    ellipse(v2.x,v2.y,r,r);
    point(v2.x,v2.y);
 

    
    line(0,-(L0 + L1+ 4*r)+r/2, v3.x, v3.y);// ELO: L2
    
      // ***************** JUNTA PUNHO *************
    ellipse(v3.x,v3.y,r,r);
    point(v3.x,v3.y);

    /*
   
   line(v3.x,v3.y - r/2, v4.x, v4.y); // ELO: L3
   
   // ************ JUNTA GARRA *****************
    ellipse(v4.x,v4.y,r,r);
    point(v4.x,v4.y);
 
     
   line(v4.x,v4.y - r/2, v5.x, v5.y); // ELO: L4
    
    // **************** FERRAMENTA ******************************
    ellipse(v5.x,v5.y,r,r);
    point(v5.x,v5.y);
    
      /*
   // myPort.write(65);
   
   
    */
   

     
 
  }
  /*
  void mouseClicked() {
  myPort.write("#0P1500");
  println("ENVIADO");
}
*/
