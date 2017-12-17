class Cell {
  int x, y, size;
  boolean state, designate;
  color c;
  
  Cell(int x, int y, int size, boolean state, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = state;
    this.designate = state;
    this.c = c;
  }
  
  boolean getState() {
    return state;
  }
  
  int getStateBin() {
    if (state) return 1;
    else return 0;
  }
  
  void setDead() {
    designate = false;
  }
  
  void setAlive() {
    designate = true;  
  }
  
  void update() {
    state = designate;  
  }
  
  void setAliveDirect() {
    setAlive();
    update();
  }
  
  void display() {
    setColor();
    rect(x, y, size, size);
  }
  
  void setColor() {
    stroke(255, 255, 255);
    //stroke(0, 0, 0);
    if (state) fill(c);  
    else fill(255, 255, 255);  
  }
  
  String toString() {
    return "<CGL Cell, alive: " + state + ">";  
  }
}