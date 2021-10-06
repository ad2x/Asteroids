class Ship extends GameObject {
  
  PVector direction;
  
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
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

    if (upkey) velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(5));
    if (rightkey) direction.rotate(radians(5)); 
    if (spacekey) myObjects.add(new Bullet());
    
    if (velocity.mag() > 5) {
      velocity.setMag(5);   
    }
  }
  
}
