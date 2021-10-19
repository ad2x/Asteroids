import processing.javafx.*;

boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;

ArrayList<GameObject> myObjects;

//Asteroid spawns
int asteroidTimer = 0;

//Game timer
int timepassed = 0;

//Colour Palette
color NRed1 = #a60000;
color NRed2 = #bd0000;
color NRed3 = #cb0000;
color NRed4 = #e20000;
color NRed5 = #ff5b5b;

color NGreen1 = #174c19;
color NGreen2 = #1f6522;
color NGreen3 = #277f2a;
color NGreen4 = #2f9832;
color NGreen5 = #3eca43;

color NBlue1 = #1f1f66;
color NBlue2 = #272780;
color NBlue3 = #2e2e99;
color NBlue4 = #3e3ecc;
color NBlue5 = #4d4dff;

//Gray colour palette

color p1 = #444941;
color p2 = #5F7A61;
color p3 = #D5EEBB;
color p4 = #7FC8A9;

//Font
PFont font1;

//Image
PImage background1;

//Mode Framework
int mode = 0;
final int start = 0;
final int playing = 1;
final int paused = 2;
final int over = 3;

//=== Start ===

Button start1;
  
//=== Playing ===

Pui myUI;
  
//=== Paused ===
  
//=== Over ===
  
//==============================================================================

void setup() {
  size(800, 800, FX2D);
  imageMode(CENTER);
    
  font1 = createFont("font1.ttf", 128);
  textFont(font1);
  textAlign(CENTER, CENTER);
  
  background1 = loadImage("background.jpg");
  background1.resize(height*2*16/9, height*2);
    
  myObjects = new ArrayList<GameObject>();
  
  //=== Start ===
  
  start1 = new Button(1, width/2, height/2, p3, p2, 250, 15);
  
  //=== Playing ===

  myShip = new Ship();
  
  myUI = new Pui();
  
  //=== Paused ===
  
  //=== Over ===
  
}

void draw() {
  background(0);
  
  switch (mode) {
    case start:
      startg();
      break;
    case playing:
      playing();
      break;
    case paused:
      paused();
      break;
    case over:
      over();
      break;
  }
}

void keyPressed() {
  if (key == 'W') upkey = true;
  if (key == 'S') downkey = true;
  if (key == 'A') leftkey = true;
  if (key == 'D') rightkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (key == 'W') upkey = false;
  if (key == 'S') downkey = false;
  if (key == 'A') leftkey = false;
  if (key == 'D') rightkey = false;
  if (key == ' ') spacekey = false;
}
