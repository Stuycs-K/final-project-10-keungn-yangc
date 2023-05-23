Container container = new Container();
void setup() {
  size(1000, 750);
  background(0);
}

void draw() {
  stroke(255);
  fill(255);
  rect(200, 150, container.boxWidth, container.boxHeight);
  
  Particle test1 = new Particle(500,400, 30,"Helium", 30);
  test1.display();
}
