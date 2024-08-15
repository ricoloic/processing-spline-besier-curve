PVector point1;
PVector point2;
PVector point3;
PVector point4;

void setup() {
  size(800, 800);
  
  point1 = new PVector(random(100, width - 100), random(100, height - 100));
  point2 = new PVector(random(100, width - 100), random(100, height - 100));
  point3 = new PVector(random(100, width - 100), random(100, height - 100));
  point4 = new PVector(random(100, width - 100), random(100, height - 100));
}

void draw() {
  background(33);
  noFill();
  stroke(230, 50, 90);
  strokeWeight(10);
  
  point2.set(mouseX, mouseY);

  point(point1.x, point1.y);
  point(point2.x, point2.y);
  point(point3.x, point3.y);
  point(point4.x, point4.y);
  
  stroke(255);
  strokeWeight(2);

  besier(point1, point2, point3, point4);
}

void besier(PVector p1, PVector p2, PVector p3, PVector p4) {
  int count = 100;
  beginShape();
  vertex(p1.x, p1.y);
  for (int i = 1; i < count + 1; i++) {
    float amt = (float) i / (count + 1);
    PVector p5 = lerpVector(p1, p2, amt);
    PVector p6 = lerpVector(p2, p3, amt);
    PVector p7 = lerpVector(p3, p4, amt);
    PVector p8 = lerpVector(p5, p6, amt);
    PVector p9 = lerpVector(p6, p7, amt);
    PVector p10 = lerpVector(p8, p9, amt);
    vertex(p10.x, p10.y);
  }
  vertex(p4.x, p4.y);
  endShape();
}

PVector lerpVector(PVector p1, PVector p2, float amt) {
  return new PVector(lerp(p1.x, p2.x, amt), lerp(p1.y, p2.y, amt));
}
