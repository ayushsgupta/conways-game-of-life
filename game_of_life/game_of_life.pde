//Conway's Game of Life
//17 December 2017


//Declaring the grid variable
Grid g;

//Window size and cell size
int size = 100;
int cell_size = 10;

//Inter-generation delay
int gdel = 40;

//Cell colors
color black = color(0, 0, 0);
color navy_blue = color(0, 53, 140);
color red_orange = color(255, 77, 0);
color royal_purple = color(120, 81, 169);
color yellow_green = color(216, 255, 0);

//Setup
void setup() {
  size(1000, 1000);
  g = new Grid(size, cell_size, "checkerboard", black);
}

//Draw
void draw() {
  g.update();
  delay(gdel);
  g.display();
}