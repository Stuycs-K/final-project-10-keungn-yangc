Container container = new Container();
  Particle test1 = new Particle(500,400, 10, 10, 1);

  Particle test2 = new Particle(500,400, 10, 10, 1);
  ArrayList<Particle> pL = new ArrayList<Particle>();



    private int pumpBX;
  private int pumpBY;
  boolean mouseOnPump(){
    if(pmouseX >= 100 && pmouseX <= 180 && pmouseY >= 200 && pmouseY <= 270){

      return true;
    }
    return false;
  }
  void mouseClicked(){


    if(mouseOnPump()){

      container.addSomeParticles();
      pL = container.getArrayL();
      
    }
  }
  
  void mouseDragged(){
    if(container.mouseOnVolB()){
       System.out.println("true");
       container.changeWidth();
    }
  }

    //if(mouseOnPump()){
      
    //  container.addSomeParticles();
    //  ArrayList<Particle> test;
    //test = container.getArrayL();
    //  for(int i = 0; i< test.size(); i++){
    //    System.out.println(test.get(i));
    //  }
    //}
  

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
