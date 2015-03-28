import java.util.*;

Shape s = new Shape(25, 25, 25);
Shape obstacle = new Shape(400, 400, 50);
int step = 10;  
boolean[] keys = new boolean[4];
int bgcolor = 195;
ArrayList<Shape> enviro = new ArrayList<Shape>();

void setup() {
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  size(800, 640);
  background(bgcolor);
  obstacle.drawCircle(0);
  enviro.add(obstacle);
}

void draw() {  
  fill(255);
  background(195, 195, 195);
  //frameRate(120);
  s.drawCircle(255);
  if (keys[0]) {//&& !intersects(x, y, diameter, diameter, 0)) {
    s.addY(-1*step);
  }
  if (keys[1]) {//&& !intersects(x, y, diameter , 1)) {
    s.addX(-1*step);
  }
  if (keys[2]) {//&& !intersects(x, y, RLEN, RWID, 2)) {
    s.addY(step);
  }
  if (keys[3]) {//&& !intersects(x, y, RLEN, RWID, 3)) {
    s.addX(step);
  }
  borderCheck();
  obstacle.drawCircle(0);
}

//0 = up, 1 = left, 2 = down, 3 = right
void keyPressed() {
  if (key == 'w' ||  key == 'W') {
    keys[0]=true;
  }
  if (key == 'a' || key == 'A') {
    keys[1]=true;
  }
  if (key == 's' || key == 'S') {
    keys[2]=true;
  }
  if (key == 'd' || key == 'D') {
    keys[3]=true;
  }
  borderCheck();
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    keys[0]=false;
  }
  if (key == 'a' || key == 'A') {
    keys[1]=false;
  }
  if (key == 's' || key == 'S') {
    keys[2]=false;
  }
  if (key == 'd' || key == 'D') {
    keys[3]=false;
  }
}

void borderCheck() {
  if (s.getX()-s.getR() < 0) {
    s.setX(s.getR());
  }
  if (s.getY()-s.getR() < 0) {
    s.setY(s.getR());
  }
  if (s.getX() > width - s.getR()) {
    s.setX(width - s.getR());
  }
  if (s.getY() > height - s.getR()) {
    s.setY(height - s.getR());
  }
}

boolean intersects(Shape s1, Shape s2){
  int xdiff = s1.getX() - s2.getX();
  int ydiff = s1.getY() - s2.getY();
  
}

/*boolean intersects(int c1x, int c1y, int c2x, int c2y, int c1r, int c2){
 int rsum = c1r+c2r;
 int dis = (c1x-c2x)*(c1x-c2x) + (c1y-c2y)*(c1y-c2y);
 return rsum*rsum>dis;
 }
 */

/*
boolean intersects(int x, int y, int dir) {
 int pixcolor = get(x, y); //color of the object you're moving
 boolean bool = false;
 int xcor = x - 
 
 if (dir == 0) {
 int upy = y - step;
 for (int i = upy; i < upy+step; i++) {
 for (int j = x; j < x+step; j++) {
 if (get(x, upy) != pixcolor && get(x, upy) != bgcolor) {
 bool = true;
 }
 }
 }
 } else if (dir == 1) {
 int lftx = x - step;
 for (int i = lftx; i < lftx+step; i++) {
 for (int j = y; j < y+step; j++) {
 if (get(lftx, y) != pixcolor && get(lftx, y) != bgcolor) {
 bool = true;
 }
 }
 }
 } else if (dir == 2) {
 int downy = y + step;
 for (int i = downy; i < downy+step; i++) {
 for (int j = x; j < x+step; j++) {
 if (get(x, downy) != pixcolor && get(x, downy) != bgcolor) {
 bool = true;
 }
 }
 }
 } else if (dir == 3) {
 int rightx = x + step;
 for (int i = rightx; i < rightx+step; i++) {
 for (int j = y; j < y+step; j++) {
 if (get(rightx, y) != pixcolor && get(rightx, y) != bgcolor) {
 bool = true;
 }
 }
 }
 }
 return bool;
 }
 */
