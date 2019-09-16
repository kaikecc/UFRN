class brobotic{

constructor(){
  this.origem_x = windowWidth/2;
  this.origem_y = 550;

  this.r = 20;
  this.L0 = 43;// 4,3cm
  this.L1 = 25;// 2,5cm
  this.L2 = 147; // 14,3*this.r5cm
  this.L3 = 184; //18.325cm
  this.L4 = 86; // 8.5725

  this.center0 = [this.origem_x,this.origem_y];
  this.center1 = [this.origem_x,this.origem_y - (this.L0+(3/2)*this.r)];
  this.center2 = [this.origem_x, this.origem_y -(this.L0+this.L1+3*this.r)];
  this.center3 = [this.origem_x,this.origem_y - (this.L0+this.L1+this.L2+this.r+3*this.r)];
  this.center4 = [this.origem_x,this.origem_y - (this.L0+this.L1+this.L2+this.L3+3*this.r)];
  this.center5 = [this.origem_x,this.origem_y - (this.L0+this.L1+this.L2+this.L3+this.L4+3*this.r)];


 this.tetha1 = PI/2;
 this.tetha2 = PI/2;
 this.tetha3 = PI/2;
 this.tetha4 = PI/2;
}
move(px,py){

if (mouseIsPressed) {
  if(dist(px, py, this.center0[0], this.center0[1]) < this.r){
        this.center0[0] = px;
        this.center0[1] = py;
  console.log("Px: "+this.center0[0]+" "+ "Py: "+ this.center0[1]);
         }
  else if(dist(px, py, this.center1[0], this.center1[1]) < this.r){
    this.center1[0] = px;
    this.center1[1] = py;
  }
  else if(dist(px, py, this.center2[0], this.center2[1]) < this.r){
    this.center2[0] = px;
    this.center2[1] = py;
  }
  else if(dist(px, py, this.center3[0], this.center3[1]) < this.r){
    this.center3[0] = px;
    this.center3[1] = py;
  }
  else if(dist(px, py, this.center4[0], this.center4[1]) < this.r){
    this.center4[0] = px;
    this.center4[1] = py;
  }
  else if(dist(px, py, this.center5[0], this.center5[1]) < this.r){
    this.center5[0] = px;
    this.center5[1] = py;
  }

  else {
  console.clear();
  }
}

}

tf_direta(){

var T01 = [[cos(this.tetha1), -sin(this.tetha1), 0, 0],
           [sen(this.tetha1), cos(this.tetha1), 0, 0],
           [0, 0 , 1, this.L1+this.L0],
           [0, 0, 0 , 1]];

var T12 = [[cos(this.tetha2), -sin(this.tetha2), 0, 0],
           [0, 0, -1, 0],
           [sin(this.tetha2),cos(this.tetha2), 0, 0],
           [0, 0, 0 , 1]];

var T23 = [[cos(this.tetha3), -sin(this.tetha3), 0, this.L2],
           [sin(this.tetha3), cos(this.tetha3, 0, 0)],
           [0, 0, 1, 0],
           [0, 0, 0, 1]];
var T34 = [[cos(this.tetha4), -sin(this.tetha4), 0, this.L3],
           [sin(this.tetha4), cos(this.tetha4), 0, 0],
           [0, 0, 1, 0],
           [0, 0, 0, 0, 1]];

var T45 = [[1, 0, 0, this.L4],
           [0, 1, 0, 0],
           [0, 0, 1, 0],
           [0, 0, 0, 1]];


}

show(){


 strokeWeight(4);

 line(this.center0[0], this.center0[1], this.center0[0], this.center0[1] - this.L0);

 triangle(this.center0[0],this.origem_y - this.L0, this.origem_x - this.r, this.center1[1], this.origem_x + this.r, this.center1[1]);
 triangle(this.center0[0],this.origem_y - (this.L0 + 3*this.r), this.origem_x - this.r, this.center1[1], this.origem_x + this.r, this.center1[1]);

 line(this.origem_x, this.origem_y - (this.L0 + 3*this.r),this.origem_x, this.origem_y -(this.L0+this.L1+3*this.r)); //


 ellipse(this.origem_x, this.origem_y -(this.L0+this.L1+3*this.r), this.r, this.r);//junta
 point(this.origem_x, this.origem_y -(this.L0+this.L1+3*this.r));


line(this.origem_x, this.origem_y -(this.L0+this.L1+3*this.r+(this.r/2)), this.center3[0],this.center3[1]);

ellipse(this.center3[0],this.center3[1], this.r, this.r);//junta
point(this.center3[0],this.center3[1]);

line(this.center3[0],this.center3[1]-this.r/2,this.center4[0],this.center4[1]);

ellipse(this.center4[0],this.center4[1], this.r, this.r);//junta
point(this.center4[0],this.center4[1]);

line(this.center4[0],this.center4[1]-(this.r/2), this.center5[0],this.center5[1]);

ellipse(this.center5[0],this.center5[1], this.r, this.r);//junta
  point(this.center5[0],this.center5[1]);


}

}
