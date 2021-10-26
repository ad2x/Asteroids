class Bullet extends GameObject{
  
  float rotation;
  
  Bullet(boolean side_) {
    
    side = side_;
    
    lives = 90;
    
    if (side == true) {
      location = new PVector(myShip.location.x, myShip.location.y);
      velocity = new PVector(myShip.direction.x, myShip.direction.y);
    } else {
      //If any of the enemy ships have their shot timer up at the moment the bullet is created it becomes an enemy bullet and resets the shotTimer
      int i = 0;
      while (i < myObjects.size()) {   
        GameObject myObj = myObjects.get(i);
        
        if (myObj instanceof enemyShip && myObj.shotTimer == 150) {
          location = new PVector(myObj.location.x, myObj.location.y);
          //Calc
          velocity = new PVector(- myObj.location.x + myShip.location.x, - myObj.location.y + myShip.location.y);
          velocity.setMag(1);
          myObj.shotTimer = 0;
        }
        
        i++;
      }
    }
    
    velocity.setMag(10);
    
  }
  
  void show() {
    stroke(p1, map(lives, 0, 90, 0, 255));
    noFill();
    if (side == true) ellipse(location.x, location.y, 15, 15);
    if (side == false) {
      pushMatrix();
      translate(location.x, location.y);
      
      rotation += 0.1;
      rotate(rotation);
      
      stroke(p3, map(lives, 0, 90, 0, 255));
      rect(-10, -10, 20, 20);
      
      popMatrix();
    }
  }
  
  void act() {
    super.act();
    
    lives--;
  }
}
