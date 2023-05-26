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
private int resizeKnobX;
private int resizeKnobY;

   private int pumpBX;
  private int pumpBY;
  public ArrayList<Particle>particleList;
  public Container() {
    constantVar = new String[] {"P", "V", "n", "T"};
    
    boxWidth = 600;
    boxHeight = 450;
    wallCollisions = 0;
    lidStatus = true;
    P = 0;
    V =0;
    n = 0;
    T = 0;
    boxX = 200;
    boxY = 150;
    pumpBX = 100;
    pumpBY = 200;
    resizeKnobX = boxX + boxWidth ;
    resizeKnobY = boxY + boxHeight/2;
    particleList = new ArrayList<Particle>();
  }
  public void addSomeParticles(){
    for(int i = 0; i<3; i++){
      particleList.add(new Particle(220+10*i,200+10*i, 5, 5, 1));

    }
  }
  public ArrayList getArrayL(){
    return particleList;
  }
  
  public void display() {
  rect(boxX, boxY, container.boxWidth, container.boxHeight);
  rect(pumpBX, pumpBY, 80,70);
  rect(resizeKnobX+ 40, resizeKnobY, 20,50);
  stroke(200);
  line(resizeKnobX, resizeKnobY, resizeKnobX+40, resizeKnobY);
  line(resizeKnobX, resizeKnobY+50, resizeKnobX+40, resizeKnobY+50);
  }
  boolean mouseOnVolB(){
    if(mouseX >= resizeKnobX && mouseX <= resizeKnobX + 60 && mouseY >= resizeKnobY && mouseY <= resizeKnobY + 50){
      
      return true;
     
    }
    return false;
  }
  
  void changeWidth(){
    if(mouseX < 900){
    boxWidth = mouseX;
    System.out.println(boxWidth);
    }
  }
  public void changeVol(){
    
  }



}
