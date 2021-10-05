class Ship {
  
  int lives;
  PVector location, velocity, direction;
  
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    
    noFill();
    stroke(255);
    strokeWeight(4);
    triangle(-25, -15, -25, 15, 25, 0);
    
    popMatrix();
  }
  
  void act() {
    location.add(velocity);
  }
  
}
