class Enemy extends gameObjects{
  int roomX;
  int roomY;
  float shotInterval;
  Enemy(int Lives, int s, int X, int Y){
       loc = new PVector (width/2,height/2);
     v = new PVector(0,0);
     lives = Lives;
     size=s;
     roomX=X;
     roomY=Y;
     shotInterval = random(100,200);
  }  
  
  void show(){
    if(mapX == roomX && mapY == roomY){
     stroke(black);
     fill(green);
     circle(loc.x,loc.y,size);
     fill(black);
     textSize(20);
     text(lives,loc.x,loc.y);
    }
  }
  
  void act(){
    if(mapX == roomX && mapY == roomY){                // CHECK IF THE ENEMY IS IN THE SAME ROOM AS THE CHARACTER
     super.act();
     int i = 0;
     while(i<myObjects.size()){ //=============================================ENEMY DAMAGE TAKING CODE==========================================================
         gameObjects obj = myObjects.get(i);
         if(obj instanceof Bullet && !(obj instanceof enemyBullet)){
             float d = dist(obj.loc.x,obj.loc.y,loc.x,loc.y);
             if(d<=size/2+obj.size/2){
                lives = lives-obj.damage;
                obj.lives = 0;
             }
         }
         i++;
     }
      //=======================================================================ENEMY SHOT FIRING CODE============================================================
     if(shotInterval <=0){
        myObjects.add(new enemyBullet(new PVector(myCharacter.loc.x-loc.x,myCharacter.loc.y-loc.y),loc.copy(), black,10)); 
        shotInterval = random(100,200);
     }
     shotInterval--;
    }
  }
}
