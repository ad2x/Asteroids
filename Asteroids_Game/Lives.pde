class Lives {
    
  //Player UI
  Lives () {
  }
  
  public void show (float x, float y) {
    pushMatrix();
    translate(x, y);
    
    //Lives
    noStroke();
    switch(myShip.getLives()) {
      case 3:
        heart(0, 0, p1);
        heart(100, 0, p1);
        heart(200, 0, p1);
        break;
      case 2:
        heart(0, 0, p1);
        heart(100, 0, p1);
        break;
      case 1:
        heart(0, 0, p1);
        break;
    }
    
    popMatrix();
  }
  
  void heart(float x, float y, color c) {
    pushMatrix();
    translate(x, y);
    
    fill(c, 230);    
    
    ellipse(0, 0, 70, 70);
    
    fill(0, 0, 0, 230);
    
    ellipse(0, 0, 40, 40);
    
    popMatrix();
  }
}
