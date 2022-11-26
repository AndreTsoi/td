//This function draws the INTRO screen.

void intro() {
  background(white);
  //introAnimation.show();
  start.show();
  if (start.clicked) {
    mode = MAPSELECT;
  }
}
