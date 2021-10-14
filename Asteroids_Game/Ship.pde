class Ship extends GameObject {
  
  PVector direction;
  int shotTimer, threshold;
  
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    
    shotTimer = 0;
    threshold = 10;
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    
    noFill();
    stroke(255);
    strokeWeight(4);
    ellipse(0, 0, 60, 60);
    line(-30, 0, 30, 0);
    line (0, -30, 0, 30);
    fill(0);
    rect(0, -15, 30, 30); 
    ellipse(0, 0, 40, 40);
    
    popMatrix();
  }
    
  void act() {
    super.act();
    
    shotTimer++;

    if (upkey) velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(5));
    if (rightkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      
      shotTimer = 0;
    }
    
    if (velocity.mag() > 3) {
      velocity.setMag(3);   
    }
  }
  
}
