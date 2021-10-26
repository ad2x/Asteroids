void over() {
  image(background1, 0, 0);

  textSize(150);
  text("Game", width/2, height/4-100);
  text("Over", width/2, 2*height/5-100);
  
  textSize(50);
  text("Score: " + score, width/2, height/2);
  
  if (score == highscore) {
    text("New Highscore!", width/2, height/2+50);
  } else {
    text("Highscore: " + highscore, width/2, height/2+50);
  }
  
  over1.show("Play Again", 45);
}
