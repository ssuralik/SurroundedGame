class Boss{
  int x;
  int y;
  int w=100;
  int h=100;
  int xSpeed;
  int ySpeed;
  int health;
  
  int left;
  int right;
  int top;
  int bottom;
  
  boolean isDefeated;
  boolean coin1Hit;
  boolean coin2Hit;
  boolean coin3Hit;
  boolean coin4Hit;
  boolean coin5Hit;
  
  Animation animation;
  //constructor
  Boss(int ax, int ay, int aXSpeed,int aYSpeed, Animation startingAnimation){
    x=ax;
    y=ay;
    xSpeed=aXSpeed;
    ySpeed=aYSpeed;
    animation=startingAnimation;
    
    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
    health=5;
  }
  
  void render(){
    imageMode(CENTER);
    animation.display(x,y);
    //image(boss,x,y);    
    //boss.resize(200,200);
  }
  
  void bossMovement(){
    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
    
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
  
  void bossConnects(Player aPlayer){
    
    if(aPlayer.top<=bottom && aPlayer.bottom>=top && aPlayer.right>left && aPlayer.left <=right){
       state=1;
    }    
  }
  
  void bossHealth(){
    if (coin1Hit==true && coin2Hit==true && coin3Hit==true && coin4Hit==true && coin5Hit==true){
      isDefeated=true;
    }
  }
}
