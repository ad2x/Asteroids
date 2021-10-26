class Timer {
  
  
  Timer() {
  }
  
  public void show(float x, float y, float sx, float sy) {
    pushMatrix();
    translate(x, y);
    
    strokeWeight(5);
    
    stroke(p3, 230);
    noFill();
    
    rect(-sx/2, -sy/2, sx, sy);
    
    noStroke();
    fill(p2, 230);
    
    rect(-sx/2, -sy/2, map(1800 - timePassed - initTime, 0, 1800, 0, sx), sy); 
    
    popMatrix();
    
    if (map(1800 - timePassed - initTime, 0, 1800, 0, sx) <= 0) {
      mode = over;
      
      if (score > highscore) highscore = score;
    }
  }
}
