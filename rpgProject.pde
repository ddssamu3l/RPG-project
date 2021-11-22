int mode,start,game,pause,end;
int mapX,mapY;
character myCharacter;
boolean mouseReleased;
boolean hadPressed;
Boolean up,down,left,right,space;
Button blueButton, greenButton, pinkButton, blackButton;
color bkg;

//color pallette
color blue   = #28E7ED;
color green  = #2DDE07;
color pink   = #F76DDC;
color yellow = #FFF387;
color saturatedYellow = #F0C116;
color black  = #000000;
color white  = #FFFFFF;
color red    = #D30202;

gif g;
Button button;

PImage image;
PImage mapFloor;
PImage mapImage;
PImage characterImage;
PFont font;

 Room map[][];

ArrayList <gameObjects>myObjects;
ArrayList <DarknessCell> darkness;


Room centerRoom,leftRoom,rightRoom,topRoom,bottomRoom, currentRoom;


void setup(){
  size(1200,800);
  myCharacter = new character();
  mode = start = 0;
  game = 1;
  pause = 2;
  end = 3;
  myObjects = new ArrayList<gameObjects>();
 mapImage= loadImage("map.png");
 mapFloor = loadImage("mapFloor(2).png");
 mapFloor.resize(width-110,height-120);
 characterImage = loadImage("doomCharacter.png");
  map= new Room [mapImage.height][mapImage.width];
  
  initializeDarkness();
  up=down=left=right=space=false;
  myObjects.add(myCharacter);
  initiateMap();
  g=new gif(16,"starting screen gif");
  button= new Button("start", 400,2*800/3,300,200,black,white);
  
}

void draw(){
  if(mode == start)startMenu();
  else if(mode == game) game();
  else if(mode == pause)pause();
  else if(mode == end) end();
}

void drawObjects(){
    int i=0;
  while(i<myObjects.size()){
     gameObjects b = myObjects.get(i);
     b.show();
     b.act();
     if(b.lives<=0){
     myObjects.remove(i); 
     }else{
     i++;
     } 
  } 
}

void initiateMap(){
  int mx  = 0;
  int my = 0;
 while(my<=mapImage.height-1){
    color c = mapImage.get(mx,my);
      if(c != #FFFFFF){
          map[my][mx]=new Room();
      }
        if(c == #ff0000){
           myObjects.add(new Enemy(100,100,mx,my)); 
        }
        else if(c == #0000ff){
           myObjects.add(new Follower(100,100,mx,my));
        }
    mx+=1;
    if(mx>=mapImage.width){
      mx=0;
      my++;
    }
 }
  currentRoom = map[1][1];
  mapX = 1;
  mapY=1;
}













  
  /*map[1][1]=new Room();
  map[1][2]=new Room();
  map[1][3]=new Room();
  map[1][5]=new Room();
  map[1][6]=new Room();
  map[1][7]=new Room();
  
  map[2][1]=new Room();
  map[2][3]=new Room();
  map[2][4]=new Room();
  map[2][5]=new Room();
  map[2][7]=new Room();
  
  map[3][1]=new Room();
  map[3][2]=new Room();
  map[3][3]=new Room();
  map[3][5]=new Room();
  map[3][6]=new Room();
  map[3][7]=new Room();
  
  map[4][2]=new Room();
  map[4][6]=new Room();
  
  map[5][1]=new Room();
  map[5][2]=new Room();
  map[5][3]=new Room();
  map[5][5]=new Room();
  map[5][6]=new Room();
  map[5][7]=new Room();
  
  map[6][1]=new Room();
  map[6][3]=new Room();
  map[6][4]=new Room();
  map[6][5]=new Room();
  map[6][7]=new Room();
  
  map[7][1]=new Room();
  map[7][2]=new Room();
  map[7][3]=new Room();
  map[7][5]=new Room();
  map[7][6]=new Room();
  map[7][7]=new Room();*/
