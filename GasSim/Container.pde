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
  
  public boolean constantN;
  public boolean constantV;
  public boolean constantT;
  public boolean constantP;
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
    pumpBY = 450;
    resizeKnobX = boxX + boxWidth ;
    resizeKnobY = boxY + boxHeight/2;
    particleList = new ArrayList<Particle>();
    
  }
  public void addSomeParticles(){

    for(int i = 0; i<3; i++){
      particleList.add(new Particle(220 + random(5, 15),200+ random(5, 15), 1, 1, 3));


    }
  }
  public ArrayList getArrayL(){
    return particleList;
  }
  
  public void display() {
  rect(boxX, boxY, container.boxWidth, container.boxHeight);
  rect(pumpBX, pumpBY, 80,70);
  fill(250,20,30);
  rect(resizeKnobX+ 40, resizeKnobY, 20,50);
  stroke(200);
  line(resizeKnobX, resizeKnobY, resizeKnobX+40, resizeKnobY);
  line(resizeKnobX, resizeKnobY+50, resizeKnobX+40, resizeKnobY+50);
  fill(125);
  rect(30,175,150,250);//control box
  fill(255);
  textSize(25);
  text("Hold Constant",31 ,200);
  ellipse(45,220,17,17);
  ellipse(45,250,17,17);
  ellipse(45,280,17,17);
  ellipse(45,310,17,17);
  ellipse(45,340,17,17);
  textSize(20);
  text("Nothing",60 ,225);
  text("Volume",60 ,255);
  text("Temperature",60 ,285);
  text("Pressure(V)",60 ,315);
  text("Pressure(T)",60 ,345);
  

  
  }
  boolean onConstantButton(){
    return true;
  }
  boolean mouseOnVolB(){
    if(mouseX >= resizeKnobX && mouseX <= resizeKnobX + 60 && mouseY >= resizeKnobY && mouseY <= resizeKnobY + 50){
      
      return true;
     
    }
    return false;
  }
  
  boolean changeResizeX(int num){
    System.out.println(num);
    if(num != 840 && num > 200 && num <900){  
      
    resizeKnobX = num;
    boxWidth = resizeKnobX - boxX;
    return true;
    }
    return false;
  }
  
  //void changeWidth(){
  //  if(mouseX < 900){
  //  boxWidth = mouseX;
  //  System.out.println(boxWidth);
  //  }
  //}
  public void changeVol(){
    
  }



}
