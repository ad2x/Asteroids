void playing () {
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives <= 0) {
      myObjects.remove(i);
    } else {
      i++;
    }    
  } 
  
  myShip.show();
  myShip.act();
  
  //Asteroid spawning
  asteroidTimer++;
  if (asteroidTimer == 240) {
    asteroidTimer = 0;
    myObjects.add(new Asteroid());
  }
  
  //Game Timer
  timepassed++;
  
  myUI.show(70, 70);
}
