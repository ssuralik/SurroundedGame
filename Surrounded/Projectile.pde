class Projectile{
  int x;
  int y;
  int d;
  int left;
  int right;
  int top;
  int bottom;
  
  float xSpeed;
  float ySpeed;
  
  //constructor
  Projectile(int px,int py, int pd,float pxSpeed, float pySpeed){
    x=px;
    y=py;
    d=pd;
    xSpeed=pxSpeed;
    ySpeed=pySpeed;
    
    
  }
  
  void render(){
    noStroke();
    fill(color(255,0,0));
    circle(x,y,d);    
  }
  
  void projectileMovement(){
    left=x-d/2;
    right=x+d/2;
    top=y-d/2;
    bottom=y+d/2;
    
    x += xSpeed;
    y += ySpeed;
    
    if (bottom>= 935) {
      ySpeed=-abs(ySpeed);
    }
    else if(top<=65){
     ySpeed=abs(ySpeed); 
    }
  
    if (right>= 935) {
      xSpeed=-abs(xSpeed);
    }
    else if(left<=65){
     xSpeed =abs(xSpeed); 
    }
  }

  
  void makesContact(Player aPlayer){
    
    if(aPlayer.top<=bottom && aPlayer.bottom>=top && aPlayer.right>left && aPlayer.left <=right){
      explodeSound.play();
      state=1;
    }
    
  }
}
