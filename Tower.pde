//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING = 0;
  final int PLACED = 1;

  boolean exists;
  float x, y;
  int cooldown, threshold;
  int slowCounty;
  int towerMode;
  int towerType;
  int cost;
  int county;
  boolean circle;

  Tower(int type) {
    //float _x, float _y, int _c, int _th
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    circle = false;
    slowCounty = 0;
    county = 0;
    towerMode = PLACING;
    exists = false;
    towerType = type;
    if (towerType== GUN) threshold = 30;
    if (towerType == AOE) threshold = 50;
    if (towerType == SNIPER) threshold = 90;
    if (towerType == SLOW) threshold = 30;
  }

  void show() {
    println(exists);
    for (int i = 0; i < towers.size(); i++) {
          Tower myTower = towers.get(i);
          
          if (myTower.towerMode == PLACED) {
          if (dist(myTower.x, myTower.y, mouseX, mouseY) < 60) {
            exists = true;
            break;
          } else {
            exists = false;
          }
        }
    }
    if (towerMode == PLACING) {
      x = mouseX;
      y = mouseY;
      if (mousePressed && mouseX > 175) {

        

        if (!exists) {
          towerMode = PLACED;
        }
      }
    }




    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAOETower();
    if (towerType == SNIPER) showSniperTower();
    if (towerType == SLOW) showSlowTower();
  }

  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    square(x, y, 40);
  }

  void showAOETower() {
    stroke(black);
    fill(red);
    strokeWeight(3);
    circle(x, y, 45);
  }

  void showSniperTower() {
    stroke(white);
    fill(black);
    strokeWeight(3);
    rect(x, y, 80, 50);
    stroke(white);
    strokeWeight(12);

    for (int i = 0; i < mobs.size(); i++) {
      Mob myMob = mobs.get(0);
      strokeWeight(map(cooldown, 0, 90, 0, 25));


      if (cooldown > 80) {
        stroke(red);
      }

      line(x, y-30, myMob.x+5, myMob.y+20);
    }
  }

  void showSlowTower() {
    strokeWeight(5);
    stroke(gray);
    fill(white);
    circle(x, y, 45);
  }



  void act() {

    if (towerType == GUN) gunTowerAct();
    if (towerType == AOE) aoeTowerAct();
    if (towerType == SNIPER) sniperTowerAct();
    if (towerType == SLOW) slowTowerAct();
  }

  void gunTowerAct() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); //UP
      bullets.add(new Bullet(x, y, 0, 10)); //DOWN
      bullets.add(new Bullet(x, y, -10, 0)); //LEFT
      bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
    }
  }

  void aoeTowerAct() {
    if (mode == PLAY) {
      cooldown++;
    } else {
      cooldown = 0;
    }

    if (cooldown > threshold) {
      rings.add(new AoE_Ring(x, y, 200));

      cooldown = 0;
    }

    for (int i = 0; i < rings.size(); i++) {
      county++;
      AoE_Ring myRing = rings.get(i);
      myRing.show();


      if (county == 15) {
        rings.remove(i);
        county = 0;
      }
    }
  }

  void slowTowerAct() {
    cooldown++;

    if (cooldown > threshold) {
      slows.add(new SlowRing(x, y, 200));

      cooldown = 0;
    }

    for (int i = 0; i < slows.size(); i++) {
      slowCounty++;
      SlowRing mySlow = slows.get(i);
      mySlow.show();


      if (slowCounty == 15) {
        slows.remove(i);
        slowCounty = 0;
      }
    }
  }





  void sniperTowerAct() {

    cooldown++;
    if (cooldown >= threshold) {
      Mob myMob = mobs.get(0);


      myMob.hp-=3;
      cooldown = 0;
    }
  }
}
