class Grid {
  //Attributes
  Cell[][] grid;
  int size, cell_size;
  color c;
  
  //Constructor
  Grid(int size, int cell_size, String pattern, color c) {
    this.size = size;
    this.cell_size = cell_size;
    this.c = c;
    
    fillGrid(pattern);
  }
  
  //Filling the grid with cells
  void fillGrid(String pattern) {
    grid = new Cell[size][size];
    
    if (pattern == "checkerboard") checkerboardFill();
    else if (pattern == "glider") glider();
    else if (pattern == "acorn") acorn();
    else if (pattern == "glider gun") gliderGun();
    else if (pattern == "r pentomino") r_pentomino();
    else basicFill();
  }
  
  //All cells are dead
  void basicFill() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j] = new Cell(j * cell_size, i * cell_size, cell_size, false, c);
      }
    }
  }
  
  //Checkerboard seed
  void checkerboardFill() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j] = new Cell(j * cell_size, i * cell_size, cell_size,  ((i + j) % 2) == 1 ? true : false, c);
      }
    }
  }
  
  //Glider seed
  void glider() {
    basicFill();
    
    grid[3][3].setAliveDirect();
    grid[4][4].setAliveDirect();
    grid[4][5].setAliveDirect();
    grid[3][5].setAliveDirect();
    grid[2][5].setAliveDirect();
  }
  
  //Acorn seed
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
  
  //Gosper's glider gun seed
  void gliderGun() {
    basicFill();
    
    grid[5][1].setAliveDirect();
    grid[5][2].setAliveDirect();
    grid[6][1].setAliveDirect();
    grid[6][2].setAliveDirect();
    
    grid[5][11].setAliveDirect();
    grid[6][11].setAliveDirect();
    grid[7][11].setAliveDirect();
    grid[4][12].setAliveDirect();
    grid[8][12].setAliveDirect();
    grid[3][13].setAliveDirect();
    grid[3][14].setAliveDirect();
    grid[9][13].setAliveDirect();
    grid[9][14].setAliveDirect();
    grid[6][15].setAliveDirect();
    grid[4][16].setAliveDirect();
    grid[8][16].setAliveDirect();
    grid[5][17].setAliveDirect();
    grid[6][17].setAliveDirect();
    grid[7][17].setAliveDirect();
    grid[6][18].setAliveDirect();
    
    grid[3][21].setAliveDirect();
    grid[4][21].setAliveDirect();
    grid[5][21].setAliveDirect();
    grid[3][22].setAliveDirect();
    grid[4][22].setAliveDirect();
    grid[5][22].setAliveDirect();
    grid[2][23].setAliveDirect();
    grid[6][23].setAliveDirect();
    
    grid[1][25].setAliveDirect();
    grid[2][25].setAliveDirect();
    grid[6][25].setAliveDirect();
    grid[7][25].setAliveDirect();
    
    grid[3][35].setAliveDirect();
    grid[4][35].setAliveDirect();
    grid[3][36].setAliveDirect();
    grid[4][36].setAliveDirect();
  }
  
  //R-pentomino seed
  void r_pentomino() {
    basicFill();  
    
    grid[45][45].setAliveDirect();
    grid[45][46].setAliveDirect();
    grid[46][46].setAliveDirect();
    grid[44][46].setAliveDirect();
    grid[44][47].setAliveDirect();
  }
  
  //Displays the grid
  void display() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j].display();   
      }
    }
  }
  
  //Handles all update methods
  void update() {
    updateCells();
    checkCells();
  }
  
  //Sets designated status for each cell
  void checkCells() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        int s = getNeighborSum(j, i);
  
        if (s < 2) grid[i][j].setDead();
        else if ((s <= 3) && (grid[i][j].getState())) grid[i][j].setAlive();
        else if ((s == 3) && !(grid[i][j].getState())) grid[i][j].setAlive();
        else if (s > 3) grid[i][j].setDead();
      }
    }
  }
  
  //Determines the number of alive neighbors of each cell
  int getNeighborSum(int x, int y) {
    int sum = 0;
    
    if (y > 0) sum += grid[y - 1][x].getStateBin(); //Top neighbor
    if (y < size - 1) sum += grid[y + 1][x].getStateBin(); //Bottom neighbor
    if (x > 0) sum += grid[y][x - 1].getStateBin(); //Left neighbor
    if (x < size - 1) sum += grid[y][x + 1].getStateBin(); //Right neighbor
    
    if ((y != 0) && (x != 0)) sum += grid[y - 1][x - 1].getStateBin(); //Upper left neighbor
    if ((y != 0) && (x != size - 1)) sum += grid[y - 1][x + 1].getStateBin(); //Upper right neighbor
    if ((y != size - 1) && (x != 0)) sum += grid[y + 1][x - 1].getStateBin(); //Lower left neighbor
    if ((y != size - 1) && (x != size - 1)) sum += grid[y + 1][x + 1].getStateBin(); //Lower right neighbor
    
    return sum;
  }
  
  //Updates each cell in the grid
  void updateCells() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        grid[i][j].update();
      }
    }
  }
}