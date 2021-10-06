class Bullet extends GameObject{
  
  Bullet() {
    lives = 2;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
  }
  
  void show() {
    if (
    stroke(255);
    noFill();
    ellipse(location.x, location.y, 10, 10);
  }
  
  void act() {
    super.act();
  }
}
