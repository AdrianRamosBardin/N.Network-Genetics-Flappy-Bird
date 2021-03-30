class Pipe{

  float top;
  float bottom;
  float x;
  float w;
  float speed;
  float spacing;

  Pipe(){
    //125
    spacing = 300;
    top = random(height/ 6, .75 * height);
    bottom = height - (top + spacing);
    w = 80;
    x = width;
    speed = 6;
  }

  void show(){
    fill(20);
    rectMode(CORNER);
    rect(x, 0, w, top);
    rect(x, height-bottom, w, bottom);
    //println("dibujado");
  }

  void update(){
    x -= speed;
  }

  boolean offscreen(){
    return x < -w;
  }

  boolean hit(Bird b){
    float a = (b.r/2);
    if (b.y < top+a || b.y+a > height-bottom){
      if (b.x+a > x && b.x < (x + w)+a)
        return true;
    }
    return false;
  }
}
