void keyPressed(){
   if(keyCode == 'w' || keyCode == 'W') up = true;
   if(keyCode == 's'|| keyCode == 'S') down = true;
   if(keyCode == 'a'|| keyCode == 'A') left = true;
   if(keyCode == 'd'|| keyCode == 'D') right = true;
   if(keyCode == ' ') space = true;

}

void keyReleased(){
    if(keyCode == 'w'|| keyCode == 'W') up = false;
   if(keyCode == 's'|| keyCode == 'S') down = false;
   if(keyCode == 'a'|| keyCode == 'A') left = false;
   if(keyCode == 'd'|| keyCode == 'D') right = false;
   if(keyCode == ' ') space = false;
   
}

void mousePressed(){
  if(mode == start)
    mode = game;
}
