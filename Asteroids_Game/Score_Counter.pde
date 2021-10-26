class scoreCounter {
    
  scoreCounter () {

  }
  
  void show (float x, float y) {
    pushMatrix();
    translate(x, y);
    
    fill(White, 200);
    
    textSize(40);
    text("Score: " + score, 0, 0);
    textSize(25);
    text("Highscore: " + highscore, 0, 50);
    
    popMatrix();
  }
}
