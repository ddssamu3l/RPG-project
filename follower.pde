class Follower extends Enemy{
  
    Follower(int l, int s,int x , int y){
       super(l,s,x,y); 
    }
    
    void show(){
      if(mapX == roomX && mapY == roomY){
       stroke(black);
       fill(blue);
       circle(loc.x,loc.y,size);
       fill(black);
       textSize(20);
       text(lives,loc.x,loc.y);
      }
    }
    
    void act(){
      if(mapX == roomX && mapY == roomY){
       super.act();
       v=new PVector (myCharacter.loc.x-loc.x,myCharacter.loc.y-loc.y);
       v.setMag(1);
      }
    }
  
}
