Container container = new Container();
  Particle test1 = new Particle(500,400, 10, 10, 1);
  Particle test2 = new Particle(500,500, 10, 10, 3);
void setup() {
  size(1000, 750);
  background(0);
  
}

void draw() {
  background(0);
  stroke(0);
  fill(255);
  container.display();
  test1.move();
  test1.display();
  test1.wallCollide(container);
  
  test2.move();
  test2.display();
  test2.wallCollide(container);
  
  test1.particleCollide(test2);
  test2.particleCollide(test1);
  
  /*
  if (position.x + radius >= width || position.x - radius <= 0) {
      if (position.x + radius >= width) {
        x = width - radius;
      } else{
        x = radius;
      }
      xspeed = -1 * xspeed;
    }
    if (y + radius >= height || y - radius <= 0) {
      if (y + radius >= height) {
        y = height - radius;
      } else {
        y = radius;
      }
      yspeed = -1 * yspeed;
    }*/
}
