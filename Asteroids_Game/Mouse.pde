void mousePressed() {
  if (mode == start) {
    
  } else if (mode == playing) {
    
  } else if (mode == paused) {
    
  } else if (mode == over) {
     
  }
}

void mouseReleased() {
  if (mode == start) {
    start1.click();
  } else if (mode == playing) {
    
  } else if (mode == paused) {
    
  } else if (mode == over) {
    //Part of a ducttape solution
    if (over1.pressed() == true && mode == over) {
      
      mode = playing;
      
      //Resets all vars
      myShip.reset();
      timePassed = 0;
      initTime = 0;
      score = 0;
      asteroidTimer = 0;
      eshipTimer = 0;
      
      int i = 0;
      
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);
        myObjects.remove(i);
      }
    }
  }
}
