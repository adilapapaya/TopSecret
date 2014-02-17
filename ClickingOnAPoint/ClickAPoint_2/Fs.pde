public int getRow(Geometry geom, float ymapped, int rowHeight){
  return floor((ymapped - geom.y())/ rowHeight);
}
public int getColumn(Geometry geom, float xmapped, int columnWidth){
  return floor((xmapped - geom.x())/ columnWidth);
}

public class DataPointComparator implements Comparator<DataPoint>{
   @Override public int compare(DataPoint c1, DataPoint c2) {
        return c1.compareTo(c2);
    }
}

 
