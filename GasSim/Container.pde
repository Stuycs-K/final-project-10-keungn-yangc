public class Container{
  private String[] constantVar;
  private int boxX;
  private int boxY;
  private  int boxWidth;
  private  int boxHeight;
  private  int wallCollisions;
  private  boolean lidStatus;
  private  double P;
  private  double V;
  private  int n;
  private  final double R = 0.0821;
  private  double T;
<<<<<<< HEAD
=======
  private int pumpBX;
  private int pumpBY;
  public ArrayList<Particle>particleList;
>>>>>>> 98d2e3d43ceadff63bf238cd2eb04cfde08d233e
  
 
   private int pumpBX;
  private int pumpBY;
  public ArrayList<Particle>particleList;
  public Container() {
    constantVar = new String[] {"P", "V", "n", "T"};
    boxX = 200;
    boxY = 150;
    boxWidth = 600;
    boxHeight = 45;
    wallCollisions = 0;
    lidStatus = true;
    P = 0;
    V =0;
    n = 0;
    T = 0;
<<<<<<< HEAD
    boxX = 200;
    boxY = 150;
    pumpBX = 100;
    pumpBY = 200;
    particleList = new ArrayList<Particle>();
  }
  public void addSomeParticles(){
    for(int i = 0; i<10; i++){
      particleList.add(new Particle(206,200, 10, 10, 1));
=======
    pumpBX = 100;
    pumpBY = 200;
    particleList = new ArrayList<Particle>();

    
  }
  public void addSomeParticles(){
    for(int i = 0; i<10; i++){
      particleList.add(new Particle(500,400, 10, 10, 1));
>>>>>>> 98d2e3d43ceadff63bf238cd2eb04cfde08d233e
    }
  }
  public ArrayList getArrayL(){
    return particleList;
  }
  
  public void display() {
  rect(boxX, boxY, container.boxWidth, container.boxHeight);
  rect(pumpBX, pumpBY, 80,70);
  }
<<<<<<< HEAD
  boolean mouseOnPump(){
=======
boolean mouseOnPump(){
>>>>>>> 98d2e3d43ceadff63bf238cd2eb04cfde08d233e
    if(pmouseX >= 100 && pmouseX <= 180 && pmouseY >= 200 && pmouseY <= 270){
      fill(255, 204, 0);
      ellipse(300,300,100,100);
      return true;
    }
    return false;
  }  void mousePressed(){
    if(mouseOnPump()){
      fill(255, 204, 0);
      ellipse(300,300,100,100);
   }
  }
<<<<<<< HEAD
=======
  
>>>>>>> 98d2e3d43ceadff63bf238cd2eb04cfde08d233e
}
