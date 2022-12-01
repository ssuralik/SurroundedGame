class Button {
  int x;
  int y;
  int l;
  int h;
  color c;

  //constructor
  Button(int bx, int by, int bl, int bh, color colorC) {
    x=bx;
    y=by;
    l=bl;
    h=bh;
    c=colorC;
  }

  void render() {
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    fill(c);
    rect(x, y, l, h, 5);
  }

  boolean isPressed() {
    rectMode(CENTER);
    int top=y-h/2;
    int bottom=y+h/2;
    int left=x-l/2;
    int right=x+l/2;

    if (mouseX >= left && mouseX <= right && mouseY<=bottom && mouseY>= top && mousePressed == true) {
      return true;
    }

    return false;
  }
}
