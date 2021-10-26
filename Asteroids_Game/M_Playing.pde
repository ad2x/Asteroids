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
  if (asteroidTimer == 150) {
    asteroidTimer = 0;
    myObjects.add(new Asteroid());
  }
  
  //Enemy ship spawning
  eshipTimer++;
  if (eshipTimer == 750) {
    eshipTimer = 0;
    myObjects.add(new enemyShip());
  }
  
  //Game Timer
  timePassed++;
  
  myLives.show(70, 70);
  myTimer.show(width/2, 7*height/8, width/2, height/16);
  
  myScore.show(width - 115, 45);
}
