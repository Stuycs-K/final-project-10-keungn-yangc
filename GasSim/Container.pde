public class Container{
  private String[] constantVar;
  private int boxX;//top left corner x-coord of container
  private int boxY;//top left corner y-coord of container
  private  int boxWidth;//width of box
  private  int boxHeight;//height of box
  private  int wallCollisions;
  private  boolean lidStatus;//if lid is on or off
  private  float P;
  private  float V;
  private  int n;
<<<<<<< HEAD
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
=======
  private  final float R = 0.0821;
  private  float T;
  private int resizeKnobX;//x-coord of where box/container ends and the lines and resize box start
  private int resizeKnobY;//y-coord of where box/container ends and the lines and resize box start
  private int Xconstant = 45;//center x-coord of ellipse if one of constant buttons is pressed
  private int Yconstant;//center y-coord of ellipse if one of constant buttons is pressed
  private int pumpBX;//box to pump in particles top left corner x-coord
  private int pumpBY;//box to pump in particles top left corner y-coord
  private int PUpdateFreq = 100;
  public ArrayList<Particle>particleList;
  public boolean constantButton;//sees if ellipse should be filed if button is pressed
  
  
  //------------------------------------------------------------------------------------------------------------------------------------------//
>>>>>>> c9813f29a9076edbc9c5944a22b1cd20ed6f7c1f
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
<<<<<<< HEAD
    
  }
  public void addSomeParticles(){

    for(int i = 0; i<3; i++){
      particleList.add(new Particle(220 + random(5, 15),200+ random(5, 15), 1, 1, 3));


=======
    constantButton = false;
  }
  
  void changeConstButt(boolean b){
    constantButton = b;
  }
  public void addSomeParticles(){
    for(int i = 0; i<3; i++){
      particleList.add(new Particle(220 + random(5, 15),200+ random(5, 15), 1, 1, 3));
>>>>>>> c9813f29a9076edbc9c5944a22b1cd20ed6f7c1f
    }
  }
  public ArrayList getArrayL(){
    return particleList;
  }
  
  public void display() {
  rect(boxX, boxY, container.boxWidth, container.boxHeight);
  rect(pumpBX, pumpBY, 80,70);
  fill(250,20,30);
  controln();
  rect(resizeKnobX+ 40, resizeKnobY, 20,50);
  stroke(200);
  line(resizeKnobX, resizeKnobY, resizeKnobX+40, resizeKnobY);
  line(resizeKnobX, resizeKnobY+50, resizeKnobX+40, resizeKnobY+50);
  fill(125);
  rect(30,175,150,250);//control box
<<<<<<< HEAD
  fill(255);
  textSize(25);
  text("Hold Constant",31 ,200);
  ellipse(45,220,17,17);
  ellipse(45,250,17,17);
  ellipse(45,280,17,17);
  ellipse(45,310,17,17);
=======
  textSize(25);
  fill(255);
  text("Hold Constant",31 ,200);
  fill(255);
  ellipse(45,220,17,17);
  fill(255);
  ellipse(45,250,17,17);
  fill(255);
  ellipse(45,280,17,17);
  fill(255);
  ellipse(45,310,17,17);
  fill(255);
>>>>>>> c9813f29a9076edbc9c5944a22b1cd20ed6f7c1f
  ellipse(45,340,17,17);
  textSize(20);
  text("Nothing",60 ,225);
  text("Volume",60 ,255);
  text("Temperature",60 ,285);
  text("Pressure(V)",60 ,315);
  text("Pressure(T)",60 ,345);
<<<<<<< HEAD
  

  
  }
  boolean onConstantButton(){
    return true;
=======
  if(constantButton){
    fill(138, 191, 237);
  //  constantButtons();
    ellipse(Xconstant, Yconstant, 14,14);
  }

  
  }
  void constantButtonPressed(){
    if(bconstantButtons()){
    fill(138, 191, 237);
  //  constantButtons();
    ellipse(Xconstant, Yconstant, 14,14);
  }
  }
  
  String constantButtons(){
    if(mouseX >= 36 && mouseX <= 54 ){
      //System.out.println("nothing");
      if(mouseY >= 213 && mouseY <= 229){
    
       Yconstant = 220;
      return "Nothing";
      }
      if(mouseY >= 243 && mouseY <= 259){
          Yconstant = 250;
      return "Volume";
      }
      if(mouseY >= 273 && mouseY <= 289){
          Yconstant = 280;
      return "Temperature";
      }
      if(mouseY >= 303 && mouseY <= 319){
       Yconstant = 310;
      return "Pressure(V)";
      }
      if(mouseY >= 333 && mouseY <= 349){
       Yconstant = 340;
      return "Pressure(T)";
      }
     
     
     
    }
    return "nothing was clicked";
  }
boolean bconstantButtons(){
    if(mouseX >= 36 && mouseX <= 54 ){
      //System.out.println("nothing");
      if(mouseY >= 213 && mouseY <= 229){
       
      return true;
      }
      if(mouseY >= 243 && mouseY <= 259){
       
      return true;
      }
      if(mouseY >= 273 && mouseY <= 289){
       
      return true;
      }
      if(mouseY >= 303 && mouseY <= 319){
       
      return true;
      }
      if(mouseY >= 333 && mouseY <= 349){
       
      return true;
      }
     
     
     
    }
    return false;
>>>>>>> c9813f29a9076edbc9c5944a22b1cd20ed6f7c1f
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
  
  //i guess this handles both temp and moles (n) .. it feels out of place
  void calcTemperature() {
    float totalKineticEnergy = 0;
    for(Particle p: pL) {
      totalKineticEnergy += 0.5 * p.mass * p.velocity.magSq();
    }
    n = pL.size();
    T = totalKineticEnergy / n;
  }
  
  void calcPressure(float momentumTotal) {
    float containerSurface = (container.boxWidth + container.boxHeight) *2;
    if(frameCount % PUpdateFreq == 0) {
    P = momentumTotal / (containerSurface * PUpdateFreq);
    }
    
}

void calcVolume () {
  V = container.boxWidth * container.boxHeight;
}

//display pressure
void barometer() {
  fill(255);
  int centerX = boxX + 100;
  int centerY = boxY - 85;
  int r = 50;
  circle(centerX, centerY, r * 2);
  for(float theta = PI/6; theta > (-7*PI)/6; theta -= PI/6) {
    line(centerX, centerY, centerX + (cos(theta) * r), centerY + (sin(theta) * r));
  }
  noStroke();
  circle(centerX, centerY, r * 1.5);
  float redTheta = PI/6 + (P / -0.001) * PI/36;
  float redX = centerX + (cos(redTheta) * r);
  float redY = centerY + (sin(redTheta) * r);
  stroke(255, 0, 0);
  line(centerX, centerY, redX, redY);
}

void controln() {
  fill(125);
  pumpBX = 30;
  pumpBY = 450;
  int pumpWidth = 150;
  int pumpHeight = 200;
  rect(pumpBX, pumpBY, pumpWidth, pumpHeight);
}

}
