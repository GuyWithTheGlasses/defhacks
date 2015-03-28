import java.util.*;
import java.lang.Math;

/*
 STARTED FROM THE TOP
 an indie game by
 TEAM APACHE inc.
 est. 2015
 
 IGN rated this game a perfect 10/10 even while it was in pre-alpha.
 After its official beta release it was given an 8/8 for gr8 b8 m8.
 This program does stuff, mainly unit collision and cause seizures
 */
Shape s = new Shape(25, 25, 25, 255, 255, 255);
int step = 8;  
boolean[] keys = new boolean[4];
int[] bgcolor = new int[3];
Shape[] enviro = new Shape[10];
int[] envirocolors = new int[10];
int framespassed = 0;

void setup() {
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  size(800, 640);
  background(bgcolor[0], bgcolor[1], bgcolor[2]);
  addShapes();
}

void addShapes() {
  Random rnd = new Random();
  if (framespassed % 30 == 0) {
    for (int h = 0; h < 10; h++) {
      for (int i1 = 0; i1 < 3; i1++) {
        bgcolor[i1] = rnd.nextInt(255);
      }
      int c1 = rnd.nextInt(255);
      int c2 = rnd.nextInt(255);
      int c3 = rnd.nextInt(255);
      int xloc = rnd.nextInt(700) + 100;
      int yloc = rnd.nextInt(540) + 100;
      int rad = rnd.nextInt(50) + 50;
      Shape newSh = new Shape(xloc, yloc, rad, c1, c2, c3);
      /*
      if (col == 0) {
       newSh = new Shape(xloc, yloc, rad, 255, 255, 255);
       }
       if (col == 1) {
       newSh = new Shape(xloc, yloc, rad, 237, 28, 36);
       }
       if (col == 2) {
       newSh = new Shape(xloc, yloc, rad, 255, 242, 0);
       }
       if (col == 3) {
       newSh = new Shape(xloc, yloc, rad, 34, 117, 76);
       }
       if (col == 4) {
       newSh = new Shape(xloc, yloc, rad, 0, 162, 232);
       }
       */
      enviro[h] = newSh;
    }
  }
  for (int i = 0; i < enviro.length; i++) {
    int col = rnd.nextInt(5);
    Shape sh = enviro[i];
    if (col == 0) {
      sh.drawCircle();
    }
    if (col == 1) {
      sh.drawCircle();
    }
    if (col == 2) {
      sh.drawCircle();
    }
    if (col == 3) {
      sh.drawCircle();
    }
    if (col == 4) {
      sh.drawCircle();
    }
  }
}

void draw() { 
  noStroke();
  fill(255);
  background(bgcolor[0], bgcolor[1], bgcolor[2]);
  frameRate(30);
  s.drawCircle();
  if (keys[0] && !isColliding()) {
    s.addY(-1*step);
  }
  if (keys[1] && !isColliding()) {
    s.addX(-1*step);
  }
  if (keys[2] && !isColliding()) {
    s.addY(step);
  }
  if (keys[3] && !isColliding()) {
    s.addX(step);
  }
  borderCheck();
  addShapes();
  framespassed++;
  if (s.getX() == width - 25 && s.getY() == height - 25) {
    clear();
    println("CONGRATULATIONS! YOU WON!");
    println("Time: "+framespassed / 30);
    exit();
  }
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

boolean isColliding() {
  for (int i = 0; i < enviro.length; i++) {
    if (intersects(s, enviro[i])) {
      return true;
    }
  }
  return false;
}

boolean intersects(Shape s1, Shape s2) {
  boolean set = false;
  int xdiff = s1.getX() - s2.getX();
  int ydiff = s1.getY() - s2.getY();
  int rsum = s1.getR()+s2.getR();
  int distance = (xdiff)*(xdiff)+(ydiff*ydiff);
  set = distance < rsum*rsum;
  if (set) {
    double theta = Math.atan2(ydiff * 1.0, xdiff * 1.0);
    int radsum = s1.getR() + s2.getR();
    int sine = (int) (radsum*(Math.sin(theta)) *1.05) ;
    int cosine = (int) (radsum*(Math.cos(theta)) *1.05) ;
    s1.setX(s2.getX() + cosine);
    s1.setY(s2.getY() + sine);
  }
  return set;
}

