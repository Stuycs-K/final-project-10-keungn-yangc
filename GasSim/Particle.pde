public class Particle{
  PVector position, velocity;
  float mass, radius;
  int period;
  color c;
  
  public Particle(float x, float y, float xSpeed, float ySpeed, int period_) {
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    period = period_;
    if(period == 1) {
      mass = 4;
      radius = 140/10;
    }
    if(period == 2) {
      mass = 20;
      radius = 154/10;
    }
    if(period == 3) {
      mass = 40;
      radius = 188/10;
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
  
 
  void move(){
    position.add(velocity);
  }
  
  
}
