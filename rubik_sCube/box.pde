class cubie {
  PMatrix3D matrix;
  int x=0;
  int y=0;
  int z=0;

  boolean highlight = false; 
  cubie( PMatrix3D m, int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.matrix = m;
  }
  void show() {
    fill(255);
    if (highlight) {
      fill(255, 0, 0);
    }
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();

    applyMatrix(matrix);
    box(1);

    popMatrix();
  }

  void update(int x, int y, int z) {
    matrix.reset();
    matrix.translate(x, y, z);
    this.x=x;
    this.y=y;
    this.z=z;
  }
}
