 
/** Class for storing each data point */
class Data{
 PVector value; // for storing the x and y values
 PVector mapped; // for storing the mapped x and y values;
 Geometry geom;
 Extrema xEx; // xmin and xmax
 Extrema yEx; // ymin and ymax
 
 int col, row; // row and column, relative to a specified grid.
 //Rectangle rect; //plot geometry. used in the mapping
 float r = 4; //radius around which to search
  public Data(Geometry geom, PVector value, Extrema xExtrema, Extrema yExtrema){
    this.geom = geom;
    this.value = value;
    this.xEx = xExtrema;
    this.yEx = yExtrema;
    float xmapped = map(value.x,xEx.min(),xEx.max(),geom.x(),geom.xr()),
          ymapped = map(value.y,yEx.min(),yEx.max(),geom.yb(),geom.y());
    this.mapped = new PVector(xmapped, ymapped);
  } 
  public float x(){ return value.x; }
  public float y(){ return value.y; }
  public float xmapped(){ return mapped.x; }
  public float ymapped(){ return mapped.y; }
  /** check if mx, my overlaps with xmapped, ymapped */
  public boolean isOver(float mx, float my){
    return dist(xmapped(),ymapped(),mx,my)<r;
  } 
  public int compareTo(Data other){
   return value.x > other.x() ? 1 : value.x < other.x() ? -1 : 
          value.y > other.y() ? 1 : value.y < other.y() ? -1 : 0;
  } 
  
  public int getRow(int rowHeight){ 
    return floor((mapped.y - geom.y())/ rowHeight);
  }
  public int getColumn(int columnWidth){
    return floor((mapped.x - geom.x())/ columnWidth);
  }
  public Data draw(float mx, float my){
    noStroke(); 
    //println("mouse positions = "+mx+","+my+", mapped coordinates = "+mapped.x+","+mapped.y);
    if(isOver(mx,my)){
      fill(redCol); 
      if(mousePressed) ellipse(mapped.x,mapped.y,2*r,2*r);
      else ellipse(mapped.x,mapped.y,1.5*r,1.5*r);
    }
    else draw();
    return this;
  }
  public Data draw(){
    fill(0xffaaaaaa); noStroke();
    ellipse(mapped.x,mapped.y,r,r);
    return this;
  }
}
/**Class for storing the minimum and maximum */
public class Extrema{
  float min, max; 
  public Extrema(float min, float max){
    this.min = min; this.max = max;
  }
  public float min(){ return min; }
  public float max(){ return max; }
}
/**class for storing the left, top, width, and height in a single entity. */
public class Geometry{
  ArrayList<Data> dataPoints = new ArrayList<Data>();
  
  int x, y, w, h;
  public Geometry(int left, int top, int width, int height){
    this.x = left; this.y = top; this.w = width; this.h = height;
  }
  public int x(){ return x; }
  public int y(){ return y; }
  public int w(){ return w; }
  public int h(){ return h; }
  
  /**right*/ 
  public int xr(){ return x+w; }
  /**bottom*/
  public int yb(){ return y+h; }
  
  public Geometry addDataPoint(Data data){
    dataPoints.add(data);
    return this;
  }
   public Geometry clearAllDataPoints(){
    dataPoints.clear();
    return this;
  }
  public boolean isOver(float mx, float my){
    return mx>=x && mx<x+w && my>=y && my<y+h; 
  }
  /** Boring draw when we know the mouse isn't over that rectangle*/
  public Geometry draw(){
    noFill();
    stroke(0xffaaaaaa); strokeWeight(.5);
    rect(x,y,w,h);
    for(Data d: dataPoints){
       d.draw();  
    }
    return this;
  }
  public Geometry draw(float mx, float my){
    if(isOver(mx,my)){
       for(Data d: dataPoints){
         d.draw(mx,my);  
      }
      stroke(colorForeground); strokeWeight(3);  noFill();
      rect(x,y,w,h);
    }
    else draw();
    return this;
  }
}
