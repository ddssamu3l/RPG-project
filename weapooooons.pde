class Weapon {
  int damage;
  int shotTimer;
  int threshold;
  float bulletSpeed;
  int size;
 Weapon(){
   shotTimer = 0;
   threshold = 30;
   bulletSpeed=5;
 }
 
 Weapon(int thr, float bs, int s,int d){
   shotTimer = 0;
   threshold = thr;
   bulletSpeed=bs;
   size = s;
   damage = d;
 }
 
  void update(){
     shotTimer++; 
     
  }
  
  void shoot(){
    if(shotTimer>=threshold){
       PVector aimVector= new PVector((mouseX-myCharacter.loc.x), (mouseY-myCharacter.loc.y)); 
       aimVector.setMag(bulletSpeed);
       myObjects.add(new Bullet(aimVector, white,size,damage));
       shotTimer=0;
    }
    
  }
}

class autoPistol extends Weapon{
    autoPistol(){
       super(10,5,6,4); 
    }
}

class sniperRifle extends Weapon{
  
   sniperRifle(){
      super(200,20,10,50); 
   }
}

class shotgun extends Weapon{
  
   shotgun(){
      super(50,6,5,8); 
   }
   void shoot(){
       if(shotTimer>=threshold){
       PVector aimVector= new PVector(mouseX-myCharacter.loc.x, mouseY-myCharacter.loc.y); 
       aimVector.setMag(bulletSpeed);
       myObjects.add(new Bullet(aimVector.copy().rotate(-0.3), white,size,damage));
      myObjects.add(new Bullet(aimVector.copy().rotate(-0.1), white,size,damage));
       myObjects.add(new Bullet(aimVector.copy().rotate(0), white,size,damage));
      myObjects.add(new Bullet(aimVector.copy().rotate(0.1), white,size,damage));
      myObjects.add(new Bullet(aimVector.copy().rotate(0.3), white,size,damage));
       shotTimer=0;
    }
   }
}
