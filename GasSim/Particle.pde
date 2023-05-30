public class Particle {
  PVector position, velocity;
  float mass, radius;
  int period;
  color c;
  boolean delay;

  public Particle(float x, float y, float xSpeed, float ySpeed, int period_) {
    position = new PVector(x, y);
    velocity = new PVector(xSpeed * random(1, 9), ySpeed * random(1, 9));
    period = period_;
    if (period == 1) {
      mass = 4;
      radius = 140/20;
    }
    if (period == 2) {
      mass = 20;
      radius = 154/20;
    }
    if (period == 3) {
      mass = 40;
      radius = 188/20;
    }
  }


  void display() {
    noStroke();
    fill(31, 123, 43);
    circle(position.x, position.y, radius*2);
  }

  void setX(float xx) {
    position.x = xx;
  }
  void setY(float yy) {
    position.y = yy;
  }


  void move() {
    position.add(velocity);
  }

  public void wallCollide(Container container) {
    float offset;
    offset = position.x + radius - container.boxX - container.boxWidth;
    if (offset > 0) {
      position.x -= offset*2;
      velocity.x *= -1;
    } else {
      offset = position.x - radius - container.boxX;
      if (offset < 0) {
        position.x -= offset*2;
        velocity.x *= -1;
      }
    }
    
    offset = position.y + radius - container.boxY - container.boxHeight;
    if (offset > 0) {
      position.y -= offset*2;
      velocity.y *= -1;
    } else {
      offset = position.y - radius - container.boxY;
      if (offset < 0) {
        position.y -= offset*2;
        velocity.y *= -1;
      }
    }
  }

  public void particleCollide(Particle other) {
    float touchingDistance = radius + other.radius;
    float touchingDistanceSq = touchingDistance*touchingDistance;
    PVector difPos = PVector.sub(position, other.position);
    float difPosMagSq = difPos.magSq();
    if (difPosMagSq < touchingDistanceSq) {
      PVector difVel = PVector.sub(velocity, other.velocity);
      if (difPos.dot(difVel) < 0) {
        float factor = difPos.dot(difVel) /((mass+other.mass)*difPosMagSq);
        PVector tmp = PVector.mult(difPos, 2*other.mass*factor);
        velocity.sub(tmp);
        tmp = PVector.mult(difPos, 2*mass*factor);
        other.velocity.add(tmp);
      }
    }
  }
}
