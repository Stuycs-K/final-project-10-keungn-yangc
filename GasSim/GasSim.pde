Container container = new Container();

private int released;
float totMomentum;

private int pumpBX;
private int pumpBY;
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
  int click = addRemove();
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
        container.particleList.add(new Particle(1));
        container.lightN++;
      }
    }
  }
  if (click == ADD_LIGHT_LITTLE && container.lightN < 100) {
    container.particleList.add(new Particle(1));
    container.lightN++;
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
        container.particleList.add(new Particle(2));
        container.mediumN++;
      }
    }
  }
  if (click == ADD_MEDIUM_LITTLE && container.mediumN < 100) {
    container.particleList.add(new Particle(2));
    container.mediumN++;
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
        container.particleList.add(new Particle(3));
        container.heavyN++;
      }
    }
  }
  if (click == ADD_HEAVY_LITTLE && container.heavyN < 100) {
    container.particleList.add(new Particle(3));
    container.heavyN++;
  }

  if (mouseOnPump()) {
    //container.addSomeParticles();
  }
  System.out.println(mouseX + " " + mouseY);
  if (container.bconstantButtons()) {
    container.constantButtons();
    container.changeConstButt(container.bconstantButtons());
    String s = container.constantButtons();
    System.out.println(s);
  }
  if(container.mouseOnVolB()){
    System.out.println("ResizeButton is pressed");
  }
    
  //when clicked change colors, follow mouse, click again to switch out. 
  //container.constantButtonPressed();
}
void mouseReleased() {
  released = mouseX;
}
/*void mouseDragged() {
  if (container.mouseOnVolB()) {
    System.out.println("true");

    int newPlace = released;

    System.out.println(newPlace);
    if (container.changeResizeX(newPlace)) {
      System.out.println("dif place");
    }
  }
}*/




void setup() {
  size(1000, 750);
  background(0);
}

void draw() {
  background(0);
  stroke(0);
  fill(255);
  container.display();


  for (Particle p : container.particleList) {
    p.move();
    totMomentum += p.wallCollide(container);
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
  container.calcTemperature();
  container.calcPressure(totMomentum);
  container.calcVolume();
  text("# of Particles (moles): " + container.n, 40, 20);
  text("Temperature: " + container.T, 40, 50);
  text("Pressure: " + container.P, 40, 80);
  //displays pressure
  container.barometer();
  text("Volume: " + container.V, 40, 110);
  if (frameCount % container.PUpdateFreq == 0) {
    totMomentum = 0;
  }
}
