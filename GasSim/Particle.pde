public class Particle {
  PVector position, velocity;
  float mass, radius;
  int period;
  color c;
  boolean escaped;
  
  
  public Particle(int period_) {
    escaped = false;
    period = period_;
    if (period == 1) {
      radius = 4;
      c = color(255, 0, 0);
    }
    if (period == 2) {
      radius = 6;
      c = color(0, 255, 0);
    }
    if (period == 3) {
      radius = 9;
      c = color(0, 0, 255);
    }
    mass = (radius * radius * PI)/10;
    position = new PVector(220 + random(5, 15), 200 + random(5, 15));
    float xComponent = random(0.2, 0.8);
    float yComponent = (float)Math.sqrt(1 - (xComponent*xComponent));
    velocity = new PVector((float)(Math.sqrt(300/(0.5*mass)) * xComponent), (float)(Math.sqrt(300/(0.5*mass)) * yComponent));
  }
  
  public Particle(int period_, float T) {
    period = period_;
    if (period == 1) {
      radius = 4;
      c = color(255, 0, 0);
    }
    if (period == 2) {
      radius = 6;
      c = color(0, 255, 0);
    }
    if (period == 3) {
      radius = 9;
      c = color(0, 0, 255);
    }
    mass = (radius * radius * PI)/10;
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
        if(container.lidOpeningWidth>0) {
          float crossX = position.x + offset/velocity.y * velocity.x;
          if(crossX >= container.boxX + container.LID_OPENING_X+radius && 
            crossX < container.boxX + container.LID_OPENING_X +
            container.lidOpeningWidth-radius) {
            escaped = true;
          }
        }
     
        if(!escaped) {
          position.y -= offset*2;
          velocity.y *= -1;
          collisionMomentum += mass * abs(velocity.y);
        }
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
