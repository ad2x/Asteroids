class Button {
  
  //Almost-fully universal button class
  //Parameters for location, size, shape, color, text, and target mode
  //I managed to make it automatically determine mouse hover and pressed colours based on input colours
  
  float x, y;
  //Size and strokeweight
  float sx, sy, sw;
  //Ending mode (mode the button goes to)
  int emode;
  //Circle vs square (true for circle false for square)
  boolean shape;
  //Button text
  int font;
  //Button colour
  color inner, outer;
  
  Button(int emode_, float x_, float y_, color inner_, color outer_, float sx_, float sy_, float sw_) {
    x = x_;
    y = y_;
    sx = sx_;
    sy = sy_;
    sw = sw_;
    shape = false;
    emode = emode_;
    inner = inner_;
    outer = outer_; 
  }
  
  Button(int emode_, float x_, float y_, color inner_, color outer_, float sx_, float sw_) {
    x = x_;
    y = y_;
    sx = sx_;
    sw = sw_;
    shape = true;
    emode = emode_;
    inner = inner_;
    outer = outer_; 
  }
  
  public void show (String text, int textSize) {
    pushMatrix();
    translate(x, y);
    
    fill(inner);
    stroke(outer);
    strokeWeight(sw);
    
    //Blends inner and outer to make new hovered and pressed colours without having to seperately add them
    //I spent so much time trying to figure out how to do this with blendColor() before realizing lerpColor did what I thought blendColor() was supposed to do -_-
    
    if (shape == true) {
      if (dist(mouseX, mouseY, x, y) <= sx/2) {
        stroke(lerpColor(outer, White, 0.3));
        if (mousePressed) {
          stroke(lerpColor(outer, Black, 0.3));
        }
      }
      ellipse(0, 0, sx, sx);
    } else if (shape == false) {
      if (mouseX >= x-sx/2 && mouseX <= x+sx/2 && mouseY >= y-sy/2 && mouseY <= y+sy/2) {
        stroke(lerpColor(outer, White, 0.3));
        if (mousePressed) {
          stroke(lerpColor(outer, Black, 0.3));
        }
      }
      rect(-sx/2, -sy/2, sx, sy);
    }
    
    fill(outer);
    textSize(textSize);
    text(text, 0, 0);
    
    popMatrix();
  }
  
  public void click () {
    if (shape == true && dist(mouseX, mouseY, x, y) <= sx/2) {
      mode = emode;
      timePassed = 0;
      initTime = 0;
    }
    if (shape == false && mouseX >= x-sx/2 && mouseX <= x+sx/2 && mouseY >= y-sy/2 && mouseY <= y+sy/2) {
      mode = emode;
      timePassed = 0;
      initTime = 0;
    }
  }
  
  public boolean pressed () {
    if (shape == true && shape == true && dist(mouseX, mouseY, x, y) <= sx/2) {
      return true;
    } else if (shape == false && shape == false && mouseX >= x-sx/2 && mouseX <= x+sx/2 && mouseY >= y-sy/2 && mouseY <= y+sy/2) {
      return true;
    } else {
      return false;
    }
  }
}
