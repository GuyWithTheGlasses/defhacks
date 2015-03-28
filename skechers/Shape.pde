class Shape{
  int x, y, r;
  
  Shape(int xcor, int ycor, int radius){
    x = xcor;
    y = ycor;
    r = radius;
  }
  
  int getX(){
    return x;
  }
  
  void setX(int a){
    x = a;
  }
  
  int getY(){
    return y;
  }
  
  void setY(int b){
    y = b;
  }
  
  int getR(){
    return r;
  }
  
  void setR(int c){
    r = c;
  }
  
  void addX(int inc){
    x = x + inc;
  }
  
  void addY(int inc){
    y = y + inc;
  }
  
  void drawCircle(int col){
    fill(col);
    ellipse(x, y, 2*r, 2*r);
  }
  
}
