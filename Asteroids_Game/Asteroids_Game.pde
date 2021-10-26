import processing.javafx.*;

boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;

ArrayList<GameObject> myObjects;

//Asteroid spawns
int asteroidTimer = 0;

//Enemy ship spawns
int eshipTimer = 0;

//Game timer
int timePassed = 0;
int initTime = 0;

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

color Black = #000000;
color White = #FFFFFF;

//Main palette

color p1 = #E7EFC5;
color p2 = #BFD7B5;
color p3 = #A3C4BC;
color p4 = #413C58;
color p5 = #F2DDA4;

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

Lives myLives;
Timer myTimer;
scoreCounter myScore;
int score;
int highscore = 0;
  
//=== Paused ===
  
//=== Over ===

Button over1;
  
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
  start1 = new Button(playing, width/2, height/2, p3, p2, 250, 15);
  
  //=== Playing ===

  //I honestly can't remember why I specifically wanted to not add this to the array
  myShip = new Ship(); 
  
  myLives = new Lives();
  
  myTimer = new Timer();
  
  myScore = new scoreCounter();
  
  //=== Paused ===
  
  //=== Over ===
  over1 = new Button(playing, width/2, 3*height/4, p3, p2, 300, 100, 15);
  
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
  if (keyCode == 27 && mode == playing) {
    key = 0;
    mode = paused;
  } else if (keyCode == 27 && mode == paused) {
    key = 0;
    mode = playing;
  }
}

void keyReleased() {
  if (key == 'W') upkey = false;
  if (key == 'S') downkey = false;
  if (key == 'A') leftkey = false;
  if (key == 'D') rightkey = false;
  if (key == ' ') spacekey = false;
}
