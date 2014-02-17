/**Each Curve consists of 'N' datapoints. */
class Curve{
  ArrayList<DataPoint> data;
  PApplet p;
  public Curve(PApplet parent){
    this.p = parent; 
    data = new ArrayList<DataPoint>();
  }
  public Curve add(DataPoint d){ data.add(d); return this; }
  public DataPoint get(int idx){ return idx>-1 && idx<data.size() ? data.get(idx) : null; }
  public Curve draw(){
    p.beginShape();  
    p.noStroke(); p.fill(colorForeground);
    for(DataPoint d : data){
      p.vertex(d.xmapped(),d.ymapped());
      p.ellipse(d.xmapped(),d.ymapped(),6,6);
    }
    p.noFill(); p.stroke(colorForeground); p.strokeWeight(1);
    p.endShape();
    return this;
  }
}
