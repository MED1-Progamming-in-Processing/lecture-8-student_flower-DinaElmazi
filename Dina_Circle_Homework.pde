Entity inactiveCircle, activeCircle;

float inactiveSize = 25;
float activeSize = 55;
color BGround = #E5E5E5;

void setup() {
  float xOne = random(0 + width/4, width - width/4);
  float yOne = random(0 + height/4, height - height/4);
  float xTwo = random(0 + width/4, width - width/4);
  float yTwo = random(0 + height/4, height - height/4);

  float SpeedX = random(-5, 5);
  float SpeedY = random(-5, 5);

  boolean mouseMoving = true;

  size(1000, 700);

  inactiveCircle = new Entity(xOne, yOne, inactiveSize, SpeedX, SpeedY);
  activeCircle = new Entity(xTwo, yTwo, activeSize, SpeedX, SpeedY, mouseMoving);
}

void draw() {
  background(BGround);

  inactiveCircle.display();
  inactiveCircle.move();
  activeCircle.display();
  activeCircle.move();

  inactiveCircle.clash(activeCircle);
}
