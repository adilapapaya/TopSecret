public int getRow(Geometry geom, float ymapped, int rowHeight){
  return floor((ymapped - geom.y())/ rowHeight);
}
public int getColumn(Geometry geom, float xmapped, int columnWidth){
  return floor((xmapped - geom.x())/ columnWidth);
}

public class DataComparator implements Comparator<Data>{
   @Override public int compare(Data c1, Data c2) {
        return c1.compareTo(c2);
    }
}

 
