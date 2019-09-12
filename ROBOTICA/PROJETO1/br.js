class brobotic{

constructor(){
  this.origem_x = windowWidth/2;
  this.origem_y = 550;
  this.r = 30;
  this.L0 = 43;// 4,3cm
  this.L1 = 25;// 2,5cm
  this.L2 = 15; // 14,605cm
  this.L3 = 184; //18.325cm
  this.L4 = 86; // 8.5725
  this.tetha1 = PI/4;


}
move(){

}

show(){
  line(windowWidth/2, 550, windowWidth/2, 500);//
  triangle(windowWidth/2,500, 658, 470, 708, 470);
  triangle(windowWidth/2,440, 658, 470, 708, 470);
  line(windowWidth/2, 440, windowWidth/2, 390);

  ellipse(windowWidth/2, 380, 30, 30);//junta
  ellipse(windowWidth/2, 380, 5, 5);//ponto

  line(windowWidth/2, 365, 765, 290);

  ellipse(765, 290, 30, 30);//junta
  ellipse(765, 290, 5, 5);//ponto

  line(775, 280, 905, 230);

  ellipse(905, 230, 30, 30);//junta
  ellipse(905, 230, 5, 5);//ponto

  line(915, 220, 1042, 190);


}
}
