import peasy.*;
import java.util.Stack;

Stack<Integer> solver;
Face back;
Face front;
Face right;
Face left;
Face up;
Face d;

void setup()
{
  size(600, 600, P3D);  //sets the size of the window, and makes the environemnt 3 dimensional
  PeasyCam p = new PeasyCam(this, 500);  //creates a PeasyCam object that will allow us to look around the cube
  p.setMinimumDistance(50);
  p.setMaximumDistance(500);

  p.lookAt(width/2, height/2, 0);
  //create new Face objects for each side of the Rubik's cube, the first integer represents the cubing notation used for each face
  //each Face is an array of Box objects 
  back = new Face("F", "RED", 300, 300, 0, 30); 
  front = new Face("B", "ORANGE", 300, 300, 90, 30);
  right = new Face("R", "GREEN", 375, 300, 15, 30);
  left = new Face("L", "BLUE", 285, 300, 15, 30);
  up = new Face("U", "WHITE", 300, 285, 15, 30);
  d = new Face("D", "YELLOW", 300, 375, 15, 30);

  solver = new Stack<Integer>();
}

void draw()
{
  background(255);
  back.show();
  front.show();
  right.show();
  left.show();
  up.show();
  d.show();
}

int rotateU()
{
  //CORNERS
  color temp0_2 = up.getColor(0, 2);
  up.setColor(0, 2, up.getColor(0, 0));

  color temp2_2 = up.getColor(2, 2);
  up.setColor(2, 2, temp0_2);

  color temp2_0 = up.getColor(2, 0);
  up.setColor(2, 0, temp2_2); 

  up.setColor(0, 0, temp2_0);
  //EDGES
  color temp1_2 = up.getColor(1, 2);
  up.setColor(1, 2, up.getColor(0, 1));

  color temp2_1 = up.getColor(2, 1);
  up.setColor(2, 1, temp1_2);

  color temp1_0 = up.getColor(1, 0);
  up.setColor(1, 0, temp2_1);

  up.setColor(0, 1, temp1_0);
  /////////////////////////////////////
  color[] temp = front.getRow(0);
  for (int i = 0; i < 3; i++)
    front.setColor(0, i, right.getColor(0, (i-2)*-1));

  for (int i = 0; i < 3; i++)
    right.setColor(0, i, back.getColor(0, i));

  for (int i = 2; i >= 0; i--)
    back.setColor(0, i, left.getColor(0, (i-2)*-1));

  for (int i = 0; i < 3; i++)
    left.setColor(0, i, temp[i]);

  return 1;
}

int rotateUu()
{
  //CORNERS
  color temp2_0 = up.getColor(2, 0);
  up.setColor(2, 0, up.getColor(0, 0));

  color temp2_2 = up.getColor(2, 2);
  up.setColor(2, 2, temp2_0);

  color temp0_2 = up.getColor(0, 2);
  up.setColor(0, 2, temp2_2); 

  up.setColor(0, 0, temp0_2);
  //EDGES
  color temp1_0 = up.getColor(1, 0);
  up.setColor(1, 0, up.getColor(0, 1));

  color temp2_1 = up.getColor(2, 1);
  up.setColor(2, 1, temp1_0);

  color temp1_2 = up.getColor(1, 2);
  up.setColor(1, 2, temp2_1);

  up.setColor(0, 1, temp1_2);
  /////////////////////////////////////
  color[] temp = front.getRow(0);
  for (int i = 0; i < 3; i++)
    front.setColor(0, i, left.getColor(0, i));

  for (int i = 0; i < 3; i++)
    left.setColor(0, i, back.getColor(0, (i-2)*-1));

  for (int i = 0; i < 3; i++)
    back.setColor(0, i, right.getColor(0, i));

  for (int i = 0; i < 3; i++)
    right.setColor(0, i, temp[(i-2)*-1]);

  return -1;
}

int rotateDd()
{
  //CORNERS
  color temp0_2 = d.getColor(0, 2);
  d.setColor(0, 2, d.getColor(0, 0));

  color temp2_2 = d.getColor(2, 2);
  d.setColor(2, 2, temp0_2);

  color temp2_0 = d.getColor(2, 0);
  d.setColor(2, 0, temp2_2); 

  d.setColor(0, 0, temp2_0);
  //EDGES
  color temp1_2 = d.getColor(1, 2);
  d.setColor(1, 2, d.getColor(0, 1));

  color temp2_1 = d.getColor(2, 1);
  d.setColor(2, 1, temp1_2);

  color temp1_0 = d.getColor(1, 0);
  d.setColor(1, 0, temp2_1);

  d.setColor(0, 1, temp1_0);
  /////////////////////////////////////
  color[] temp = front.getRow(2);

  for (int i = 0; i < 3; i++)
    front.setColor(2, i, right.getColor(2, (i-2)*-1));

  for (int i = 0; i < 3; i++)
    right.setColor(2, i, back.getColor(2, i));

  for (int i = 0; i < 3; i++)
    back.setColor(2, i, left.getColor(2, (i-2)*-1));

  for (int i = 0; i < 3; i++)
    left.setColor(2, i, temp[i]);

  return -2;
}

int rotateD()
{
  //CORNERS
  color temp2_0 = d.getColor(2, 0);
  d.setColor(2, 0, d.getColor(0, 0));

  color temp2_2 = d.getColor(2, 2);
  d.setColor(2, 2, temp2_0);

  color temp0_2 = d.getColor(0, 2);
  d.setColor(0, 2, temp2_2); 

  d.setColor(0, 0, temp0_2);
  //EDGES
  color temp1_0 = d.getColor(1, 0);
  d.setColor(1, 0, d.getColor(0, 1));

  color temp2_1 = d.getColor(2, 1);
  d.setColor(2, 1, temp1_0);

  color temp1_2 = d.getColor(1, 2);
  d.setColor(1, 2, temp2_1);

  d.setColor(0, 1, temp1_2);
  /////////////////////////////////////

  color[] temp = front.getRow(2);
  for (int i = 0; i < 3; i++)
    front.setColor(2, i, left.getColor(2, i));

  for (int i = 0; i < 3; i++)
    left.setColor(2, i, back.getColor(2, (i-2)*-1));

  for (int i = 0; i < 3; i++)
    back.setColor(2, i, right.getColor(2, i));

  for (int i = 0; i < 3; i++)
    right.setColor(2, i, temp[(i-2)*-1]);

  return 2;
}

int rotateL()
{
  //CORNERS
  color temp0_2 = left.getColor(0, 2);
  left.setColor(0, 2, left.getColor(0, 0));

  color temp2_2 = left.getColor(2, 2);
  left.setColor(2, 2, temp0_2);

  color temp2_0 = left.getColor(2, 0);
  left.setColor(2, 0, temp2_2); 

  left.setColor(0, 0, temp2_0);
  //EDGES
  color temp1_2 = left.getColor(1, 2);
  left.setColor(1, 2, left.getColor(0, 1));

  color temp2_1 = left.getColor(2, 1);
  left.setColor(2, 1, temp1_2);

  color temp1_0 = left.getColor(1, 0);
  left.setColor(1, 0, temp2_1);

  left.setColor(0, 1, temp1_0);
  /////////////////////////////////////
  color[] temp = front.getCol(0);

  for (int i = 0; i < 3; i++)
    front.setColor(i, 0, up.getColor(i, 0));

  for (int i = 0; i < 3; i++)
    up.setColor(i, 0, back.getColor((i-2)*-1, 0));

  for (int i = 0; i < 3; i++)
    back.setColor(i, 0, d.getColor(i, 0));

  for (int i = 0; i < 3; i++)
    d.setColor(i, 0, temp[(i-2)*-1]);

  return 3;
}

int rotateLl()
{
  //CORNERS
  color temp2_0 = left.getColor(2, 0);
  left.setColor(2, 0, left.getColor(0, 0));

  color temp2_2 = left.getColor(2, 2);
  left.setColor(2, 2, temp2_0);

  color temp0_2 = left.getColor(0, 2);
  left.setColor(0, 2, temp2_2); 

  left.setColor(0, 0, temp0_2);
  //EDGES
  color temp1_0 = left.getColor(1, 0);
  left.setColor(1, 0, left.getColor(0, 1));

  color temp2_1 = left.getColor(2, 1);
  left.setColor(2, 1, temp1_0);

  color temp1_2 = left.getColor(1, 2);
  left.setColor(1, 2, temp2_1);

  left.setColor(0, 1, temp1_2);
  /////////////////////////////////////
  color[] temp = front.getCol(0);
  for (int i = 0; i < 3; i++)
    front.setColor(i, 0, d.getColor((i-2)*-1, 0));

  for (int i = 0; i < 3; i++)
    d.setColor(i, 0, back.getColor(i, 0));

  for (int i = 0; i < 3; i++)
    back.setColor(i, 0, up.getColor((i-2)*-1, 0));

  for (int i = 0; i < 3; i++)
    up.setColor(i, 0, temp[i]);

  return -3;
}


int rotateR()
{
  //CORNERS
  color temp2_0 = right.getColor(2, 0);
  right.setColor(2, 0, right.getColor(0, 0));

  color temp2_2 = right.getColor(2, 2);
  right.setColor(2, 2, temp2_0);

  color temp0_2 = right.getColor(0, 2);
  right.setColor(0, 2, temp2_2); 

  right.setColor(0, 0, temp0_2);
  //EDGES
  color temp1_0 = right.getColor(1, 0);
  right.setColor(1, 0, right.getColor(0, 1));

  color temp2_1 = right.getColor(2, 1);
  right.setColor(2, 1, temp1_0);

  color temp1_2 = right.getColor(1, 2);
  right.setColor(1, 2, temp2_1);

  right.setColor(0, 1, temp1_2);
  /////////////////////////////////////
  color[] temp = front.getCol(2);
  for (int i = 0; i < 3; i++)
    front.setColor(i, 2, d.getColor((i-2)*-1, 2));

  for (int i = 0; i < 3; i++)
    d.setColor(i, 2, back.getColor(i, 2));

  for (int i = 0; i < 3; i++)
    back.setColor(i, 2, up.getColor((i-2)*-1, 2));

  for (int i = 0; i < 3; i++)
    up.setColor(i, 2, temp[i]);

  return 4;
}

int rotateRr()
{

  //CORNERS
  color temp0_2 = right.getColor(0, 2);
  right.setColor(0, 2, right.getColor(0, 0));

  color temp2_2 = right.getColor(2, 2);
  right.setColor(2, 2, temp0_2);

  color temp2_0 = right.getColor(2, 0);
  right.setColor(2, 0, temp2_2); 

  right.setColor(0, 0, temp2_0);
  //EDGES
  color temp1_2 = right.getColor(1, 2);
  right.setColor(1, 2, right.getColor(0, 1));

  color temp2_1 = right.getColor(2, 1);
  right.setColor(2, 1, temp1_2);

  color temp1_0 = right.getColor(1, 0);
  right.setColor(1, 0, temp2_1);

  right.setColor(0, 1, temp1_0);
  /////////////////////////////////////
  color[] temp = front.getCol(2);
  for (int i = 0; i < 3; i++)
    front.setColor(i, 2, up.getColor(i, 2));

  for (int i = 0; i < 3; i++)
    up.setColor(i, 2, back.getColor((i-2)*-1, 2));

  for (int i = 0; i < 3; i++)
    back.setColor(i, 2, d.getColor(i, 2));

  for (int i = 0; i < 3; i++)
    d.setColor(i, 2, temp[(i-2)*-1]);

  return -4;
}

int rotateB()
{
  //CORNERS
  color temp2_0 = back.getColor(2, 0);
  back.setColor(2, 0, back.getColor(0, 0));

  color temp2_2 = back.getColor(2, 2);
  back.setColor(2, 2, temp2_0);

  color temp0_2 = back.getColor(0, 2);
  back.setColor(0, 2, temp2_2); 

  back.setColor(0, 0, temp0_2);
  //EDGES
  color temp1_0 = back.getColor(1, 0);
  back.setColor(1, 0, back.getColor(0, 1));

  color temp2_1 = back.getColor(2, 1);
  back.setColor(2, 1, temp1_0);

  color temp1_2 = back.getColor(1, 2);
  back.setColor(1, 2, temp2_1);

  back.setColor(0, 1, temp1_2);
  /////////////////////////////////////
  color[] temp = up.getRow(0);

  for (int i = 2; i >= 0; i--)
    up.setColor(0, i, right.getColor((i-2)*-1, 0));
  for (int i = 2; i >= 0; i--)
    right.setColor(i, 0, d.getColor(0, (i-2)*-1));
  for (int i = 2; i >= 0; i--)
    d.setColor(0, i, left.getColor(i, 0));
  for (int i = 0; i < 3; i++)
    left.setColor(i, 0, temp[i]);

  return 5;
}

int rotateBb()
{
  //CORNERS
  color temp0_2 = back.getColor(0, 2);
  back.setColor(0, 2, back.getColor(0, 0));

  color temp2_2 = back.getColor(2, 2);
  back.setColor(2, 2, temp0_2);

  color temp2_0 = back.getColor(2, 0);
  back.setColor(2, 0, temp2_2); 

  back.setColor(0, 0, temp2_0);
  //EDGES
  color temp1_2 = back.getColor(1, 2);
  back.setColor(1, 2, back.getColor(0, 1));

  color temp2_1 = back.getColor(2, 1);
  back.setColor(2, 1, temp1_2);

  color temp1_0 = back.getColor(1, 0);
  back.setColor(1, 0, temp2_1);

  back.setColor(0, 1, temp1_0);
  /////////////////////////////////////
  color[] temp = up.getRow(0);

  for (int i = 2; i >= 0; i--)
    up.setColor(0, i, left.getColor(i, 0));
  for (int i = 2; i >= 0; i--)
    left.setColor(i, 0, d.getColor(0, (i-2)*-1));
  for (int i = 2; i >= 0; i--)
    d.setColor(0, i, right.getColor((i-2)*-1, 0));
  for (int i = 0; i < 3; i++)
    right.setColor(i, 0, temp[i]);

  return -5;
}

int rotateF()
{
  //CORNERS
  color temp0_2 = front.getColor(0, 2);
  front.setColor(0, 2, front.getColor(0, 0));

  color temp2_2 = front.getColor(2, 2);
  front.setColor(2, 2, temp0_2);

  color temp2_0 = front.getColor(2, 0);
  front.setColor(2, 0, temp2_2); 

  front.setColor(0, 0, temp2_0);
  //EDGES
  color temp1_2 = front.getColor(1, 2);
  front.setColor(1, 2, front.getColor(0, 1));

  color temp2_1 = front.getColor(2, 1);
  front.setColor(2, 1, temp1_2);

  color temp1_0 = front.getColor(1, 0);
  front.setColor(1, 0, temp2_1);

  front.setColor(0, 1, temp1_0);
  /////////////////////////////////////
  color[] temp = up.getRow(2);

  for (int i = 0; i < 3; i++)
    up.setColor(2, i, left.getColor((i-2)*-1, 2));
  for (int i = 0; i < 3; i++)
    left.setColor(i, 2, d.getColor(2, i));
  for (int i = 0; i < 3; i++)
    d.setColor(2, i, right.getColor((i-2)*-1, 2));
  for (int i = 0; i < 3; i++)
    right.setColor(i, 2, temp[i]);

  return 6;
}

int rotateFf()
{
  //CORNERS
  color temp2_0 = front.getColor(2, 0);
  front.setColor(2, 0, front.getColor(0, 0));

  color temp2_2 = front.getColor(2, 2);
  front.setColor(2, 2, temp2_0);

  color temp0_2 = front.getColor(0, 2);
  front.setColor(0, 2, temp2_2); 

  front.setColor(0, 0, temp0_2);
  //EDGES
  color temp1_0 = front.getColor(1, 0);
  front.setColor(1, 0, front.getColor(0, 1));

  color temp2_1 = front.getColor(2, 1);
  front.setColor(2, 1, temp1_0);

  color temp1_2 = front.getColor(1, 2);
  front.setColor(1, 2, temp2_1);

  front.setColor(0, 1, temp1_2);
  /////////////////////////////////////
  color[] temp = up.getRow(2);
  for (int i = 0; i < 3; i++)
    up.setColor(2, i, right.getColor(i, 2));
  for (int i = 0; i < 3; i++)
    right.setColor(i, 2, d.getColor(2, (i-2)*-1));
  for (int i = 0; i < 3; i++)
    d.setColor(2, i, left.getColor(i, 2));
  for (int i = 0; i < 3; i++)
    left.setColor(i, 2, temp[(i-2)*-1]);
  return -6;
}

void keyPressed() 
{
  switch(key)
  {
    /***************U**************/
  case 'u':
    solver.push(-rotateU());
    break;
  case 'U':
    solver.push(-rotateUu());
    break;
    /***************D**************/
  case 'd':
    solver.push(-rotateD());
    break;
  case 'D':
    solver.push(-rotateDd());
    break;
    /***************L**************/
  case 'l':
    solver.push(-rotateL());
    break;
  case 'L':
    solver.push(-rotateLl());
    break;
    /***************R**************/
  case 'r':
    solver.push(-rotateR());
    break;
  case 'R':
    solver.push(-rotateRr());
    break;
    /***************B**************/
  case 'b':
    solver.push(-rotateB());
    break;
  case 'B':
    solver.push(-rotateBb());
    break;
    /***************F**************/
  case 'f':
    solver.push(-rotateF());
    break;
  case 'F':
    solver.push(-rotateFf());
    break;
    /********SOLVE**********/
  case 's':
    try
    {
      int p = solver.pop();
      System.out.println(p);
      makeMove(p);
    }
    catch(Exception e) {
    }
    break;
  case 'k':
    randomize();
    break;
  }
}

void makeMove(int i)
{
  switch(i)
  {
  case 1:
    rotateU();
    break;
  case -1:
    rotateUu();
    break;
  case 2:
    rotateD();
    break;
  case -2:
    rotateDd();
    break;
  case 3:
    rotateL();
    break;
  case -3:
    rotateLl();
    break;
  case 4:
    rotateR();
    break;
  case -4:
    rotateRr();
    break;
  case 5:
    rotateB();
    break;
  case -5:
    rotateBb();
    break;
  case 6: 
    rotateF();
    break;
  case -6:
    rotateFf();
    break;
  }
}

public void randomize()
{
  for (int i = 0; i < 10; i++)
  {
    int move = ((int)(Math.random()*13)-6);
    System.out.println(move);
    if (move != 0)
    {
      solver.push(-move);
      makeMove(move);
    }
    else
      i--;
  }
}
