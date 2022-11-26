//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d;
  float hp, maxhp;
  int value;
  color fillColor, strokeColor;
  float maxSpeed, currentSpeed;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    value = 1;
    maxhp = 3;
    hp = maxhp;
    fillColor = purple;
    strokeColor = pink;
    maxSpeed =1;
    currentSpeed = maxSpeed;
  }


  void show() {
    
    stroke(strokeColor);
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }


  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+5)-2, 54, 14);//background
    fill(pink);
    rect(x-25, y-(d+5), 50, 10);
    fill(green);
    rect(x-25, y-(d+5), hp*50/maxhp, 10);
    rectMode(CENTER);
  }
  void act() {
    slowReset++;

    if (slowReset >= 15) {
      slowReset = 0;
      currentSpeed = maxSpeed;
    }



    x = x + vx*currentSpeed;
    y = y + vy*currentSpeed;
    aoeInvincible++;

    for (int i = 0; i < nodes.length; i++) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 5) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
    }


    for (int i = 0; i < bullets.size(); i++) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp--;
        myBullet.hp--;
      }
    }

    for (int j = 0; j < rings.size(); j++) {
      AoE_Ring myRing = rings.get(j);
      if (dist(myRing.x, myRing.y, x, y) < d/2 + myRing.d/2) {
        hp-=0.08;
      }
    }

    for (int j = 0; j < slows.size(); j++) {
      SlowRing mySlow = slows.get(j);
      if (dist(mySlow.x, mySlow.y, x, y) < d/2 + mySlow.d/2) {
        currentSpeed = maxSpeed * 0.4;
      }
    }
  }
}
