public class Particle {
  PVector position, velocity;
  float mass, radius;
  int period;
  color c;
  
  
  public Particle(int period_) {
    period = period_;
    if (period == 1) {
      mass = 4;
      radius = 7;
      c = color(255, 0, 0);
    }
    if (period == 2) {
      mass = 10;
      radius = 10;
      c = color(0, 255, 0);
    }
    if (period == 3) {
      mass = 20;
      radius = 13;
      c = color(0, 0, 255);
    }
    position = new PVector(220 + random(5, 15), 200 + random(5, 15));
    float xComponent = random(0.2, 0.8);
    float yComponent = (float)Math.sqrt(1 - (xComponent*xComponent));
    velocity = new PVector((float)(Math.sqrt(300/(0.5*mass)) * xComponent), (float)(Math.sqrt(300/(0.5*mass)) * yComponent));
  }
  
  public Particle(int period_, float T) {
    period = period_;
    if (period == 1) {
      mass = 4;
      radius = 7;
      c = color(255, 0, 0);
    }
    if (period == 2) {
      mass = 10;
      radius = 10;
      c = color(0, 255, 0);
    }
    if (period == 3) {
      mass = 20;
      radius = 13;
      c = color(0, 0, 255);
    }
    position = new PVector(220 + random(5, 15), 200 + random(5, 15));
    float xComponent = random(0.2, 0.8);
    float yComponent = (float)Math.sqrt(1 - (xComponent*xComponent));
    velocity = new PVector((float)(Math.sqrt(T/(0.5*mass)) * xComponent), (float)(Math.sqrt(T/(0.5*mass)) * yComponent));
  }


  void display() {
    fill(c);
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

  public float wallCollide(Container container) {
    float collisionMomentum = 0;
    float offset;
    offset = position.x + radius - container.boxX - container.boxWidth;
    if (offset > 0) {
      position.x -= offset*2;
      velocity.x *= -1;
      collisionMomentum += mass * abs(velocity.x);
    } else {
      offset = position.x - radius - container.boxX;
      if (offset < 0) {
        position.x -= offset*2;
        velocity.x *= -1;
        collisionMomentum += mass * abs(velocity.x);
      }
    }

    offset = position.y + radius - container.boxY - container.boxHeight;
    if (offset > 0) {
      position.y -= offset*2;
      velocity.y *= -1;
      collisionMomentum += mass * abs(velocity.y);
    } else {
      offset = position.y - radius - container.boxY;
      if (offset < 0) {
        position.y -= offset*2;
        velocity.y *= -1;
        collisionMomentum += mass * abs(velocity.y);
      }
    }
    return collisionMomentum;
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
