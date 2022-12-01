class Coin{
 float x;
 float y;
 int d;
 boolean isPickedUp;
 boolean isFired;
 boolean hitsBoss;
 int xSpeed;
 int ySpeed;
 
 //constructor
 Coin(float ax, float ay, int ad){
   x=ax;
   y=ay;
   d=ad;
     
 }
 
 void render(){
   strokeWeight(1);
   stroke(0);
   fill(234,223,0);
   circle(x,y,d);
 }
 
 void isPickedUp(Player aPlayer){
    float top=y-d/2;
    float bottom=y+d/2;
    float left=x-d/2;
    float right=x+d/2;
    
    if(aPlayer.top<=bottom && aPlayer.bottom>=top && aPlayer.right>left && aPlayer.left <=right){
      coinPickup.play();
      isPickedUp=true;  
    }
    else if(isPickedUp==true && coinPickup.isPlaying()==true){
      coinPickup.pause();
    }
  }
  
  void coinMovement(){
    float left=x-d/2;
    float right=x+d/2;
    float top=y-d/2;
    float bottom=y+d/2;
  
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
  
  void hitsBoss(Boss aBoss){
    float left=x-d/2;
    float right=x+d/2;
    float top=y-d/2;
    float bottom=y+d/2;
    
    if(aBoss.top<=bottom && aBoss.bottom>=top && aBoss.right>left && aBoss.left <=right && isFired==true){
      hitsBoss=true; 
      
    }
  }
}
