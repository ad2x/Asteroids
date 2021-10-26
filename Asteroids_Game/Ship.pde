class Ship extends GameObject {
  
  PVector direction;
  int threshold;
  public int invulTimer;
  
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    
    shotTimer = 0;
    threshold = 10;
    
    invulTimer = 121;
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
    invulTimer++;
    
    ////Testing
    //if (mousePressed) {
    //  invulTimer = 119;
    //}
    //if (mousePressed) lives = 1;
   
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(5));
    if (rightkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet(true));
      
      shotTimer = 0;
    }
    
    if (velocity.mag() > 3) {
      velocity.setMag(3);   
    }
    
    if (invulTimer <= 120) {
      pushMatrix();
      translate(location.x, location.y);
      
      noFill();
      strokeWeight(5);
      stroke(p3);
      
      rect(-50, -50, 100, 100);
      
      rotate(radians(22.5));
      
      rect(-50, -50, 100, 100);
      
      rotate(radians(45));
      
      rect(-50, -50, 100, 100);
      
      rotate(radians(67.5));
      
      rect(-50, -50, 100, 100);
      
      popMatrix();
    }
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      if (myObj instanceof Bullet && myObj.side == false && dist(myObj.location.x, myObj.location.y, location.x, location.y) <= 37.5 && invulTimer > 120) {
        myObj.lives = 0;
        
        hit();
      } else if (myObj instanceof Bullet && myObj.side == false && dist(myObj.location.x, myObj.location.y, location.x, location.y) <= 57.5 && invulTimer <= 120) {
        myObj.lives = 0;
      }
        
      i++;
    }
    
  }
  
  void hit() {
    lives--;
    
    if (lives != 0) invulTimer = 0;
    
    if (lives == 0) {
      mode = over;
      
      if (score > highscore) highscore = score;
    }
  }
  
  //Just resetting crashed my game so I made this
  public void reset() {
    lives = 3;
    location.set(width/2, height/2);
    velocity.set(0, 0);
    direction.set(0, -0.1);
  }
}
