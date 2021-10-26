class Fire extends GameObject {
  
  int t;
  
  Fire () {
    lives = 1;
    size = 10;
    t = 150;
    location = myShip.location.copy();
    location.x = random(myShip.location.x - size, myShip.location.x + size);
    velocity = myShip.direction.copy();
    velocity.rotate(PI);
    velocity.setMag(5);
  }
  
  void show() {
    noStroke();
    fill(p5, t);
    square(location.x - size/2, location.y - size/2, size);
  }
  
  void act () {
    super.act();
    
    t -= 10;
    if (t <= 0) lives--;
  }
  
}
