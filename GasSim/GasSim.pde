Container container = new Container();
void setup() {
  size(1000, 750);
  background(0);
}

void draw() {
  stroke(255);
  rect(200, 150, container.boxWidth, container.boxHeight);
}
