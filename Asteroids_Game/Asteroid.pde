class Asteroid extends GameObject {
  
  Asteroid() {
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
  }
  
  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, 100, 100);
  }
  
  void act() {
    super.act();
    
    //Co Det.
  }
}
