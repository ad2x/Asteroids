class Asteroid extends GameObject {
  
  Asteroid() {
    lives = 1;
    
    //Randomizes asteroid spawn
    
    int r = (int) random(0, 4) + 1;
    
    if (r == 1) {
      location = new PVector(random(0, width), height+100);
    } else if (r == 2) {
      location = new PVector(random(0, width), -100);
    } else if (r == 3) {
      location = new PVector(-100, random(0, height));
    } else if (r == 4) {
      location = new PVector(width+100, random(0, height));
    }
    
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
  }
  
  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, 100, 100);
  }
  
  void act() {
    super.act();
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives = 0;
        }
      }
      
      i++;
    }
  }
}
