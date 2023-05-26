Container container = new Container();
  Particle test1 = new Particle(500,400, 10, 10, 1);

  Particle test2 = new Particle(500,400, 10, 10, 1);
  ArrayList<Particle> pL = new ArrayList<Particle>();

private int released;

    private int pumpBX;
  private int pumpBY;
  boolean mouseOnPump(){
    if(pmouseX >= 100 && pmouseX <= 180 && pmouseY >= 450 && pmouseY <= 520){

      return true;
    }
    return false;
  }
  void mouseClicked(){


    if(mouseOnPump()){

      container.addSomeParticles();
      pL = container.getArrayL();
      
    }
    System.out.println(mouseX + " " + mouseY);
  }
  void mouseReleased(){
    released = mouseX;
  }
  void mouseDragged(){
    if(container.mouseOnVolB()){
       System.out.println("true");
      
           int newPlace = released;
       
       System.out.println(newPlace);
       if(container.changeResizeX(newPlace)){
         System.out.println("dif place");
         
    }
       }
  }
  


  

void setup() {
  size(1000, 750);
  background(0);
  
}

void draw() {
  background(0);
  stroke(0);
  fill(255);

  container.display();
  //test1.move();
  //test1.display();
  //test1.wallCollide(container);
  //test2.move();
  //test2.wallCollide(container);
  //test2.display();
  //test2.wallCollide(container);
 
  for(Particle p : pL){
    p.move();
    p.wallCollide(container);
    p.display();
    System.out.println(pL.size());
  }
 
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
