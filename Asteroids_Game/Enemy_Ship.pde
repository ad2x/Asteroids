class enemyShip extends GameObject {
    
  enemyShip () {
    lives = 3;
    
    shotTimer = 130;
    
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
    
    size = 60;
  }
  
  //Triangle calcs stolen from stackoverflow: https://stackoverflow.com/questions/11449856/draw-a-equilateral-triangle-given-the-center/11479662
  void show () {
    pushMatrix();
    translate(location.x, location.y);
    
    noFill();
    stroke(p4);
    
    if (lives == 1) {
      stroke(p5, 200);
    }
    
    ellipse(0, 0, 60, 60);
    
    float cx = 0;
    float cy = -28;
    
    float bx = cx*cos(radians(120)) - cy*sin(radians(120));
    float by = cx*sin(radians(120)) + cy*cos(radians(120));
    
    float ax = cx*cos(radians(240)) - cy*sin(radians(240));
    float ay = cx*sin(radians(240)) + cy*cos(radians(240));
    
    triangle(ax, ay, bx, by, cx, cy);
    
    popMatrix();
  }
  
  void act () {
    super.act();
    
    //Gets hit by bullets
    //Takes two shots to kill, each rewarding one point
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      if (myObj instanceof Bullet && myObj.side == true) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives--;
          score++;
        }  
      }
      
      i++;
    }
    
    //Shoot at the player
    shotTimer++;
    if (shotTimer == 150) {
      myObjects.add(new Bullet(false));
    }
    
  }
}
