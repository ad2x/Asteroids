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
    
    velocity = new PVector (0, 3);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
  }
  
  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector (0, 3);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }
  
  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }
  
  void act() {
    super.act();
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size && size >= 100) {
          myObj.lives = 0;
          lives = 0;
          score++;
          myObjects.add(new Asteroid(size/2, location.x - size/4, location.y - size/4));
          myObjects.add(new Asteroid(size/2, location.x + size/4, location.y + size/4));
        } else if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size && size < 100) {
          myObj.lives = 0;
          lives = 0;
          score++;
        }
      } else if ((myObj instanceof Asteroid) && myObj.location != location) {

        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          velocity.set(location.x - myObj.location.x, location.y - myObj.location.y);
          velocity.setMag(4);      
          
          //Below causes a crash and idk why O_O
          
          //lives--;
          
          //myObjects.add(new Asteroid(size/2, location.x - size/4, location.y - size/4));
          //myObjects.add(new Asteroid(size/2, location.x + size/4, location.y + size/4));
        }
      }  
      i++;
    }
    
    if ((dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + 30 && myShip.invulTimer > 120) || (dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + 71 && myShip.invulTimer <= 120)) {
      
      if (myShip.invulTimer > 120) {
        lives--;
        myShip.hit();
        myShip.velocity.mult(-1);
      }
      
      if (myShip.invulTimer <= 120) {
        //Ship bounces asteroids when invincible
        velocity.set(location.x - myShip.location.x, location.y - myShip.location.y);
        velocity.setMag(4);
      }
    }
  }
}
