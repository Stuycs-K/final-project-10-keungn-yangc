Container container = new Container();

private int mouseXLast;
private boolean isDraggingVolB = false;
private boolean isDraggingLidB = false;
private boolean isDraggingTempSlider = false;
float totMomentum;

private final int REMOVE_LIGHT_LITTLE = 1;
private final int REMOVE_LIGHT_LOT = 2;
private final int ADD_LIGHT_LOT = 3;
private final int ADD_LIGHT_LITTLE = 4;


private final int REMOVE_MEDIUM_LITTLE = 5;
private final int REMOVE_MEDIUM_LOT = 6;
private final int ADD_MEDIUM_LOT = 7;
private final int ADD_MEDIUM_LITTLE = 8;


private final int REMOVE_HEAVY_LITTLE = 9;
private final int REMOVE_HEAVY_LOT = 10;
private final int ADD_HEAVY_LOT = 11;
private final int ADD_HEAVY_LITTLE = 12;

private boolean paused = false;

boolean mouseOnPump() {
  return pmouseX >= 100 && pmouseX <= 180 && pmouseY >= 450 && pmouseY <= 520;
}

int addRemove() {
  if (pmouseX > container.pumpBX + container.pumpWidth/20 &&
    pmouseX < container.pumpBX + container.pumpWidth/20 + 2*container.pumpWidth/15 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12) {
    return REMOVE_LIGHT_LITTLE;
  }
  if (pmouseX > container.pumpBX + container.pumpWidth/5 &&
    pmouseX < container.pumpBX + container.pumpWidth/5 + 2*container.pumpWidth/12.5 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12) {
    return REMOVE_LIGHT_LOT;
  }

  if (pmouseX > container.pumpBX + container.pumpWidth - container.pumpWidth/2.7 &&
    pmouseX < container.pumpBX + container.pumpWidth - container.pumpWidth/2.7 + 2*container.pumpWidth/12.5 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12) {
    return ADD_LIGHT_LOT;
  }

  if (pmouseX > container.pumpBX + container.pumpWidth - container.pumpWidth/5.5 &&
    pmouseX < container.pumpBX + container.pumpWidth - container.pumpWidth/5.5 + 2*container.pumpWidth/15 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12) {
    return ADD_LIGHT_LITTLE;
  }






  if (pmouseX > container.pumpBX + container.pumpWidth/20 &&
    pmouseX < container.pumpBX + container.pumpWidth/20 + 2*container.pumpWidth/15 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + container.pumpHeight/3.5) {
    return REMOVE_MEDIUM_LITTLE;
  }
  if (pmouseX > container.pumpBX + container.pumpWidth/5 &&
    pmouseX < container.pumpBX + container.pumpWidth/5 + 2*container.pumpWidth/12.5 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + container.pumpHeight/3.5) {
    return REMOVE_MEDIUM_LOT;
  }

  if (pmouseX > container.pumpBX + container.pumpWidth - container.pumpWidth/2.7 &&
    pmouseX < container.pumpBX + container.pumpWidth - container.pumpWidth/2.7 + 2*container.pumpWidth/12.5 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + container.pumpHeight/3.5) {
    return ADD_MEDIUM_LOT;
  }

  if (pmouseX > container.pumpBX + container.pumpWidth - container.pumpWidth/5.5 &&
    pmouseX < container.pumpBX + container.pumpWidth - container.pumpWidth/5.5 + 2*container.pumpWidth/15 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + container.pumpHeight/3.5) {
    return ADD_MEDIUM_LITTLE;
  }




  if (pmouseX > container.pumpBX + container.pumpWidth/20 &&
    pmouseX < container.pumpBX + container.pumpWidth/20 + 2*container.pumpWidth/15 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + 2*container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + 2*container.pumpHeight/3.5) {
    return REMOVE_HEAVY_LITTLE;
  }
  if (pmouseX > container.pumpBX + container.pumpWidth/5 &&
    pmouseX < container.pumpBX + container.pumpWidth/5 + 2*container.pumpWidth/12.5 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + 2*container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + 2*container.pumpHeight/3.5) {
    return REMOVE_HEAVY_LOT;
  }

  if (pmouseX > container.pumpBX + container.pumpWidth - container.pumpWidth/2.7 &&
    pmouseX < container.pumpBX + container.pumpWidth - container.pumpWidth/2.7 + 2*container.pumpWidth/12.5 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + 2*container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + 2*container.pumpHeight/3.5) {
    return ADD_HEAVY_LOT;
  }

  if (pmouseX > container.pumpBX + container.pumpWidth - container.pumpWidth/5.5 &&
    pmouseX < container.pumpBX + container.pumpWidth - container.pumpWidth/5.5 + 2*container.pumpWidth/15 &&
    pmouseY > container.pumpBY + container.pumpHeight/3.5 + 2*container.pumpHeight/3.5 &&
    pmouseY < container.pumpBY + container.pumpHeight/3.5 + container.pumpHeight/12 + 2*container.pumpHeight/3.5) {
    return ADD_HEAVY_LITTLE;
  }


  return 0;
}



void mouseClicked() {
  System.out.println(mouseX + " " + mouseY);
  int click;
  if (!paused) {
    click = addRemove();
  } else {
    click =0;
  }
  if (click == REMOVE_LIGHT_LITTLE && container.lightN > 0) {
    for (int i = 0; i < container.particleList.size(); i++) {
      if (container.particleList.get(i).period == 1) {
        container.particleList.remove(container.particleList.get(i));
        break;
      }
    }
    container.lightN--;
  }
  if (click == REMOVE_LIGHT_LOT) {
    for (int i = 0; i < 10; i++) {
      if (container.lightN > 0) {

        for (int j = 0; j < container.particleList.size(); j++) {
          if (container.particleList.get(j).period == 1) {
            container.particleList.remove(container.particleList.get(j));
            break;
          }
        }
        container.lightN--;
      }
    }
  }
  if (click == ADD_LIGHT_LOT) {
    for (int i = 0; i < 10; i++) {
      if (container.lightN < 100) {
        if (container.n == 0) {
          container.particleList.add(new Particle(1));
          container.lightN++;
        } else {
          container.particleList.add(new Particle(1, container.T));
          container.lightN++;
        }
      }
    }
  }
  if (click == ADD_LIGHT_LITTLE && container.lightN < 100) {
    if (container.n == 0) {
      container.particleList.add(new Particle(1));
      container.lightN++;
    } else {
      container.particleList.add(new Particle(1, container.T));
      container.lightN++;
    }
  }


  if (click == REMOVE_MEDIUM_LITTLE && container.mediumN > 0) {
    for (int i = 0; i < container.particleList.size(); i++) {
      if (container.particleList.get(i).period == 2) {
        container.particleList.remove(container.particleList.get(i));
        break;
      }
    }
    container.mediumN--;
  }
  if (click == REMOVE_MEDIUM_LOT) {
    for (int i = 0; i < 10; i++) {
      if (container.mediumN > 0) {
        for (int j = 0; j < container.particleList.size(); j++) {
          if (container.particleList.get(j).period == 2) {
            container.particleList.remove(container.particleList.get(j));
            break;
          }
        }
        container.mediumN--;
      }
    }
  }
  if (click == ADD_MEDIUM_LOT) {
    for (int i = 0; i < 10; i++) {
      if (container.mediumN < 100) {
        if (container.n == 0) {
          container.particleList.add(new Particle(2));
          container.mediumN++;
        } else {
          container.particleList.add(new Particle(2, container.T));
          container.mediumN++;
        }
      }
    }
  }
  if (click == ADD_MEDIUM_LITTLE && container.mediumN < 100) {
    if (container.n == 0) {
      container.particleList.add(new Particle(2));
      container.mediumN++;
    } else {
      container.particleList.add(new Particle(2, container.T));
      container.mediumN++;
    }
  }



  if (click == REMOVE_HEAVY_LITTLE && container.heavyN > 0) {
    for (int i = 0; i < container.particleList.size(); i++) {
      if (container.particleList.get(i).period == 3) {
        container.particleList.remove(container.particleList.get(i));
        break;
      }
    }
    container.heavyN--;
  }
  if (click == REMOVE_HEAVY_LOT) {
    for (int i = 0; i < 10; i++) {
      if (container.heavyN > 0) {
        for (int j = 0; j < container.particleList.size(); j++) {
          if (container.particleList.get(j).period == 3) {
            container.particleList.remove(container.particleList.get(j));
            break;
          }
        }
        container.heavyN--;
      }
    }
  }
  if (click == ADD_HEAVY_LOT) {
    for (int i = 0; i < 10; i++) {
      if (container.heavyN < 100) {
        if (container.n == 0) {
          container.particleList.add(new Particle(3));
          container.heavyN++;
        } else {
          container.particleList.add(new Particle(3, container.T));
          container.heavyN++;
        }
      }
    }
  }
  if (click == ADD_HEAVY_LITTLE && container.heavyN < 100) {
    if (container.n == 0) {
      container.particleList.add(new Particle(3));
      container.heavyN++;
    } else {
      container.particleList.add(new Particle(3, container.T));
      container.heavyN++;
    }
  }

  if (dist(mouseX, mouseY, 565, 685) < 25) {
    paused = !paused;
  }
  
  if (dist(mouseX, mouseY, 625, 685) < 17.5 && paused) {
     for(Particle p : container.particleList) {
       p.move();
     }
  }
  
  if (dist(mouseX, mouseY, 920, 685) < 30) {
        int size = container.particleList.size();
        for (int i = 0; i < size; i++) {
          container.particleList.remove(0);
        }
        container.lightN = 0;
        container.mediumN = 0;
        container.heavyN = 0;
        container.T = 0;
        container.P = 0;
        container.boxWidth = 600;
      }



  System.out.println(mouseX + " " + mouseY);
  if (container.bconstantButtons()) {
    container.changeConstButt(container.bconstantButtons());
    System.out.println(container.constantVar);
    //String s = container.constantButtons();
    //System.out.println(s);
  }
  if (container.mouseOnVolB()) {
    System.out.println("ResizeButton is pressed");
  }

  //when clicked change colors, follow mouse, click again to switch out.
  //container.constantButtonPressed();

  if (pmouseX > 670 && pmouseX < 685 &&
    pmouseY > 320 && pmouseY < 340 &&
    container.popUp != null) {
    container.popUp = null;
  }
}
void mousePressed() {
  if (container.mouseOnVolB()) {
    mouseXLast = mouseX;
    isDraggingVolB = true;
  } else if (container.mouseOnLidB()) {
    mouseXLast = mouseX;
    isDraggingLidB = true;
  } else if (container.mouseOnTempSlider()) {
    isDraggingTempSlider = true;
  }
  //container.mouseOnLid();
}
void mouseReleased() {
  isDraggingVolB = false;
  isDraggingLidB = false;
  isDraggingTempSlider = false;
}

void mouseDragged() {
  if (isDraggingVolB) {
    System.out.println("true");

    int newPlace = mouseX;

    System.out.println(newPlace);
    if (container.changeResizeX(newPlace-mouseXLast)) {
      mouseXLast = newPlace;
      System.out.println("dif place");
    }
  } else if (isDraggingLidB) {
    int newPlace = mouseX;
    if (container.changeLidOpeningWidth(newPlace-mouseXLast)) {
      mouseXLast = newPlace;
    }
  } else if (isDraggingTempSlider) {
    if (mouseY < container.bucketY + 0.15 * container.bucketHeight) {
      container.tempSliderY = container.bucketY + 0.15 * container.bucketHeight;
    } else if (mouseY > container.bucketY + 0.75 * container.bucketHeight) {
      container.tempSliderY = container.bucketY + 0.75 * container.bucketHeight;
    } else {
      container.tempSliderY = mouseY;
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


  for (int i = 0; i < container.particleList.size(); i++) {
    Particle p = container.particleList.get(i);
    if (!paused) {
      p.move();
    }
    if (!p.escaped) {
      totMomentum += p.wallCollide(container);
    } else {
      if (p.position.x < container.boxX ||
        p.position.x >= container.boxX + container.LID_WIDTH ||
        p.position.y < container.boxY - 50) {
        if (p.period==1) {
          container.lightN--;
        } else if (p.period==2) {
          container.mediumN--;
        } else {
          container.heavyN--;
        }
        container.particleList.remove(i);
        i--;
      }
    }
    p.display();
  }

  for (int i = 0; i < container.particleList.size(); i++) {
    Particle particleA = container.particleList.get(i);
    for (int j = i + 1; j < container.particleList.size(); j++) {
      Particle particleB = container.particleList.get(j);
      particleA.particleCollide(particleB);
    }
  }

  fill(255);
  textSize(20);
  if (!paused) {
    container.calcTemperature();
    container.calcPressure(totMomentum);
    container.calcVolume();
    container.calcR();
  }

  //displays pressure
  container.barometer();
  container.thermometer();

  if (frameCount % container.PUpdateFreq == 0) {
    totMomentum = 0;
  }
  if (container.popUp != null) {
    fill(255);
    rect(300, 300, 400, 150, 20);
    String[] lines = split(container.popUp, ". ");
    fill(0);
    textSize(20);
    text(lines[0], 350, 350);
    text(lines[1], 350, 400);
    textSize(30);
    text("X", 670, 340);
  }
}
