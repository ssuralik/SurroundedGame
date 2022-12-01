class Key{
  float x;
  float y;
  int w;  
  int l;
  boolean pickedUp;
  //constructor
  Key(float ax,float ay, int aw, int al){
    x=ax;
    y=ay;
    w=aw;
    l=al;
    
  }
  
  void render(){       
    imageMode(CENTER);
    image(k,x,y);
  }
  
  void isPickedUp(Player aPlayer){
    float top=y-l/2;
    float bottom=y+l/2;
    float left=x-l/2;
    float right=x+l/2;
    
    if(aPlayer.top<=bottom && aPlayer.bottom>=top && aPlayer.right>left && aPlayer.left <=right){
      keyPickup.play();
      pickedUp=true;           
    }
    else if(aPlayer.top !=bottom&& keyPickup.isPlaying()==true){
      keyPickup.pause();
    }
    
  }
  
}
