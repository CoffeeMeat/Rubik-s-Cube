public class Box
{
  private PVector pos;
  private color c;
  private PVector dims;
  public Box(String col, float x, float y, float z, float len, float hgt, float dep)
  {
    if (col.equals("RED"))
      c = color(255, 0, 0); //red
    else if (col.equals("GREEN"))
      c = color(0, 255, 0); //green
    else if (col.equals("BLUE"))
      c = color(0, 0, 255); //blue
    else if (col.equals("ORANGE"))
      c = color(255, 165, 0); //orange
    else if (col.equals("YELLOW"))
      c = color(255, 255, 0); //yellow
    else
      c = color(255); //white

    pos = new PVector(x, y, z);
    dims = new PVector(len, hgt, dep);
  }

  void setColor(color col)
  {
    c = color(col);
  }
  
  color getColor()
  {
    return c;
  }

  void show()
  {
    pushMatrix();
    fill(c);
    stroke(0);
    strokeWeight(4);
    translate(pos.x, pos.y, pos.z);
    box(dims.x, dims.y, dims.z);
    popMatrix();
  }
}
