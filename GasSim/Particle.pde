public class Particle{
  PVector position, velocity;
  float mass, radius;
  int period;
  color c;
  boolean delay;
  
  public Particle(float x, float y, float xSpeed, float ySpeed, int period_) {
    position = new PVector(x, y);
    velocity = new PVector(xSpeed * random(1, 9), ySpeed * random(1, 9));
    period = period_;
    if(period == 1) {
      mass = 4;
      radius = 140/20;
    }
    if(period == 2) {
      mass = 20;
      radius = 154/20;
    }
    if(period == 3) {
      mass = 40;
      radius = 188/20;
    }
  }
    

    void display() {
      noStroke();
      fill(31, 123, 43);
    circle(position.x, position.y, radius*2);
    

  }
  
  void setX(float xx){
    position.x = xx;
  }
  void setY(float yy){
    position.y = yy;
  }
  
 
  void move(Container container){
    position.add(velocity);
    if(position.x + radius > container.boxX + container.boxWidth) {
        position.x = container.boxX + container.boxWidth - radius;
      }
      if(position.y + radius > container.boxY + container.boxHeight) {
        position.y = container.boxY + container.boxHeight - radius;
      }
      if(position.x - radius < container.boxX){
        position.x = container.boxX + radius;
      }
      if(position.y - radius  < container.boxY){
        position.y = container.boxY + radius;
      }
  }
  
  public void wallCollide(Container container) {
    if (position.x <= radius + container.boxX || position.x >= container.boxX + container.boxWidth - radius) {
      velocity.x *= -1;
    }
    if (position.y <= radius + container.boxY || position.y >= container.boxY + container.boxHeight - radius) {
      velocity.y *= -1;
    }
  }
  
  public void particleCollide(Particle other) {
    float touchingDistance = radius + other.radius;
    PVector difference = PVector.sub(position, other.position);
    if(difference.mag() < touchingDistance) {
      PVector v1 = PVector.mult(velocity, (mass - other.mass));
      PVector v2 = PVector.mult(other.velocity, (2 * other.mass));
      PVector newVelocity = PVector.add(v1, v2).div(mass + other.mass);
      velocity = newVelocity.copy();
      other.velocity = newVelocity.copy().mult(-1);
    }
    
  }
}
