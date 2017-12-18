class Cell {
  //Attributes
  int x, y, size;
  boolean state, designate;
  color c;
  
  //Constructor
  Cell(int x, int y, int size, boolean state, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = state;
    this.designate = state;
    this.c = c;
  }
  
  //Return the state (as a boolean)
  boolean getState() {
    return state;
  }
  
  //Return the state (as a 0 or 1)
  int getStateBin() {
    if (state) return 1;
    else return 0;
  }
  
  //Set the cell's designated status to dead
  void setDead() {
    designate = false;
  }
  
  //Set the cell's designated status to alive
  void setAlive() {
    designate = true;  
  }
  
  //Update the display status to the designated status
  void update() {
    state = designate;  
  }
  
  //Directly set the cell state to alive - only called by fill methods
  void setAliveDirect() {
    setAlive();
    update();
  }
  
  //Display the cell
  void display() {
    setColor();
    rect(x, y, size, size);
  }
  
  //Determine cell color (whether alive or dead)
  void setColor() {
    stroke(255, 255, 255);
    if (state) fill(c);  
    else fill(255, 255, 255);  
  }
}