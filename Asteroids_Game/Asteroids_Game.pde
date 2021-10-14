import processing.javafx.*;

boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;

ArrayList<GameObject> myObjects;

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

void setup() {
  size(800, 800, FX2D);
  imageMode(CENTER);
  
  myShip = new Ship();
  
  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Asteroid());
}

void draw() {
  background(0);
  
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives <= 0) {
      myObjects.remove(i);
    } else {
      i++;
    }    
  } 
  
  myShip.show();
  myShip.act();
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
