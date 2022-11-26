void info() {
  drawInfo();
  handleInfoClicks();
}

void drawInfo() {

  background(gray);


  textSize(65);
  fill(black);
  text("Tower Info", 500, 120);

  //return button
  infoReturn.show();

  //gun
  fill(black);
  image(gunInfo, 260, 250, 250, 150);
  textSize(23);
  text("Gun Tower: Shoots out bullets", 260, 340);
  text("from all four sides", 260, 370);
  text("dealing 1 dmg per bullet", 260, 400);
  //aoe
  image(aoeInfo, 720, 250, 250, 150);
  text("AOE Tower: Deals Area of", 720, 340);
  text("effect damage; Damage does not stack", 720, 370);

  //sniper
  image(sniperInfo, 260, 550, 250, 150);
  text("Deals high burst damage to", 260, 640);
  text("the first spawned mob", 260, 670);

  //slow
  image(slowInfo, 720, 550, 250, 150);
  text("Slows down mobs", 720, 640);
  text("without dealing damage", 720, 660);
}

void handleInfoClicks() {

  if (infoReturn.clicked) {
    mode = PLAY;
  }
}
