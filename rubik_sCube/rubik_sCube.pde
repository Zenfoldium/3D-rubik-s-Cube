import peasy.*;
PeasyCam cam;

//up down right left front back



color[] colors ={
  #FFFFFF, #FFFF00, 
  #FF0000, #FFA500, 
  #00FF00, #0000FF
};

int dim =3;
cubie[] cube = new cubie[dim*dim*dim];
void setup() {
  size(600, 600, P3D); 
  cam = new PeasyCam(this, 400);

  int index=0;
  for (int x = -1; x<=1; x++) {
    for (int y = -1; y<=1; y++) {
      for (int z = -1; z<=1; z++) {
        PMatrix3D matrix = new PMatrix3D(); 
        matrix.translate(x, y, z);
        cube[index] = new cubie(matrix, x, y, z);
        index++;
      }
    }
  }
  cube[2].highlight=true;
  cube[0].highlight=true;
}

int index=0;
void turnZ(int index) {
  for (int i =0; i<cube.length; i++) {
    cubie qb =cube[i];
    if (qb.z==index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(qb.x, qb.y);
      //matrix.print();
      //System.out.println(matrix.getClass().getSimpleName());
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
      //println("HELLO");
    }
  }
}

void keyPressed() {
  if (key=='1')
  {
    turnZ(0);
  }
}


void draw() {
  background(51); 
  scale(50); 
  //translate(200,200);
  for (int i =0; i<cube.length; i++)
  {
    cube[i].show();
  }
} 
