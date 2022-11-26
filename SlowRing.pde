class SlowRing {
  float x, y;
  int d;


  SlowRing(float _x, float _y, int _d) {
    x = _x;
    y = _y;
    d = _d;

  }

  void show() {
    
    stroke(#FFFF00, 50);
    fill(#FFFF00, 20);
    circle(x, y, d);
  }

 

  
  
  
}
