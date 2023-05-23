public class Particle{
  float x,y,xspeed,yspeed;
  
  public Particle(float x_, float y_, float xspeed_, String ele, float yspeed_){
    x = x_;
    y = y_;
    xspeed = xspeed_;
    yspeed = yspeed_;
    if(ele.equals("Helium")){
      ellipse(x,y,25,25);
      //fill();
    }
    if(ele.equals("Neon")){
      ellipse(x,y,35,35);
      //fill();
    }
    if(ele.equals("Argon")){
      ellipse(x,y,45,45);
      //fill();
    }
    
}
}
