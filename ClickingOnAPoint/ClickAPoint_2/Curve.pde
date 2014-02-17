/**Each Curve consists of 'N' datapoints. */
class Curve{
  ArrayList<Data> data;
  PApplet p;
  public Curve(PApplet parent){
    this.p = parent; 
    data = new ArrayList<Data>();
  }
  public Curve add(Data d){ data.add(d); return this; }
  public Data get(int idx){ return idx>-1 && idx<data.size() ? data.get(idx) : null; }
  public Curve draw(){
    p.beginShape();  
    p.noStroke(); p.fill(colorForeground);
    for(Data d : data){
      p.vertex(d.xmapped(),d.ymapped());
      p.ellipse(d.xmapped(),d.ymapped(),6,6);
    }
    p.noFill(); p.stroke(colorForeground); p.strokeWeight(1);
    p.endShape();
    return this;
  }
}
