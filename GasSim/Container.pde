public class Container{
  private String[] constantVar;
  private  int boxWidth;
  private  int boxHeight;
  private  int wallCollisions;
  private  boolean lidStatus;
  private  double P;
  private  double V;
  private  int n;
  private  final double R = 0.0821;
  private  double T;
  private double rightWallX;
  
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
    fill(255);
    strokeWeight(3);
    rect(200, 150, boxWidth, boxHeight);
    rightWallX = 200 + boxWidth;
    //System.out.println(rightWallX);
  
  }
  
  void changePressure(float a){
  }
  void changeTemperature(float a){
  }
  void changeMoles(float a){
  }
  void changeVolume(){
    V = boxWidth * boxHeight;
  }
  void adjustWidth(){
    
  }
  void mouseDragged() 
{
  if(mouseX >= (rightWallX-10) && mouseX >= (10 + rightWallX)){
    background(150);
  }
}
  
  
}
