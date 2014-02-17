public int getRow(Geometry geom, float ymapped, int rowHeight){
  return floor((ymapped - geom.y())/ rowHeight);
}
public int getColumn(Geometry geom, float xmapped, int columnWidth){
  return floor((xmapped - geom.x())/ columnWidth);
}
