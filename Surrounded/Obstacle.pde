class Obstacle{
  //variables
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  
  //constructor
  Obstacle(int sX, int sY, int sW,int sH){
    x=sX;
    y=sY;
    w=sW;
    h=sH;       
    
    left=x-w/2;
    right=x+w/2;
    top=y-h/2;
    bottom=y+h/2;
  }
  
  void render(){
    fill(255);
    strokeWeight(5);
    stroke(255);
    rect(x,y,w,h);
  }
  
  void contact(Player aPlayer){
    if(aPlayer.top<=bottom && aPlayer.bottom>=top && aPlayer.right>left && aPlayer.left <=left){
      
      aPlayer.isMovingRight=false;
      aPlayer.x= left-aPlayer.w/2;
    }
    if(aPlayer.top<=bottom && aPlayer.bottom>=top && aPlayer.left<right && aPlayer.right>=right){
      
      aPlayer.isMovingLeft=false;
      aPlayer.x=right+aPlayer.w/2;
    }
    if(aPlayer.left<=right && aPlayer.right>=left && aPlayer.bottom>top && aPlayer.top<=top){
      
      aPlayer.isMovingDown=false;
      aPlayer.y= top-aPlayer.h/2;
    }
    if(aPlayer.left<=right && aPlayer.right>=left && aPlayer.top<bottom && aPlayer.bottom>=bottom){
      
      aPlayer.isMovingUp=false;
      aPlayer.y=bottom+aPlayer.h/2;
    }
  }
  
 
  //void makeContact(Projectile aProjectile){
    
  //  if(aProjectile.top<=bottom && aProjectile.bottom>=top && aProjectile.right>left && aProjectile.left <=left){      
  //    aProjectile.ySpeed=-abs(aProjectile.ySpeed);
  //  }
    
  //  if(aProjectile.top<=bottom && aProjectile.bottom>=top && aProjectile.left<right && aProjectile.right>=right){      
  //    aProjectile.ySpeed=abs(aProjectile.ySpeed);
  //  }
    
  //  if(aProjectile.left<=right && aProjectile.right>=left && aProjectile.bottom>top && aProjectile.top<=top){      
  //    aProjectile.xSpeed=-abs(aProjectile.xSpeed);
  //  }
    
  //  if(aProjectile.left<=right && aProjectile.right>=left && aProjectile.top<bottom && aProjectile.bottom>=bottom){      
  //    aProjectile.xSpeed=abs(aProjectile.xSpeed);
  //  }
  //}
}
