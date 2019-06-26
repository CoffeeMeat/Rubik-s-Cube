
public class Face
{
  private Box[][] cubes;
  private PVector pos; 


  public Face(String orient, String c, float x, float y, float z, float len)
  {
    PVector dims;
    cubes = new Box[3][3];

    if (orient.equals("F") || orient.equals("B"))
      dims = new PVector(len, len, 0);
    else if (orient.equals("L") || orient.equals("R"))
      dims = new PVector(0, len, len);
    else // down or up
    dims = new PVector(len, 0, len);


    for (int i = 0; i < 3; i++)
    {
      for (int j = 0; j < 3; j++)
      {
        float zFactor;
        if (orient.equals("U") || orient.equals("D"))
          zFactor = z + i * dims.z;
        else 
        zFactor = z + j*dims.z;

        cubes[i][j] = new Box(c, x+(j*dims.x), y+(i*dims.y), zFactor, dims.x, dims.y, dims.z);
      }
    }
  }

  public void show()
  {
    for (int i = 0; i < 3; i++)
      for (int j = 0; j < 3; j++)
        cubes[i][j].show();
  }

  public color[] getRow(int r)
  {
    color[] a = new color[3];

    for (int i = 0; i < 3; i++)
      a[i] = cubes[r][i].getColor();
    return a;
  }

  public color[] getCol(int c)
  {
    color[] a = new color[3];
    for(int i = 0; i < 3; i++)
      a[i] = cubes[i][c].getColor();
    
    return a;
  }

  public void setColor(int r, int c, color col)
  {
    cubes[r][c].setColor(col);
  }

  public color getColor(int r, int c)
  {
    return cubes[r][c].getColor();
  }
  
}
