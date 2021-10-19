class Pui {
    
  //Player UI
  Pui () {
  }
  
  public void show (float x, float y) {
    pushMatrix();
    translate(x, y);
    
    //Lives
    noStroke();
    switch(myShip.getLives()) {
      case 3:
        heart(0, 0, p4);
        heart(100, 0, p4);
        heart(200, 0, p4);
        break;
      case 2:
        heart(0, 0, p4);
        heart(100, 0, p4);
        break;
      case 1:
        heart(0, 0, p4);
        break;
    }
    
    popMatrix();
  }
  
  void heart(float x, float y, color c) {
    pushMatrix();
    translate(x, y);
    
    fill(c, 120);    
    
    ellipse(0, 0, 70, 70);
    
    fill(0, 0, 0, 180);
    
    ellipse(0, 0, 40, 40);
    
    popMatrix();
  }
}
