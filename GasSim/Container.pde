public class Container {
  private final int NOTHING = 0;
  private final int CONST_V = 1;
  private final int CONST_T = 2;
  private final int CONST_P_V = 3;
  private final int CONST_P_T = 4;
  private final int LID_WIDTH = 199;
  private final int LID_HEIGHT = 5;
  private final int LID_OPENING_X = 20;
  private final int LID_OPENING_WIDTH_MAX = 150;
  private final int LID_HANDLE_HEIGHT = 15;
  private final int LID_HANDLE_WIDTH = 15;
  private final float RELIEF_PRESSURE = 0.48; // 800 on the gauge
  private final int HISTORIC_P_MAX = 5;
  private int constantVar = NOTHING;
  private int boxX = 200;//top left corner x-coord of container
  private int boxY = 150;//top left corner y-coord of container
  private  int boxWidth = 600;//width of box
  private  int boxHeight = 450;//height of box
  private int lidOpeningWidth = 0;
  private int lidExplosionTime = -1;
  private  float P;
  private  float V;
  private  int n;
  private float goalP;
  private float historicP[];
  private int historicPCount;
  private boolean historicPIsUnstable;
  private int pumpX;//box to pump in particles top left corner x-coord
  private int pumpY;//box to pump in particles top left corner y-coord
  private int lightN;
  private int mediumN;
  private int heavyN;
  private float R;
  private float T = 300;
  private int resizeKnobX;//x-coord of where box/container ends and the lines and resize box start
  private int resizeKnobY;//y-coord of where box/container ends and the lines and resize box start
  private int xonstant = 45;//center x-coord of ellipse if one of constant buttons is pressed
  private int pumpBX = 30;//box to pump in particles top left corner x-coord
  private int pumpBY = 450;//box to pump in particles top left corner y-coord
  private int pumpWidth = 150;
  private int pumpHeight = 200;
  private int thermX = 145;
  private int thermY = 100;
  private int baroX = 65;
  private int baroY = 65;
  private int bucketX = 300;
  private int bucketY = 650;
  private int bucketWidth = 115;
  private int bucketHeight = 85;
  private float tempSliderY = bucketY + 0.425 * bucketHeight;
  private final float sliderMid = bucketY + 0.425 * bucketHeight;
  private int PUpdateFreq = 150;
  public ArrayList<Particle>particleList = new ArrayList<Particle>();
  public boolean constantButton;//sees if ellipse should be filed if button is pressed
  PImage fire;
  PImage ice;
  private String popUp = null;


  //------------------------------------------------------------------------------------------------------------------------------------------//

  public Container() {
    resizeKnobX = boxX + boxWidth ;
    resizeKnobY = boxY + boxHeight/2;
    constantButton = false;
    constantVar = NOTHING;
    historicP = new float[HISTORIC_P_MAX];
    historicPCount = 0;
    historicPIsUnstable = true;
  }
  boolean mouseOnPump() {
    if (mouseX >= pumpX && mouseX <= (pumpX + 50) && mouseY >= pumpY && pmouseY <= (pumpY + 50)) {

      return true;
    }
    return false;
  }



  void changeConstButt(boolean b) {//if mousepressed and its pressing a constant button, turns it true, is used in display to show option was chosen
    constantButton = b;
  }

  public boolean mouseOnLid() {//if mouse is on lid button
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 1 && mouseY <= 51) {
      return true;
    }
    return false;
  }




  public void display() {//displays container

    fill(255);

    rect(boxX, boxY, boxWidth, boxHeight);//displays big container
    fill(250, 20, 30);
    controln();
    controlTemp();

    stroke(200);
    if (constantVar != CONST_V && constantVar != CONST_P_V) {
      rect(resizeKnobX+ 40, resizeKnobY, 20, 50);

      fill(138, 191, 237);
      line(resizeKnobX, resizeKnobY, resizeKnobX+40, resizeKnobY);
      line(resizeKnobX, resizeKnobY+50, resizeKnobX+40, resizeKnobY+50);
    }

    textSize(20);
    fill(255);
    text("Volume: " + round(V), 35, 165);
    textSize(50);

    fill(125);
    rect(30, 175, 150, 250);//control box
    fill(255);
    textSize(25);
    text("Hold Constant", 31, 200);
    ellipse(45, 220, 17, 17);
    ellipse(45, 250, 17, 17);
    ellipse(45, 280, 17, 17);
    ellipse(45, 310, 17, 17);
    fill(255);
    text("Hold Constant", 31, 200);
    fill(255);
    ellipse(45, 220, 17, 17);
    fill(255);
    ellipse(45, 250, 17, 17);
    fill(255);
    ellipse(45, 280, 17, 17);
    fill(255);
    ellipse(45, 310, 17, 17);
    fill(255);

    ellipse(45, 340, 17, 17);
    textSize(20);
    text("Nothing", 60, 225);
    text("Volume", 60, 255);
    text("Temperature", 60, 285);
    if (historicPIsUnstable && constantVar != CONST_P_V &&
      constantVar != CONST_P_T) {
      fill(200);
    }
    text("Pressure(V)", 60, 315);
    text("Pressure(T)", 60, 345);

    fill(138, 191, 237);
    ellipse(xonstant, 220 + constantVar * 30,14, 14);


    if (constantVar != CONST_T) {
      drawLid();
    }

    color pauseC;
    if (!paused) {
      pauseC = color(0, 200, 0);
      if (dist(mouseX, mouseY, 565, 685) < 25) {
        pauseC = color(100, 200, 100);
      }
      fill(pauseC);
      circle(565, 685, 50);
      fill(255);
      rect(556, 675, 5, 20);
      rect(569, 675, 5, 20);
    } else {
      pauseC = color(200, 0, 0);
      if (dist(mouseX, mouseY, 565, 685) < 25) {
        pauseC = color(200, 100, 100);
      }
      fill(pauseC);
      circle(565, 685, 50);
      fill(255);
      triangle(555, 670, 555, 700, 580, 685);
    }

    color ffC;
    if (!paused) {
      ffC = color(150);
    } else {
      ffC = color(0, 200, 0);
      if (dist(mouseX, mouseY, 625, 685) < 17.5) {
        ffC = color(100, 200, 100);
      }
    }
    fill(ffC);
    circle(625, 685, 35);
    fill(255);
    rect(619, 677.5, 3, 15);
    triangle(625, 677.5, 634, 685, 625, 692.5);

    color resetC = color(255, 165, 0);
    if (dist(mouseX, mouseY, 920, 685) < 30) {
      resetC = color(255, 200, 100);
    }
    fill(resetC);
    circle(920, 685, 60);
    fill(255);
    circle(920, 685, 45);
    fill(resetC);
    circle(920, 685, 30);
    triangle(925, 660, 920, 685, 945, 675);
    fill(255);
    triangle(929, 683, 932, 671, 945, 675);
  }

  boolean bconstantButtons() {
    if (popUp == null) {
      if (mouseX >= 36 && mouseX <= 54 ) {
        if (mouseY >= 213 && mouseY <= 229) {
          constantVar = NOTHING;
          return true;
        }
        if (mouseY >= 243 && mouseY <= 259) {
          constantVar = CONST_V;
          return true;
        }
        if (mouseY >= 273 && mouseY <= 289) {
          constantVar = CONST_T;
          return true;
        }
        if (!historicPIsUnstable && mouseY >= 303 && mouseY <= 319) {
          constantVar = CONST_P_V;
          return true;
        }
        if (!historicPIsUnstable && mouseY >= 333 && mouseY <= 349) {
          constantVar = CONST_P_T;
          return true;
        }
      }
    }
    return false;
  }


  boolean mouseOnVolB() {
    if (constantVar != CONST_V && constantVar != CONST_P_V && mouseX >= resizeKnobX && mouseX <= resizeKnobX + 60 && mouseY >= resizeKnobY && mouseY <= resizeKnobY + 50) {
      return true;
    }
    return false;
  }

  boolean changeResizeX(int num) {
    int resizeKnobXNew = resizeKnobX + num;
    if (resizeKnobXNew < boxX + 200) {
      resizeKnobXNew = boxX + 200;
    } else if (resizeKnobXNew > 900) {
      resizeKnobXNew = 900;
    }

    if (resizeKnobXNew != resizeKnobX) {
      changeVol(resizeKnobXNew);
      resizeKnobX = resizeKnobXNew;
      boxWidth = resizeKnobX - boxX;
      return true;
    }
    return false;
  }

  public void changeVol(int resizeKnobXNew) {
    if (resizeKnobXNew != resizeKnobX) {
      float f = (float) (resizeKnobXNew - boxX)/(resizeKnobX - boxX);
      for (Particle p : particleList) {
        p.position.x = boxX + (p.position.x-boxX)*f;
      }
    }
    historicPCount = 0;
  }

  void calcTemperature() {
    float totalKineticEnergy = 0;
    for (Particle p : particleList) {
      totalKineticEnergy += 0.5 * p.mass * p.velocity.magSq();
    }
    if (totalKineticEnergy > 0) {
      T = totalKineticEnergy / n;
    } else {
      T = 0;
    }
  }

  void calcPressure(float momentumTotal) {
    float containerSurface = (boxWidth + boxHeight) * 2 - lidOpeningWidth;
    P = momentumTotal / (containerSurface * PUpdateFreq);
  }

  //boxWidth*BoxHeight/P
  void calcVolume () {
    float particleVolume = 0;
    for (Particle p : particleList) {
      particleVolume += p.radius * p.radius* PI;
    }
    V = boxWidth * boxHeight - particleVolume;
  }



  //display pressure
  void barometer() {
    stroke(1);
    fill(255);
    int r = 50;
    circle(baroX, baroY, r * 2);
    for (float theta = PI/6; theta > (-7*PI)/6; theta -= PI/6) {
      line(baroX, baroY, baroX + (cos(theta) * r), baroY + (sin(theta) * r));
    }
    noStroke();
    circle(baroX, baroY, r * 1.5);
    float pMax = RELIEF_PRESSURE;
    float redTheta = -7*PI/6 + (P / pMax) * 4*PI/3;
    float redX = baroX + (cos(redTheta) * r);
    float redY = baroY + (sin(redTheta) * r);
    stroke(255, 0, 0);
    line(baroX, baroY, redX, redY);
    stroke(0);
    rect(baroX - 38, baroY + 58, 82, 20, 5);
    fill(0);
    text(nf(P, 0, 3)+ "ATM", baroX - 35, baroY + 75 );
  }

  void setGoalValue() {
    if (constantVar == CONST_P_V || constantVar == CONST_P_T) {
      if (historicPIsUnstable) {
        popUp = "Pressure is not stable. Can't select constant pressure. at this point of time";
        constantVar = NOTHING;
      }

      goalP = historicPAverage();
    }
  }

  void reachGoalValue() {
    if (constantVar == CONST_P_T || constantVar == CONST_P_V) {
      if (historicPCount >= HISTORIC_P_MAX) {
        float averageP = historicPAverage();
        if (constantVar == CONST_P_T) {
          float f = (float) Math.sqrt(goalP/P);
          for (Particle p : particleList) {
            p.velocity.mult(f);
          }
          historicPCount = 0;
        } else {
          float wF = P/goalP*boxWidth;
          // reach the desired width gradually to avoid instability
          int w = round((2*wF + boxWidth)/3);
          if (w > 700) {
            popUp = "Pressure cannot be held constant. Volume would be too large";
            constantVar = NOTHING;
            w = 700;
          } else if (w < 200) {
            popUp = "Pressure cannot be held constant. Volume would be too small";
            constantVar = NOTHING;
            w = 200;
          }
          if (w != boxWidth) {
            changeResizeX(w - boxWidth);
          }
        }
      }
    }
  }

  
  void queueHistoricP() {
    historicP[historicPCount%HISTORIC_P_MAX] = P;
    historicPCount++;
    historicPIsUnstable = historicPUnstable();
  }
  
  boolean historicPUnstable() {
    if (historicPCount < HISTORIC_P_MAX) {
      return true;
    }

    float pMax = historicP[0];
    float pMin  = historicP[0];
    float ave = historicP[0];
    for (int i=1; i<HISTORIC_P_MAX; i++) {
      if (historicP[i] > pMax) {
        pMax = historicP[i];
      } else if (historicP[i] < pMin) {
        pMin = historicP[i];
      }

      ave += historicP[i];
    }

    ave = ave/HISTORIC_P_MAX;
    if (pMax - pMin > 0.3 * ave) {
      return true;
    }

    return false;
  }

  // assumes historicPCount >= HISTORIC_P_MAX
  float historicPAverage() {
    float ave = 0;
    for (int i=0; i<HISTORIC_P_MAX; i++) {
      ave += historicP[i];
    }

    return ave/HISTORIC_P_MAX;
  }

  void resetConstantVar() {
    constantVar = NOTHING;
  }

  void setPopUp(String str) {
    popUp = str;
  }

  boolean mouseOnLidB() {
    return (constantVar != CONST_T && mouseX >= boxX + LID_OPENING_X+lidOpeningWidth &&
      mouseX <= boxX + LID_OPENING_X+lidOpeningWidth + LID_HANDLE_WIDTH +1 &&
      mouseY >= boxY-LID_HEIGHT-LID_HANDLE_HEIGHT && mouseY <= boxY+1);
  }
  //rect(bucketX + 0.5 * bucketWidth, tempSliderY, bucketWidth * 0.325, bucketHeight * 0.25, 5);
  boolean mouseOnTempSlider() {
    return (constantVar != CONST_T && constantVar != CONST_P_T &&
      mouseX >= bucketX + 0.5 * bucketWidth &&
      mouseX <= bucketX + 0.825 * bucketWidth &&
      mouseY >= tempSliderY && mouseY <= tempSliderY + bucketHeight * 0.25);
  }

  void openLid() {
    if (lidOpeningWidth != LID_OPENING_WIDTH_MAX) {
      lidOpeningWidth = LID_OPENING_WIDTH_MAX;
      lidExplosionTime = frameCount;
    }
  }

  boolean isLidAnimationTime() {
    return (lidExplosionTime > 0 && frameCount - lidExplosionTime < 100);
  }

  void drawLid() {
    if (isLidAnimationTime()) {
      pushMatrix();
      int dt = frameCount-lidExplosionTime;
      translate(dt*(-0.1), dt*(-0.8));
      rotate(dt*(-0.004));
    }

    noStroke();
    fill(128);
    rect(1+boxX, 1+boxY-LID_HEIGHT, LID_OPENING_X, LID_HEIGHT);
    rect(1+boxX+LID_OPENING_X+lidOpeningWidth, 1+boxY-LID_HEIGHT,
      LID_WIDTH-(LID_OPENING_X+lidOpeningWidth), LID_HEIGHT);
    fill(138, 191, 237);
    rect(1+boxX+LID_OPENING_X+lidOpeningWidth,
      1+boxY-LID_HEIGHT-LID_HANDLE_HEIGHT,
      LID_HANDLE_WIDTH, LID_HANDLE_HEIGHT);
    fill(255);
    rect(1+boxX+LID_OPENING_X, 1+boxY-LID_HEIGHT, lidOpeningWidth, LID_HEIGHT);


    if (isLidAnimationTime()) {
      popMatrix();
    }
  }

  boolean changeLidOpeningWidth(int num) {
    int lidOpeningWidthNew = lidOpeningWidth + num;
    if (lidOpeningWidthNew < 0) {
      lidOpeningWidthNew = 0;
    } else if (lidOpeningWidthNew > LID_OPENING_WIDTH_MAX) {
      lidOpeningWidthNew = LID_OPENING_WIDTH_MAX;
    }

    if (lidOpeningWidthNew != lidOpeningWidth) {
      lidOpeningWidth = lidOpeningWidthNew;
      return true;
    }

    return false;
  }


  //control particle
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


  //temperature display

  void thermometer() {
    fill(255);
    stroke(0);
    beginShape();
    vertex(thermX-5.8, thermY-73.8);
    bezierVertex(thermX-2.9, thermY-76.7, thermX+2.9, thermY-76.7, thermX+5.8, thermY-73.8);
    vertex(thermX +5.83, thermY-13.8);
    bezierVertex(thermX +10.7, thermY -12.5, thermX+15.7, thermY-5, thermX+15, thermY);
    bezierVertex(thermX +16, thermY +7.2, thermX+7.2, thermY+16, thermX, thermY +15);
    bezierVertex(thermX -7.2, thermY +16, thermX-16, thermY+7.2, thermX-15, thermY);
    bezierVertex(thermX -15.7, thermY -5, thermX-10.7, thermY-12.5, thermX-5.8, thermY-13.8);
    endShape(CLOSE);

    fill(255, 0, 0);
    circle(thermX, thermY, 18);
    float incrementX;
    float incrementY = 2.7;
    float displayedT = T;
    noStroke();

    float maxT = 1500;
    if (displayedT<0) {
      displayedT = 0;
    } else if (displayedT>maxT) {
      displayedT = maxT;
    }
    rect(thermX-2.5, thermY-17.1-54*displayedT/maxT, 4.9, 17.1+54*displayedT/maxT);
    stroke(0);
    for (int i=0; i<20; i++) {
      if (i%5==0) {
        incrementX = 5;
      } else {
        incrementX = 3;
      }
      line(thermX-5.83, thermY-73.8+(i+1)*incrementY, thermX-5.8+incrementX, thermY-73.8+(i+1)*incrementY);
    }

    fill(255);
    rect(thermX - 30, thermY + 23, 65, 20, 5);
    textSize(20);
    fill(0);
    text(round(T)+ "K", thermX - 20, thermY + 40);
  }




  void controlTemp() {
    fill(150);
    stroke(0);
    ellipse(bucketX + 0.5* bucketWidth, bucketY + bucketHeight, bucketWidth * 0.7, 10);
    if (tempSliderY < sliderMid) {
      fire(bucketX + 0.5 * bucketWidth, tempSliderY);
    }
    if (tempSliderY > sliderMid) {
      ice(bucketX + 0.5 * bucketWidth, (sliderMid) + (sliderMid-tempSliderY) - 40, .7);
    }
    fill(150);
    noStroke();
    beginShape();
    vertex(bucketX, bucketY);
    vertex(bucketX + bucketWidth, bucketY);
    vertex(bucketX + 0.85 * bucketWidth, bucketY + bucketHeight);
    vertex(bucketX + 0.15 * bucketWidth, bucketY + bucketHeight);
    endShape();
    stroke(0);
    ellipse(bucketX + 0.5* bucketWidth, bucketY, bucketWidth, 10);
    if (constantVar != CONST_T && constantVar != CONST_P_T) {
      noFill();
      color c1 = color(255, 0, 0);
      color c2 = color(0, 0, 255);
      for (float i = bucketY + 0.25 * bucketHeight; i <= bucketY + 0.85 * bucketHeight; i++) {
        float inter = map(i, bucketY + 0.15 * bucketHeight, bucketY + 0.85 * bucketHeight, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(bucketX + 0.6 * bucketWidth, i, bucketX + 0.7 * bucketWidth, i);
      }
      stroke(0);
      rect(bucketX + 0.6 * bucketWidth, bucketY + 0.25 * bucketHeight, 0.1 * bucketWidth, 0.6 * bucketHeight);
      line(bucketX + 0.5 * bucketWidth, bucketY + 0.25 * bucketHeight, bucketX + 0.6 * bucketWidth, bucketY + 0.25 * bucketHeight);
      line(bucketX + 0.5 * bucketWidth, bucketY + 0.85 * bucketHeight, bucketX + 0.6 * bucketWidth, bucketY + 0.85 * bucketHeight);
      textSize(12.5);
      fill(0);
      text("Heat", bucketX + 0.25 * bucketWidth, bucketY + 0.3 * bucketHeight);
      text("Cool", bucketX + 0.25 * bucketWidth, bucketY + 0.9 * bucketHeight);
      fill(173, 216, 230);
      rect(bucketX + 0.5 * bucketWidth, tempSliderY, bucketWidth * 0.325, bucketHeight * 0.25, 5);
      line(bucketX + 0.5 * bucketWidth, tempSliderY + bucketHeight * 0.125, bucketX + 0.825 * bucketWidth, tempSliderY + bucketHeight * 0.125);
    }
    if (!isDraggingTempSlider) {
      tempSliderY = sliderMid;
    } else {
      //slower when closer to mid, faster when closer to extremes
      int changeSpeed = int(10000/((abs(tempSliderY - sliderMid) * 100)));
      if (tempSliderY < sliderMid ) {
        if (frameCount % changeSpeed == 0) {
          float factor = (float)Math.sqrt((T+1)/T);
          for (Particle p : particleList) {
            p.velocity.mult(factor);
            historicPCount = 0;
          }
        }
      }

      if (tempSliderY > sliderMid) {
        if (frameCount % changeSpeed == 0 && T > 1) {
          float factor = (float)Math.sqrt((T-1)/T);
          for (Particle p : particleList) {
            p.velocity.mult(factor);
            historicPCount = 0;
          }
        }
      }
    }
  }

  void fire(float x, float y) {
    pushMatrix();
    translate(x, y);
    scale(0.5, 0.5);
    fill(255, 0, 0);
    fillFireOutline();
    scale(-0.5, 0.5);
    fill(255, 240, 0);
    fillFireOutline();
    popMatrix();
  }

  void fillFireOutline() {
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(102.1, -18.1, 79.4, -115.1, 49.3, -139.5);
    bezierVertex(56.1, -95.8, 17.0, -88.4, 21.5, -129.3);
    bezierVertex(26.1, -154.8, 12.5, -184.8, -16.4, -212.0);
    bezierVertex(-7.4, -171.8, -65.2, -129.7, -73.7, -103.7);
    bezierVertex(-102.0, -24.9, -28.3, 4.0, 0, 0);
    endShape(CLOSE);
  }

  void ice(float x, float y, float f) {
    pushMatrix();

    translate(x, y);
    scale(f);

    stroke(0.5);
    fill(173, 216, 230);
    beginShape();
    vertex(-56, 30.3);
    bezierVertex(-89.1, 37.8*f, -44.6, 68, -21.9, 45.4);
    bezierVertex(-3, 62.7, 33.5, 59.7, 40.1, 34.7);
    bezierVertex(74.8, 29.5, 74, 6, 50.5, 1.7);
    vertex(27, 30.3);
    endShape(CLOSE);
    fill(173, 216, 235);
    beginShape();
    vertex(50.5, +1.7);
    vertex(50.5, -61.2);
    vertex(27, -16.6);
    vertex(27, 30.3);
    endShape(CLOSE);
    fill(210);
    beginShape();
    vertex(27, -16.6);
    vertex(50.5, -61.2);
    vertex(-32.5, -61.2);
    vertex(-56, -16.6);
    endShape(CLOSE);
    fill(255);
    beginShape();
    vertex(-56, -16.6);
    vertex(-56, 30.3);
    vertex(27, 30.3);
    vertex(27, -16.6);
    endShape(CLOSE);
    popMatrix();
  }
}
