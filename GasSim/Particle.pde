public class Particle{
  float x,y,xspeed,yspeed;
  String element;
  
  public Particle(float x_, float y_, float xspeed_, String ele, float yspeed_){
    x = x_;
    y = y_;
    xspeed = xspeed_;
    yspeed = yspeed_;
    element = ele;
    }
    

    void display() {
    
    
    if(element.equals("Helium")){
      fill(0);
      ellipse(x,y,25,25);
      
    }
    if(element.equals("Neon")){
      ellipse(x,y,35,35);
      //fill();
    }
    if(element.equals("Argon")){
      ellipse(x,y,45,45);
      //fill();
    }
  }
  void setX(float xx){
    x = xx;
  }
  void setY(float yy){
    y = yy;
  }
}
