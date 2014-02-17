import java.awt.geom.*;
import java.awt.Rectangle;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

color greenCol = color(50,200,50), darkGreen = 0xff003300, redCol=color(230,50,0), darkRed = 0xff660000; color blueCol = color(0, 80, 150);
color steelblue = 0xff4682b4, lightsteelblue = 0xff0fc4de;
int colorActive = 0xff003652, colorForeground = 0xff00698c, colorBackground = 0xff6a6a6a, whiteCol = 0xffffffff;
int lGrey = 0xffaaaaaa;

DataPoint[] d;
Curve[] curves;
int numPoints = 10000, curveArraySize = 100;

// to help with the mouseover. 
// This is an array of length rows*cols where cell 0: [row 0, col 0], cell 1: [row 0, col 1], cell cols: [row 1, col 0], etc.
// (I.e. Indexing is similar to Processing's image.pixels array)
Geometry[] rectangles;  
int cols, rows; // number of rectangles in x and y
int rWidth = 50, rHeight = 50;

Geometry geom = new Geometry(50,80,1000,600);
void setup(){
  size(1400,800);
   
  cols = ceil((float)geom.w()/rWidth); rows = ceil((float)geom.h()/rHeight);
  rectangles = new Geometry[rows*cols];
  for(int r=0; r<rows; r++){ 
    for(int c=0; c<cols; c++){
      rectangles[r*cols + c] = new Geometry(geom.x() + c*rWidth,geom.y() + r*rHeight,rWidth,rHeight);
    }
  }
  d = new DataPoint[numPoints];
  curves = new Curve[curveArraySize];
  for(int i=0; i<numPoints; i++){
   d[i] = new DataPoint(i, geom,new PVector(random(1), random(1) ), new Extrema(0,1), new Extrema(0,1));
   if(i<curves.length) curves[i] = new Curve(this);
    
  }
  Arrays.sort(d, new DataPointComparator());
  for(int i=0; i<numPoints; i++){
     d[i].id(i);
     curves[i%curveArraySize].add( d[i] );
     int r = d[i].getRow(rHeight);
     int c = d[i].getColumn(rWidth);
     rectangles[ cols * r + c ].addDataPoint(d[i]);
  }
   
}

void draw(){
  background(255);
  drawPoints(this);
}
void drawPoints(PApplet p){
  p.fill(0); p.noStroke();
  int eSize = 3;
  boolean noneFoundYet = true; 
  int mCol = floor((mouseX -geom.x())/ rWidth ), mRow = floor((mouseY-geom.y()) / rHeight);
  for(int r=0; r<rows; r++){
    for(int c=0; c<cols; c++){
     rectangles[r*cols + c].draw();
    }
  }
  if(mRow>-1 && mRow < rows && mCol > -1 && mCol < cols){
    rectangles[mRow * cols + mCol].draw(mouseX,mouseY);
    int activeElementId = rectangles[mRow * cols + mCol].getMouseoverPointId();
    if(activeElementId>-1){
      curves[activeElementId%curveArraySize].draw();
    }
    p.noStroke();
  }
   
}
