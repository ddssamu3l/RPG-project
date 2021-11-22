void startMenu(){
  g.show();
  button.show();
}
void game(){
//  println("HI");
    currentRoom.drawRoom();
   drawObjects();
   drawDarkness();
   currentRoom.checkRoom();
   drawMap();
   
}
void pause(){
  
}
void end(){
  
}
