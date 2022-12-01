import processing.sound.*;
Player p1;
Projectile pr1;
Projectile pr2;
Projectile pr3;
Projectile pr4;
Projectile pr5;
Projectile pr6;
Projectile pr7;
Projectile pr8;
Projectile pr9;
Projectile pr10;
Projectile pr11;
Projectile pr12;
Projectile pr13;
Projectile pr14;
Projectile pr15;
Projectile pr16;
Projectile p1Big;
Projectile p2Big;
Projectile p3Big;
Projectile p4Big;
Projectile bullet1;
Projectile bullet2;
Projectile bullet3;
Projectile bullet4;
Obstacle o1;
Obstacle o2;
Obstacle o3;
Obstacle o4;
Obstacle o5;
Obstacle o6;
Obstacle o7;
Obstacle o8;
Button start;
Button restart;
Button mainMenu;
Button tutorial;
Key k1;
Coin c1;
Boss fBoss;
Coin fCoin1;
Coin fCoin2;
Coin fCoin3;
Coin fCoin4;
Coin fCoin5;
ArrayList <Projectile> projectileList;
PImage[] bossImage = new PImage [2];
Animation bossAnimation;

int state=0;
int x=50;
int y=50;
int d=10;
int coin;
int coin1;
int c2;
int c3;
int c4;
int c5;
int c6;
int c7;
int c8;
int c9;
int c10;
int startTime;
int endTime;
int interval;
boolean tutorialIsPressed=false;

PImage k;
PImage player;
PImage boss;
PImage back;
PImage S;
PImage U;
PImage R;
PImage O;
PImage N;
PImage D;
PImage E;
PImage background;
PImage trophy;
PImage pRight;
PImage pLeft;

SoundFile explodeSound;
SoundFile backTitle;
SoundFile backGame;
SoundFile backBoss;
SoundFile coinPickup;
SoundFile keyPickup;
SoundFile nextLevel;

void setup(){
  size(1000,1000);
  rectMode(CENTER);
  
  projectileList= new ArrayList <Projectile>();
  for (int i=0; i<bossImage.length; i++){
   bossImage[i] = loadImage("boss"+i+".png"); 
  }
  
  bossAnimation = new Animation(bossImage, 0.02, 5);
  startTime=millis();
  interval=3000;
  k=loadImage("key0.png");
  player=loadImage("player0.png");
  boss=loadImage("boss0.png");
  background=loadImage("wall.jpg");
  
  S=loadImage("title0.png");
  U=loadImage("title1.png");
  R=loadImage("R2.png");
  O=loadImage("redO0.png");
  N=loadImage("title4.png");
  D=loadImage("D5.png");
  E=loadImage("D6.png");
  pLeft=loadImage("player2.png");
  pRight=loadImage("player1.png");
  trophy=loadImage("trophy0.png");
  S.resize(125,125);
  U.resize(125,125);
  R.resize(125,125);
  O.resize(125,125);
  N.resize(125,125);
  D.resize(125,125);
  E.resize(125,125);
  trophy.resize(600,600);
  background.resize(1000,1000);
  
  explodeSound= new SoundFile(this,"explode.wav");
  backTitle= new SoundFile(this,"titleMusic.mp3");
  backGame= new SoundFile(this, "gameplayMusic.mp3");
  backBoss= new SoundFile(this, "bossMusic.mp3");
  coinPickup=new SoundFile(this, "coinPickup.wav");
  keyPickup=new SoundFile(this, "keyPickup.wav");
  nextLevel=new SoundFile(this, "nextLevel.wav");
  explodeSound.amp(1.0); 
  explodeSound.rate(2); 
  coinPickup.rate(2.0);
  nextLevel.rate(2.0);
 
  coin1=0;
  c2=0;
  c3=0;
  c4=0;
  c5=0;
  c6=0;
  c7=0;
  c8=0;
  c9=0;
  c10=0;
  p1=new Player(width/2,900,30,15);
  o1=new Obstacle(50, height/2,15,900);
  o2=new Obstacle(950,height/2,15,900);
  o3=new Obstacle(width/2,50,915,15);
  o4=new Obstacle(width/2,950,915,15);
  o5=new Obstacle(225,50,365,15);
  o6=new Obstacle(775,50,365,15);
  o7=new Obstacle(50,225,15,365);
  o8=new Obstacle(50,775,15,365);
  start=new Button(width/2,600,140,40,color(75,180,44));
  restart=new Button(200,800, 200,40,color(85,134,160));
  mainMenu=new Button(800,800,200,40,color(85,134,160));
  tutorial=new Button(width/2,680,140,40,color(75,180,44));
  k1=new Key(random(100,900),random(100,700),5,10);
  c1= new Coin(random(100,900),random(100,700),10);
  //left side projectiles
  pr1=new Projectile(125,150,25,7,5);
  pr2=new Projectile(125,350,25,9,10);
  pr3=new Projectile(125,650,25,12,-11);
  pr4=new Projectile(125,850,25,7,-9);
  //right side projectiles
  pr5=new Projectile(875,150,25,-5,7);
  pr6=new Projectile(875,350,25,-10,12);
  pr7=new Projectile(875,650,25,-8,-7);
  pr8=new Projectile(875,850,25,-6,-8);
  //top side projectiles
  pr9=new Projectile(150,125,25,7,6);
  pr10=new Projectile(350,125,25,10,10);
  pr11=new Projectile(650,125,25,-11,10);
  pr12=new Projectile(800,125,25,-10,9);
  //bottom side projectiles
  pr13=new Projectile(150,875,25,8,-10);
  pr14=new Projectile(350,875,25,10,-9);
  pr15=new Projectile(650,875,25,-10,-11);
  pr16=new Projectile(800,875,25,-11,-10);
  //big projectiles
  p1Big=new Projectile(125,150,75,5,6);
  p2Big=new Projectile(875,350,75,-4,7);
  p3Big=new Projectile(650,125,75,-7,8);
  p4Big=new Projectile(800,875,75,-6,-6);
  
  //fast projectiles
  bullet1=new Projectile(125,350,25,19,20);
  bullet2=new Projectile(875,350,25,20,-18);
  bullet3=new Projectile(850,125,25,-17,17);
  bullet4=new Projectile(875,850,25,-20,-20);
  //Boss Lvl
  fBoss=new Boss(width/2,height/2,3,4,bossAnimation);
  fCoin1= new Coin(200,200,10);
  fCoin2= new Coin(800,800,10);
  fCoin3= new Coin(800,150,10);
  fCoin4= new Coin(150,800,10);
  fCoin5= new Coin(400,400,10);
}

void draw(){
  background(50);
  if(backGame.isPlaying()==false && state != 0 && state != 1 && state != 2  && state != 13 && state != 14 && state != 15){
        backGame.play();
      }
  else if(backGame.isPlaying()==true && (state == 0 || state == 1 || state == 2  || state == 13 || state == 14 || state == 15)){
    backGame.pause();
  }
  endTime=millis();
  coin=coin1+c2+c3+c4+c5+c6+c7+c8+c9+c10;
  switch(state) {       
    case 0:
      if(backTitle.isPlaying()==false){
        backTitle.play();
      }
      startScreen();
      break;
    case 1:
      deathScreen();
      break;
    case 2:
      winScreen();
      break;
    case 3:         //Lvl 1      
      textSize(35);
      text("Level 1",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
    
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      pr1.render();    
      pr1.projectileMovement();
      pr1.makesContact(p1);     
      pr4.render();    
      pr4.projectileMovement();
      pr4.makesContact(p1);      
      pr6.render(); 
      pr6.projectileMovement();
      pr6.makesContact(p1);
      pr7.render(); 
      pr7.projectileMovement();
      pr7.makesContact(p1);
      
      
      for(x=255; x<=750; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        coin1=1;        
      }
    
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      
      if(p1.bottom < 50){        
        nextLevel.play();
        state=4;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 4:        //Lvl 2
      textSize(35);
      text("Level 2",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
            
      pr12.render();    
      pr12.projectileMovement();
      pr12.makesContact(p1); 
      pr9.render();    
      pr9.projectileMovement();
      pr9.makesContact(p1); 
      pr13.render();    
      pr13.projectileMovement();
      pr13.makesContact(p1); 
      pr14.render();    
      pr14.projectileMovement();
      pr14.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c2=1; 
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=5;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 5:        //Lvl 3
      textSize(35);
      text("Level 3",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      p1Big.render();    
      p1Big.projectileMovement();
      p1Big.makesContact(p1); 
      p2Big.render();    
      p2Big.projectileMovement();
      p2Big.makesContact(p1); 
      p3Big.render();    
      p3Big.projectileMovement();
      p3Big.makesContact(p1); 
      p4Big.render();    
      p4Big.projectileMovement();
      p4Big.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c3=1;
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=6;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 6:        //Lvl 4
      textSize(35);
      text("Level 4",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      pr3.render();    
      pr3.projectileMovement();
      pr3.makesContact(p1); 
      pr8.render();    
      pr8.projectileMovement();
      pr8.makesContact(p1); 
      pr11.render();    
      pr11.projectileMovement();
      pr11.makesContact(p1); 
      pr16.render();    
      pr16.projectileMovement();
      pr16.makesContact(p1); 
      pr13.render();    
      pr13.projectileMovement();
      pr13.makesContact(p1); 
      pr14.render();    
      pr14.projectileMovement();
      pr14.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c4=1;
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=7;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 7:        //Lvl 5
      textSize(35);
      text("Level 5",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      pr10.render();    
      pr10.projectileMovement();
      pr10.makesContact(p1); 
      pr11.render();    
      pr11.projectileMovement();
      pr11.makesContact(p1); 
      pr12.render();    
      pr12.projectileMovement();
      pr12.makesContact(p1); 
      pr15.render();    
      pr15.projectileMovement();
      pr15.makesContact(p1); 
      pr13.render();    
      pr13.projectileMovement();
      pr13.makesContact(p1); 
      pr14.render();    
      pr14.projectileMovement();
      pr14.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
       c5=1;
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=8;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 8:        //Lvl 6
      textSize(35);
      text("Level 6",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      pr3.render();    
      pr3.projectileMovement();
      pr3.makesContact(p1); 
      pr2.render();    
      pr2.projectileMovement();
      pr2.makesContact(p1); 
      pr5.render();    
      pr5.projectileMovement();
      pr5.makesContact(p1); 
      pr7.render();    
      pr7.projectileMovement();
      pr7.makesContact(p1); 
      pr4.render();    
      pr4.projectileMovement();
      pr4.makesContact(p1); 
      pr7.render();    
      pr7.projectileMovement();
      pr7.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c6=1;       
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=9;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 9:        //Lvl 7
      textSize(35);
      text("Level 7",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      bullet1.render();    
      bullet1.projectileMovement();
      bullet1.makesContact(p1); 
      bullet2.render();    
      bullet2.projectileMovement();
      bullet2.makesContact(p1); 
      bullet3.render();    
      bullet3.projectileMovement();
      bullet4.makesContact(p1); 
      bullet3.render();    
      bullet4.projectileMovement();
      bullet4.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c7=1;       
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=10;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 10:        //Lvl 8
      textSize(35);
      text("Level 8",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      pr3.render();    
      pr3.projectileMovement();
      pr3.makesContact(p1); 
      pr2.render();    
      pr2.projectileMovement();
      pr2.makesContact(p1); 
      pr5.render();    
      pr5.projectileMovement();
      pr5.makesContact(p1); 
      pr7.render();    
      pr7.projectileMovement();
      pr7.makesContact(p1); 
      pr4.render();    
      pr4.projectileMovement();
      pr4.makesContact(p1); 
      pr7.render();    
      pr7.projectileMovement();
      pr7.makesContact(p1); 
      pr1.render();    
      pr1.projectileMovement();
      pr1.makesContact(p1); 
      pr16.render();    
      pr16.projectileMovement();
      pr16.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c8=1;
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      
      if(p1.bottom < 50){
        nextLevel.play();
        state=11;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 11:        //Lvl 9
      textSize(35);
      text("Level 9",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      pr7.render();    
      pr7.projectileMovement();
      pr7.makesContact(p1); 
      p2Big.render();    
      p2Big.projectileMovement();
      p2Big.makesContact(p1); 
      bullet3.render();    
      bullet3.projectileMovement();
      bullet3.makesContact(p1); 

      
      for(x=255; x<=750; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c9=1;
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        nextLevel.play();
        state=12;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 12:        //Lvl 10
      textSize(35);
      text("Level 10",90,15);
      text("Coin:" + coin + "/10",895,15);
      
      p1.drawPlayer();
      p1.playerMovement();
    
      o2.render();
      o4.render();
      
      o2.contact(p1);
      o4.contact(p1);
      
      pr1.render();    
      pr1.projectileMovement();
      pr1.makesContact(p1); 
      pr2.render();    
      pr2.projectileMovement();
      pr2.makesContact(p1); 
      pr3.render();    
      pr3.projectileMovement();
      pr3.makesContact(p1); 
      pr4.render();    
      pr4.projectileMovement();
      pr4.makesContact(p1); 
      pr5.render();    
      pr5.projectileMovement();
      pr5.makesContact(p1); 
      pr6.render();    
      pr6.projectileMovement();
      pr6.makesContact(p1); 
      pr7.render();    
      pr7.projectileMovement();
      pr7.makesContact(p1); 
      pr8.render();    
      pr8.projectileMovement();
      pr8.makesContact(p1); 
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,50,10);
      }
      for(y=255; y<=745; y +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(50,y,10);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      
      else if(c1.isPickedUp==true){        
        c10=1;
      }
      
      if(coin<10){
        o1.render();
        o1.contact(p1);        
      }      
      
      else if(coin==10){
        o7.render();
        o8.render();
        o7.contact(p1);
        o8.contact(p1);
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        state=2;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      if(p1.right<50){
        state=13;
        p1.x=850;
        p1.y=height/2;
        c1.isPickedUp=false;
        k1.pickedUp=false;
      }
      break;
    case 13:
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
      
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1); 
      
      for(Projectile aProjectile: projectileList){
        aProjectile.render();
        aProjectile.projectileMovement();
        aProjectile.makesContact(p1);
      }
  
      if(endTime-startTime>=interval){
        if(projectileList.size()<12){  
            projectileList.add(new Projectile(fBoss.x,fBoss.y,25,10,10));
          }
        startTime=millis();
      }
        
      if(fCoin1.hitsBoss==false){
        fCoin1.render();
      }
      else if(fCoin1.hitsBoss==true){
        fBoss.coin1Hit=true;
      }
      if(fCoin2.hitsBoss==false){
        fCoin2.render();
      }
      else if(fCoin2.hitsBoss==true){
        fBoss.coin2Hit=true;
      }
      if(fCoin3.hitsBoss==false){
        fCoin3.render();
      }
      else if(fCoin3.hitsBoss==true){
        fBoss.coin3Hit=true;
      }
      if(fCoin4.hitsBoss==false){
        fCoin4.render();
      }
      else if(fCoin4.hitsBoss==true){
        fBoss.coin4Hit=true;
      }
      if(fCoin5.hitsBoss==false){
        fCoin5.render();
      }
      else if(fCoin5.hitsBoss==true){
        fBoss.coin5Hit=true;
      }
      
           
       if (fCoin1.isFired==false){      
        fCoin1.isPickedUp(p1);    
        fCoin2.isPickedUp(p1);      
        fCoin3.isPickedUp(p1);      
        fCoin4.isPickedUp(p1);      
        fCoin5.isPickedUp(p1);
        if(fCoin1.isPickedUp==true){
        text("Press [SPACE] To Fire!!", width/2,970);
        fCoin1.x=p1.x;
        fCoin1.y=p1.y;
        fCoin2.isPickedUp=false;
        fCoin3.isPickedUp=false;
        fCoin4.isPickedUp=false;
        fCoin5.isPickedUp=false;
        }
      }    
       else if(fCoin1.isFired==true){
         fCoin1.coinMovement();
      } 
      
      if (fCoin2.isFired==false){      
        fCoin1.isPickedUp(p1);    
        fCoin2.isPickedUp(p1);      
        fCoin3.isPickedUp(p1);      
        fCoin4.isPickedUp(p1);      
        fCoin5.isPickedUp(p1);
        if(fCoin2.isPickedUp==true){
        text("Press [SPACE] To Fire!!", width/2,970);
        fCoin2.x=p1.x;
        fCoin2.y=p1.y;
        fCoin3.isPickedUp=false;
        fCoin4.isPickedUp=false;
        fCoin5.isPickedUp=false;
        fCoin1.isPickedUp=false;
        }
      }    
       else if(fCoin2.isFired==true){
         fCoin2.coinMovement();
      }
      
      if (fCoin3.isFired==false){      
        fCoin1.isPickedUp(p1);    
        fCoin2.isPickedUp(p1);      
        fCoin3.isPickedUp(p1);      
        fCoin4.isPickedUp(p1);      
        fCoin5.isPickedUp(p1);
        if(fCoin3.isPickedUp==true){
        text("Press [SPACE] To Fire!!", width/2,970);
        fCoin3.x=p1.x;
        fCoin3.y=p1.y;
        fCoin4.isPickedUp=false;
        fCoin5.isPickedUp=false;
        fCoin1.isPickedUp=false;
        fCoin2.isPickedUp=false;
        }
      }    
      else if(fCoin3.isFired==true){
         fCoin3.coinMovement();
      }
      
      if (fCoin4.isFired==false){      
        fCoin1.isPickedUp(p1);    
        fCoin2.isPickedUp(p1);      
        fCoin3.isPickedUp(p1);      
        fCoin4.isPickedUp(p1);      
        fCoin5.isPickedUp(p1);
        if(fCoin4.isPickedUp==true){
        text("Press [SPACE] To Fire!!", width/2,970);
        fCoin4.x=p1.x;
        fCoin4.y=p1.y;
        fCoin5.isPickedUp=false;
        fCoin1.isPickedUp=false;
        fCoin2.isPickedUp=false;
        fCoin3.isPickedUp=false;
        }
      }    
       else if(fCoin4.isFired==true){
         fCoin4.coinMovement();
      }
      
      if (fCoin5.isFired==false){      
        fCoin1.isPickedUp(p1);    
        fCoin2.isPickedUp(p1);      
        fCoin3.isPickedUp(p1);      
        fCoin4.isPickedUp(p1);      
        fCoin5.isPickedUp(p1);      
      if(fCoin5.isPickedUp==true){
        text("Press [SPACE] To Fire!!", width/2,970);
        fCoin5.x=p1.x;
        fCoin5.y=p1.y;
        fCoin1.isPickedUp=false;
        fCoin2.isPickedUp=false;
        fCoin3.isPickedUp=false;
        fCoin4.isPickedUp=false;
        }
      }
       else if(fCoin5.isFired==true){
         fCoin5.coinMovement();
      }
      
      fBoss.bossHealth();
      fCoin1.hitsBoss(fBoss);
      fCoin2.hitsBoss(fBoss);
      fCoin3.hitsBoss(fBoss);
      fCoin4.hitsBoss(fBoss);
      fCoin5.hitsBoss(fBoss);
      
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,50,10);
      }
      
      if(fBoss.isDefeated==false){
        fBoss.render();
        fBoss.animation.isAnimating=true;
        
        fBoss.bossMovement();
        fBoss.bossConnects(p1); 
        o3.render();
        o3.contact(p1);
      }
      else if(fBoss.isDefeated==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
        if (projectileList.size() >=1){ 
          projectileList.remove(projectileList.size()-1); 
        }
      }
      if(p1.bottom<50){
        state=2;
      }
      break;
    case 14:
      p1.drawPlayer();
      p1.playerMovement();
    
      o1.render();
      o2.render();
      o4.render();
    
      o1.contact(p1);
      o2.contact(p1);
      o4.contact(p1);
      
      if(tutorialIsPressed==false){
        pr1.render();
        textSize(30);
        fill(255);
        text("Avoid these projectiles and grab the key to escape the room!",500,100);
        text("Press any key to continue",600,600);
      }
      if(keyPressed==true|| tutorialIsPressed==true){
        tutorialIsPressed=true;
        pr1.render();
        pr1.projectileMovement();
      }
      for(x=255; x<=745; x +=d*2){
        stroke(255);
        strokeWeight(1);
        fill(255);
        circle(x,y,d);
      }
      
      c1.isPickedUp(p1);
      if(c1.isPickedUp==false){
        c1.render();
      }
      else if(c1.isPickedUp==true){        
        c3=1;
      }
      
      k1.isPickedUp(p1);
      if(k1.pickedUp==false){
        k1.render();
        o3.render();
        o3.contact(p1);
      }
      else if(k1.pickedUp==true){        
        o5.render();
        o5.contact(p1);
        o6.render();
        o6.contact(p1);
      }
      if(p1.bottom < 50){
        state=15;
        p1.x=width/2;
        p1.y=900;
        c1.isPickedUp=false;
        k1.pickedUp=false;
        c1.x=random(100,900);
        c1.y=random(100,900);
        k1.x=random(100,900);
        k1.y=random(100,900);
      }
      break;
    case 15:
      fill(255);
      textSize(50);
      text("Ready For The Real Deal?",width/2,200);
      restart.render();
      mainMenu.render();
      fill(0);
      textSize(30);
      text("Game Time",200,795);
      text("Main Menu",800,795);
      if(restart.isPressed()==true && backTitle.isPlaying()==true){
        backTitle.pause();
        setup();
        state=3;
      }
      if(mainMenu.isPressed()==true){
        setup();
        state=0;
      }
      break;      
  }         //end of switch machine
}           //end of draw


void keyPressed(){
  if (key=='w'){
    p1.isMovingUp=true;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=-10;
    }
  }
  
  if (key == 's') {
    p1.isMovingDown=true;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=10;
    }
  }
  if (key == 'a') {
    p1.isMovingLeft=true;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=-10;
    }
  }
  if (key == 'd') {
    p1.isMovingRight=true;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=10;
    }
  }
  if (key=='W'){
    p1.isMovingUp=true;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=-10;
    }
  }
  if (key == 'S') {
    p1.isMovingDown=true;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=10;
    }
  }
  if (key == 'A') {
    p1.isMovingLeft=true;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=-10;
    }
  }
  if (key == 'D') {
    p1.isMovingRight=true;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=10;
    }
  }
  if (key == ' '){
    if(fCoin1.isPickedUp==true){
      fCoin1.isFired=true;
      fCoin1.isPickedUp=false;
    }
    if(fCoin2.isPickedUp==true){
      fCoin2.isFired=true;
      fCoin2.isPickedUp=false;
    }
    if(fCoin3.isPickedUp==true){
      fCoin3.isFired=true;
      fCoin3.isPickedUp=false;
    }
    if(fCoin4.isPickedUp==true){
      fCoin4.isFired=true;
      fCoin4.isPickedUp=false;
    }
    if(fCoin5.isPickedUp==true){
      fCoin5.isFired=true;
      fCoin5.isPickedUp=false;
    }
  }
}

void keyReleased(){
  if (key=='w'){
    p1.isMovingUp=false;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=-10;
    }
  }
  
  if (key == 's') {
    p1.isMovingDown=false;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=10;
    }
  }
  if (key == 'a') {
    p1.isMovingLeft=false;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=-10;
    }
  }
  if (key == 'd') {
    p1.isMovingRight=false;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=10;
    }
  }
  if (key=='W'){
    p1.isMovingUp=false;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=-10;
    }
  }
  if (key == 'S') {
    p1.isMovingDown=false;
    if(fCoin1.isFired==false){
      fCoin1.ySpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.ySpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.ySpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.ySpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.ySpeed=10;
    }
  }
  if (key == 'A') {
    p1.isMovingLeft=false;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=-10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=-10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=-10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=-10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=-10;
    }
  }
  if (key == 'D') {
    p1.isMovingRight=false;
    if(fCoin1.isFired==false){
      fCoin1.xSpeed=10;
    }
    if(fCoin2.isFired==false){
      fCoin2.xSpeed=10;
    }
    if (fCoin3.isFired==false){
      fCoin3.xSpeed=10;
    }
    if (fCoin4.isFired==false){
      fCoin4.xSpeed=10;
    }
    if (fCoin5.isFired==false){
      fCoin5.xSpeed=10;
    }
  }
  if (key == ' '){
    if(fCoin1.isPickedUp==true){
      fCoin1.isFired=true;
      fCoin1.isPickedUp=false;
    }
    if(fCoin2.isPickedUp==true){
      fCoin2.isFired=true;
      fCoin2.isPickedUp=false;
    }
    if(fCoin3.isPickedUp==true){
      fCoin3.isFired=true;
      fCoin3.isPickedUp=false;
    }
    if(fCoin4.isPickedUp==true){
      fCoin4.isFired=true;
      fCoin4.isPickedUp=false;
    }
    if(fCoin5.isPickedUp==true){
      fCoin5.isFired=true;
      fCoin5.isPickedUp=false;
    }
  }
}

void startScreen(){   
  background(background);
  start.render();
  tutorial.render();
  if(start.isPressed()==true && backTitle.isPlaying()==true){
    backTitle.pause();
    state =3;
  }
  if(tutorial.isPressed()==true){
    state=14;
  }
  imageMode(CENTER);
  
  image(S,200,100);
  image(U,265,100);
  image(R,330,100);
  image(R,395,100);
  image(O,460,100);
  image(U,525,100);
  image(N,590,100);
  image(D,655,100);
  image(E,720,100);
  image(D,785,100);
  image(player,460,100);
  
  textAlign(CENTER,CENTER);
  textSize(40);
  fill(0);
  text("Start", width/2,595);
  textSize(30);
  text("Tutorial", width/2,675);
}

void deathScreen(){
  textSize(128);
  textAlign(CENTER,CENTER);
  fill(255,0,0);
  text("YOU DIED!",width/2,300);
  restart.render();
  mainMenu.render();
  fill(0);
  textSize(30);
  text("Restart",200,795);
  text("Main Menu",800,795);
  if(restart.isPressed()==true){
    setup();
    state=3;
  }
  if(mainMenu.isPressed()==true){
    setup();
    state=0;
  }
}

void winScreen(){
  restart.render();
  mainMenu.render();
  textSize(128);
  textAlign(CENTER,CENTER);
  fill(235,240,7);
  text("YOU WIN!!!",width/2,100);
  fill(0);
  textSize(30);
  text("Play Again",200,795);
  text("Main Menu",800,795);
  if(restart.isPressed()==true){
    setup();
    state=3;
  }
  if(mainMenu.isPressed()==true){
    setup();
    state=0;
  }
  image(trophy,width/2,height/2);
}
