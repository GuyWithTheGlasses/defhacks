class Shape {
  int x, y, r;
  int col1, col2, col3;

  Shape(int xcor, int ycor, int radius, int c1, int c2, int c3) {
    x = xcor;
    y = ycor;
    r = radius;
    col1 = c1;
    col2 = c2;
    col3 = c3;
  }

  int getX() {
    return x;
  }

  void setX(int a) {
    x = a;
  }

  int getY() {
    return y;
  }

  void setY(int b) {
    y = b;
  }

  int getR() {
    return r;
  }

  void setR(int c) {
    r = c;
  }

  void addX(int inc) {
    x = x + inc;
  }

  void addY(int inc) {
    y = y + inc;
  }

  void drawCircle() {
    fill(col1, col2, col3);
    ellipse(x, y, 2*r, 2*r);
  }
}

