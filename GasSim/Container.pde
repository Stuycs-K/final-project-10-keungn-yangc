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
  }
}
