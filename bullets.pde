class Bullet extends gameObjects{
  int BulletColor;
  
  Bullet(){
    
  }
  Bullet(PVector aim, color c, int s,int d){
    lives = 1;
     loc = new PVector(myCharacter.loc.x,myCharacter.loc.y);
     v = aim.copy();
     //v.setMag(13);
     size = s;
     damage=d;
  }
  
  void show(){
    stroke(255);
    strokeWeight(size);
    noFill();
    ellipse(loc.x,loc.y,size,size);
  }
  
  void act(){      
     super.act();
  // print(lives);
     if(loc.x<=80 || loc.x>=width-80 || loc.y<=80 || loc.y>=height-80){
       lives=0;
     }
    // print(lives);
  }
}

class enemyBullet extends Bullet{
    enemyBullet(PVector a,PVector location, color col, int size){
        super(a,col,size,1);
        loc = location.copy();
        v.setMag(4);
    }
    void show(){
       super.show(); 
    }
    void act(){
       super.act(); 
    }
}
