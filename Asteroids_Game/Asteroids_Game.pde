import processing.javafx.*;

boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;

ArrayList<GameObject> myObjects;

//Colour Palette

color

void setup() {
  size(800, 800, FX2D);
  imageMode(CENTER);
  
  myShip = new Ship();
  
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
}

void draw() {
  background(0);
  
  myShip.show();
  myShip.act();
  
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
    
    i++;
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
