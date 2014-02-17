import java.awt.geom.*;
import java.awt.Rectangle;

color greenCol = color(50,200,50), darkGreen = 0xff003300, redCol=color(230,50,0), darkRed = 0xff660000; color blueCol = color(0, 80, 150);
color steelblue = 0xff4682b4, lightsteelblue = 0xff0fc4de;
int colorActive = 0xff003652, colorForeground = 0xff00698c, colorBackground = 0xff6a6a6a, whiteCol = 0xffffffff;


Data[] d;
int numPoints = 50000;

Geometry[][] rectangles; // to help with the mouseover
int cols, rows; // number of rectangles in x and y
int rWidth = 50, rHeight = 50;
void setup(){
  size(1400,800);
  
  cols = ceil((float)width/rWidth); rows = ceil((float)height/rHeight);
  rectangles = new Geometry[rows][cols];
  for(int r=0; r<rows; r++){ 
    for(int c=0; c<cols; c++){
      rectangles[r][c] = new Geometry(c*rWidth,r*rHeight,rWidth,rHeight);
    }
  }
  d = new Data[numPoints];
  Geometry geom = new Geometry(0,0,width,height);
  for(int i=0; i<numPoints; i++){
   d[i] = new Data(geom,new PVector( random(1),random(1) ), new Extrema(0,1), new Extrema(0,1));
   int r = d[i].getRow(rHeight);
   int c = d[i].getColumn(rWidth);
   rectangles[ r ][ c ].addDataPoint(d[i]);
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
  for(int r=0; r<rows; r++){
    for(int c=0; c<cols; c++){
     rectangles[r][c].draw(mouseX,mouseY);
    }
  }
}
