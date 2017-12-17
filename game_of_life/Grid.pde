class Grid {
  Cell[][] grid;
  int size, cell_size;
  color c;
  
  Grid(int size, int cell_size, String pattern, color c) {
    this.size = size;
    this.cell_size = cell_size;
    this.c = c;
    fillGrid(pattern);
  }
  
  void fillGrid(String pattern) {
    grid = new Cell[size][size];
    if (pattern == "checkerboard") checkerboardFill();
    else if (pattern == "glider") glider();
    else if (pattern == "acorn") acorn();
    else basicFill();
  }
  
  void basicFill() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j] = new Cell(j * cell_size, i * cell_size, cell_size, false, c);
        squarePattern();
      }
    }
  }
  
  void checkerboardFill() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j] = new Cell(j * cell_size, i * cell_size, cell_size,  ((i + j) % 2) == 1 ? true : false, c);
        squarePattern();
      }
    }
  }
  
  void glider() {
    basicFill();
    grid[3][3].setAliveDirect();
    grid[4][4].setAliveDirect();
    grid[4][5].setAliveDirect();
    grid[3][5].setAliveDirect();
    grid[2][5].setAliveDirect();
  }
  
  void acorn() {
    basicFill();  
    
    grid[48][58].setAliveDirect();
    grid[49][60].setAliveDirect();
    grid[50][57].setAliveDirect();
    grid[50][58].setAliveDirect();
    grid[50][61].setAliveDirect();
    grid[50][62].setAliveDirect();
    grid[50][63].setAliveDirect();
  }
  
  void display() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j].display();   
      }
    }
  }
  
  void update() {
    updateCells();
    checkCells();
  }
  
  void checkCells() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        int s = getNeighborSum(j, i);
        //println(s);
        if (s < 2) grid[i][j].setDead();
        else if ((s <= 3) && (grid[i][j].getState())) grid[i][j].setAlive();
        else if ((s == 3) && !(grid[i][j].getState())) grid[i][j].setAlive();
        else if (s > 3) grid[i][j].setDead();
      }
    }
  }
  
  int getNeighborSum(int x, int y) {
    int sum = 0;
    
    if (y > 0) sum += grid[y - 1][x].getStateBin(); //Top neighbor
     //else sum += grid[size - 1][x].getStateBin();
    if (y < size - 1) sum += grid[y + 1][x].getStateBin(); //Bottom neighbor
     //else sum += grid[0][x].getStateBin();
    if (x > 0) sum += grid[y][x - 1].getStateBin(); //Left neighbor
     //else sum += grid[y][size - 1].getStateBin();
    if (x < size - 1) sum += grid[y][x + 1].getStateBin(); //Right neighbor
     //else sum += grid[y][0].getStateBin();
    
    if ((y != 0) && (x != 0)) sum += grid[y - 1][x - 1].getStateBin(); //Upper left neighbor
     //else sum += grid[size - 1][size - 1].getStateBin();
    if ((y != 0) && (x != size - 1)) sum += grid[y - 1][x + 1].getStateBin(); //Upper right neighbor
     //else sum += grid[size - 1][0].getStateBin();
    if ((y != size - 1) && (x != 0)) sum += grid[y + 1][x - 1].getStateBin(); //Lower left neighbor
     //else sum += grid[0][size - 1].getStateBin();
    if ((y != size - 1) && (x != size - 1)) sum += grid[y + 1][x + 1].getStateBin(); //Lower right neighbor
     //else sum += grid[0][0].getStateBin();
    
    return sum;
  }
  
  void updateCells() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j].update();
      }
    }
  }
  
  void squarePattern() {
    print(grid[0][0]);
  }
}