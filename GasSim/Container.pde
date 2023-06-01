public class Container {
  private String[] constantVar;
  private int boxX = 200;//top left corner x-coord of container
  private int boxY = 150;//top left corner y-coord of container
  private  int boxWidth = 600;//width of box
  private  int boxHeight = 450;//height of box

  private  boolean lidStatus;//if lid is on or off
  private  float P;
  private  float V;
  private  int n;
  public boolean constantN;
  public boolean constantV;
  public boolean constantT;
  public boolean constantP;
  private int pumpX;//box to pump in particles top left corner x-coord
  private int pumpY;//box to pump in particles top left corner y-coord
  private int lightN;
  private int mediumN;
  private int heavyN;
  private  final float R = 0.0821;
  private  float T;
  private int resizeKnobX;//x-coord of where box/container ends and the lines and resize box start
  private int resizeKnobY;//y-coord of where box/container ends and the lines and resize box start
  private int Xconstant = 45;//center x-coord of ellipse if one of constant buttons is pressed
  private int Yconstant;//center y-coord of ellipse if one of constant buttons is pressed
  private int pumpBX = 30;//box to pump in particles top left corner x-coord
  private int pumpBY = 450;//box to pump in particles top left corner y-coord
  private int pumpWidth = 150;
  private int pumpHeight = 200;
  private int PUpdateFreq = 100;
  public ArrayList<Particle>particleList = new ArrayList<Particle>();
  public boolean constantButton;//sees if ellipse should be filed if button is pressed
  public color b;
  
  //------------------------------------------------------------------------------------------------------------------------------------------//

  public Container() {
    constantVar = new String[] {"P", "V", "n", "T"};
    lidStatus = true;
    resizeKnobX = boxX + boxWidth ;
    resizeKnobY = boxY + boxHeight/2;
    constantButton = false;
  }
  boolean mouseOnPump() {
  if (mouseX >= pumpX && mouseX <= (pumpX + 50) && mouseY >= pumpY && pmouseY <= (pumpY + 50)) {

    return true;
  }
  return false;
}

  
  void changeConstButt(boolean b){//if mousepressed and its pressing a constant button, turns it true, is used in display to show option was chosen
    constantButton = b;
  }
  public void addSomeParticles(){
    for(int i = 0; i<5; i++){
      particleList.add(new Particle(1));
      lightN++;
    }
  }
  
  public void display() {//displays container
  rect(boxX, boxY, container.boxWidth, container.boxHeight);//displays big container
  fill(250,20,30);
  controln();
  rect(resizeKnobX+ 40, resizeKnobY, 20,50);
  stroke(200);
  fill(b);
  line(resizeKnobX, resizeKnobY, resizeKnobX+40, resizeKnobY);
  line(resizeKnobX, resizeKnobY+50, resizeKnobX+40, resizeKnobY+50);
  fill(125);
  rect(30,175,150,250);//control box
  fill(255,10,23);
  rect(pumpX, pumpY, 50,50);
  fill(255);
  textSize(25);
  text("Hold Constant",31 ,200);
  ellipse(45,220,17,17);
  ellipse(45,250,17,17);
  ellipse(45,280,17,17);
  ellipse(45,310,17,17);

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

  ellipse(45,340,17,17);
  textSize(20);
  text("Nothing",60 ,225);
  text("Volume",60 ,255);
  text("Temperature",60 ,285);
  text("Pressure(V)",60 ,315);
  text("Pressure(T)",60 ,345);
  if(constantButton){
    fill(138, 191, 237);
  //  constantButtons();
    ellipse(Xconstant, Yconstant, 14,14);
  }

  

  
  }
  void constantButtonPressed() {
    if (bconstantButtons()) {
      fill(138, 191, 237);
      //  constantButtons();
      ellipse(Xconstant, Yconstant, 14, 14);
    }
  }

  String constantButtons() {
    if (mouseX >= 36 && mouseX <= 54 ) {
      //System.out.println("nothing");
      if (mouseY >= 213 && mouseY <= 229) {

        Yconstant = 220;
        return "Nothing";
      }
      if (mouseY >= 243 && mouseY <= 259) {
        Yconstant = 250;
        return "Volume";
      }
      if (mouseY >= 273 && mouseY <= 289) {
        Yconstant = 280;
        return "Temperature";
      }
      if (mouseY >= 303 && mouseY <= 319) {
        Yconstant = 310;
        return "Pressure(V)";
      }
      if (mouseY >= 333 && mouseY <= 349) {
        Yconstant = 340;
        return "Pressure(T)";
      }
    }
    return "nothing was clicked";
  }
  boolean bconstantButtons() {
    if (mouseX >= 36 && mouseX <= 54 ) {
      //System.out.println("nothing");
      if (mouseY >= 213 && mouseY <= 229) {

        return true;
      }
      if (mouseY >= 243 && mouseY <= 259) {

        return true;
      }
      if (mouseY >= 273 && mouseY <= 289) {

        return true;
      }
      if (mouseY >= 303 && mouseY <= 319) {

        return true;
      }
      if (mouseY >= 333 && mouseY <= 349) {

        return true;
      }
    }
    return false;

  }

  
  boolean mouseOnVolB(){
    if(mouseX >= resizeKnobX && mouseX <= resizeKnobX + 60 && mouseY >= resizeKnobY && mouseY <= resizeKnobY + 50){
      b = color(138, 191, 237);
      return true;
    }
    b = color(80,2,9);
    return false;
  }

  boolean changeResizeX(int num) {
    System.out.println(num);
    if (num != 840 && num > 200 && num <900) {

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
  public void changeVol() {
  }

  void calcTemperature() {
    float totalKineticEnergy = 0;
    for (Particle p : container.particleList) {
      totalKineticEnergy += 0.5 * p.mass * p.velocity.magSq();
    }
    T = totalKineticEnergy / n;
  }

  void calcPressure(float momentumTotal) {
    float containerSurface = (container.boxWidth + container.boxHeight) *2;
    if (frameCount % PUpdateFreq == 0) {
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
    for (float theta = PI/6; theta > (-7*PI)/6; theta -= PI/6) {
      line(centerX, centerY, centerX + (cos(theta) * r), centerY + (sin(theta) * r));
    }
    noStroke();
    circle(centerX, centerY, r * 1.5);
    float redTheta = PI/6 + (P / -0.001) * PI/96;
    float redX = centerX + (cos(redTheta) * r);
    float redY = centerY + (sin(redTheta) * r);
    stroke(255, 0, 0);
    line(centerX, centerY, redX, redY);
  }
  void controln() {
    n = lightN + mediumN + heavyN;
    fill(125);
    pumpBX = 30;
    pumpBY = 450;
    rect(pumpBX, pumpBY, pumpWidth, pumpHeight);
    textSize(25);
    fill(255);
    text("Particles", pumpBX + 1, pumpBY + 25);
    //particle visuals
    fill(255, 0, 0);
    circle(pumpBX + pumpWidth/10, pumpBY + pumpHeight/5, 14);
    fill(0, 255, 0);
    circle(pumpBX + pumpWidth/9, pumpBY + 38*pumpHeight/80, 20);
    fill(0, 0, 255);
    circle(pumpBX + pumpWidth/8, pumpBY + 3*pumpHeight/4, 26);
    fill(255);
    //light, med, heavy
    textSize(20);
    text("Light", pumpBX + pumpWidth/4, pumpBY + 30.25*pumpHeight/128);
    text("Medium", pumpBX + pumpWidth/4, pumpBY + 66*pumpHeight/128);
    text("Heavy", pumpBX + pumpWidth/4, pumpBY + 101*pumpHeight/128);
    
    //LIGHT
    //decrease buttons
    rect(pumpBX + pumpWidth/20, pumpBY + pumpHeight/3.5, 2*pumpWidth/15, pumpHeight/12);
    rect(pumpBX + pumpWidth/5, pumpBY + pumpHeight/3.5, 2*pumpWidth/12.5, pumpHeight/12);
    fill(100);
    triangle(pumpBX + pumpWidth/15, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/15 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/15 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth/4.65, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/4.65 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/4.65 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth/3.8, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/3.8 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/3.8 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    //increase buttons
    fill(255);
    rect(pumpBX + pumpWidth - pumpWidth/5.5, pumpBY + pumpHeight/3.5, 2*pumpWidth/15, pumpHeight/12);
    rect(pumpBX + pumpWidth - pumpWidth/2.7, pumpBY + pumpHeight/3.5, 2*pumpWidth/12.5, pumpHeight/12);
    fill(100);
    triangle(pumpBX + pumpWidth - pumpWidth/14.5, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/15 + pumpWidth/13), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/15 + pumpWidth/13), pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65), pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65 + pumpWidth/15), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65 + pumpWidth/15), pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/3.8), pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/75 +  pumpWidth/3.8 + pumpWidth/15), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/75 +  pumpWidth/3.8 + pumpWidth/15), pumpBY + pumpHeight/2.85); 
    
    //display count 
    fill(255);
    text(lightN, pumpBX + 2*pumpWidth/5, pumpBY + pumpHeight/2.78);
    
    
    //MEDIUM
    //decrease buttons
    translate(0, pumpHeight/3.5);
    rect(pumpBX + pumpWidth/20, pumpBY + pumpHeight/3.5, 2*pumpWidth/15, pumpHeight/12);
    rect(pumpBX + pumpWidth/5, pumpBY + pumpHeight/3.5, 2*pumpWidth/12.5, pumpHeight/12);
    fill(100);
    triangle(pumpBX + pumpWidth/15, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/15 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/15 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth/4.65, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/4.65 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/4.65 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth/3.8, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/3.8 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/3.8 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    //increase buttons
    fill(255);
    rect(pumpBX + pumpWidth - pumpWidth/5.5, pumpBY + pumpHeight/3.5, 2*pumpWidth/15, pumpHeight/12);
    rect(pumpBX + pumpWidth - pumpWidth/2.7, pumpBY + pumpHeight/3.5, 2*pumpWidth/12.5, pumpHeight/12);
    fill(100);
    triangle(pumpBX + pumpWidth - pumpWidth/14.5, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/15 + pumpWidth/13), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/15 + pumpWidth/13), pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65), pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65 + pumpWidth/15), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65 + pumpWidth/15), pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/3.8), pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/75 +  pumpWidth/3.8 + pumpWidth/15), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/75 +  pumpWidth/3.8 + pumpWidth/15), pumpBY + pumpHeight/2.85); 
    
    //display count 
    fill(255);
    text(mediumN, pumpBX + 2*pumpWidth/5, pumpBY + pumpHeight/2.78);
    
    
    
    
    
    //HEAVY
    //decrease buttons
    translate(0, pumpHeight/3.5);
    rect(pumpBX + pumpWidth/20, pumpBY + pumpHeight/3.5, 2*pumpWidth/15, pumpHeight/12);
    rect(pumpBX + pumpWidth/5, pumpBY + pumpHeight/3.5, 2*pumpWidth/12.5, pumpHeight/12);
    fill(100);
    triangle(pumpBX + pumpWidth/15, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/15 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/15 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth/4.65, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/4.65 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/4.65 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth/3.8, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth/3.8 + pumpWidth/15, pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth/3.8 + pumpWidth/15, pumpBY + pumpHeight/2.85); 
    //increase buttons
    fill(255);
    rect(pumpBX + pumpWidth - pumpWidth/5.5, pumpBY + pumpHeight/3.5, 2*pumpWidth/15, pumpHeight/12);
    rect(pumpBX + pumpWidth - pumpWidth/2.7, pumpBY + pumpHeight/3.5, 2*pumpWidth/12.5, pumpHeight/12);
    fill(100);
    triangle(pumpBX + pumpWidth - pumpWidth/14.5, pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/15 + pumpWidth/13), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/15 + pumpWidth/13), pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65), pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65 + pumpWidth/15), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/4.65 + pumpWidth/15), pumpBY + pumpHeight/2.85); 
    triangle(pumpBX + pumpWidth - (pumpWidth/75 + pumpWidth/3.8), pumpBY + pumpHeight/3.5 + pumpHeight/24,
             pumpBX + pumpWidth - (pumpWidth/75 +  pumpWidth/3.8 + pumpWidth/15), pumpBY + pumpHeight/3.3,  
             pumpBX + pumpWidth - (pumpWidth/75 +  pumpWidth/3.8 + pumpWidth/15), pumpBY + pumpHeight/2.85); 
    
    //display count 
    fill(255);
    text(heavyN, pumpBX + 2*pumpWidth/5, pumpBY + pumpHeight/2.78);
    
    
    
    translate(0, pumpHeight/-1.75);
  }
}
