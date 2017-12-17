Grid g;

int size = 100;
int cell_size = 10;

color black = color(0, 0, 0);
color navy_blue = color(0, 53, 140);
color red_orange = color(255, 77, 0);
color royal_purple = color(120, 81, 169);
color yellow_green = color(216, 255, 0);

void setup() {
  size(1000, 1000);
  g = new Grid(size, cell_size, "checkerboard", black);
  //g.squarePattern(2, 2);
}

void draw() {
  g.update();
  delay(50);
  g.display();
}