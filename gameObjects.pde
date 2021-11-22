class gameObjects{
  PVector loc;
  PVector v;
  PVector dir;
  int lives;
  int size;
  int damage;
  
  gameObjects(){
  }
  
 void show(){
 }
   
  void act(){
    loc.add(v);
  }
  
}
