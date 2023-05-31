Container container = new Container();
ArrayList<Particle> pL = new ArrayList<Particle>();

private int released;
float totMomentum;

private int pumpBX;
private int pumpBY;
boolean mouseOnPump() {
  if (pmouseX >= 100 && pmouseX <= 180 && pmouseY >= 450 && pmouseY <= 520) {

    return true;
  }
  return false;
}
void mouseClicked() {


  if (mouseOnPump()) {

    container.addSomeParticles();
    pL = container.getArrayL();
  }
  System.out.println(mouseX + " " + mouseY);
  
  String s = container.constantButtons();
  System.out.println(s);
  
  container.constantButtonPressed();
}
void mouseReleased() {
  released = mouseX;
}
void mouseDragged() {
  if (container.mouseOnVolB()) {
    System.out.println("true");

    int newPlace = released;

    System.out.println(newPlace);
    if (container.changeResizeX(newPlace)) {
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

  for (Particle p : pL) {

    p.move();
    totMomentum += p.wallCollide(container);
    p.display();
  }

  for (int i = 0; i < pL.size(); i++) {
    Particle particleA = pL.get(i);
    for (int j = i + 1; j < pL.size(); j++) {
      Particle particleB = pL.get(j);
      particleA.particleCollide(particleB);
    }
  }
  
  fill(255);
  textSize(20);
  container.calcTemperature();
  container.calcPressure(totMomentum);
  text("# of Particles (moles): " + container.n, 40, 20);
  text("Temperature:" + container.T, 40, 50);
  text("Pressure:" + container.P, 40, 80);
  if(frameCount % 500 == 0) {
    
    totMomentum = 0;
  }
}
