class character extends gameObjects{
  PVector downDir;
  PVector leftDir;
  PVector rightDir;
  Boolean isInvincible;
  int invincibleTimer;
  Weapon myWeapon;
  character(){
   loc = new PVector(width/2,height/2); 
   v= new PVector(0,0); 
   dir= new PVector(0,-4); 
   downDir = new PVector(0,4);
   leftDir = new PVector(-4,0);
   rightDir = new PVector(4,0);
   myWeapon = new sniperRifle();
   //myWeapon = new autoPistol();
   //myWeapon = new Weapon();
   //myWeapon = new shotgun();
   lives = 3;
   size = 100;
   invincibleTimer = 100;
  }
  
  void show(){
    fill(#CA90FA);
    strokeWeight(5);
    stroke(0);
   pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    //image(characterImage,myCharacter.loc.x-50,myCharacter.loc.y-50,100,100);
    checkCharacterHealthColor();
    ellipse(0,0,50,50);
    popMatrix();
     
  }
  void act(){///////////////////////////////////////////////////////////////////////////
   super.act();
    characterMove();
   myWeapon.update();
   if(space) {myWeapon.shoot();}
   checkCharacterDamage();
   
  }
  
  void checkCharacterHealthColor(){
      if(lives ==3){
    fill(green);}
    else if(lives == 2){
      fill(saturatedYellow);}
      else if(lives == 1){
        fill(red);} 
  }
  
  void characterMove(){
     if (up) 
      v.y = -2;
    else if (down){v.y=2;}
    else v.y=0;
    if (left){v.x = -2;}
   else if (right){v.x = 2;}
   else v.x=0;
    if(!up && !down && !left && !right){
     v.x=0;
     v.y=0;
    } 
  }
  
  void checkCharacterDamage(){
     int i = 0;
     while(i<myObjects.size()){
         gameObjects obj = myObjects.get(i);
         if(obj instanceof enemyBullet){
             float d = dist(obj.loc.x,obj.loc.y,loc.x,loc.y);
             if(d<=size/2+obj.size/2){
                lives -=1;
                print(lives);
                obj.lives = 0;
             }
         }
         i++;
     } 
  }
}
