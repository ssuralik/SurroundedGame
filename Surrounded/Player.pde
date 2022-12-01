class Player{
  int x; 
  int y; 
  int h;
  int w;
  color c;
  int xSpeed;
  int ySpeed;
  boolean isMovingUp;
  boolean isMovingDown;
  boolean isMovingLeft;
  boolean isMovingRight;
  int left;
  int right;
  int top;
  int bottom;
  //constructor
  Player(int ax,int ay,int ah,int aw){
    x=ax;
    y=ay;
    h=ah;
    w=aw;
    
    c=color(255);
    
    xSpeed=5;
    ySpeed=5;
    
    isMovingUp=false;
    isMovingDown=false;
    isMovingLeft=false;
    isMovingRight=false;
  }
  void drawPlayer(){
    //rectMode(CENTER);
    //noStroke();
    //noFill();
    //rect(x,y,w,h);
    imageMode(CENTER);
    if(isMovingRight==false && isMovingLeft==false){
      image(player,x,y);
    }
    else if(isMovingRight==true){
      image(pRight,x,y);
    }
    else if(isMovingLeft==true){
      image(pLeft,x,y);
    }
  }
    
  void playerMovement() {
    
    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
    
    if (isMovingUp==true){
      y -= ySpeed;
   }
   if (isMovingDown==true){
     y += ySpeed;
   }
   if (isMovingLeft==true){
     x -= xSpeed;
   }
   if (isMovingRight==true){
     x += xSpeed;
   }
}
  //void wallDetect() {
  //  // detects wall detection for the right wall
  //  if (x+w/2 >= 900) {
  //    xSpeed = 0;
  //  }
  //  // wall detection for left wall
  //  if (x-w/2 <= 100) {
  //    xSpeed = abs(xSpeed);
  //  }

  //  // wall detection for the bottom wall
  //  if (y+h/2 >= 900) {
  //    ySpeed = 0;
  //  }
  //  // wall detection for left wall
  //  if (y-h/2 <= 100) {
  //    ySpeed = 0;
  //  }
  //}
}
