/*
Sarah Andrews
Final Project: Musical sky
*/

Star[] stars = new Star[2];

void setup() {
  size(1000,650);
}

void draw() {
  background(23, 16, 93); //temporary bcolor; will change later after getting the stars to work
  
  //moon
  //note: when I get the stars working, need to put boundries around the moon area; No stars should touch the moon
  ellipse (800, 80, 70, 70);
  fill(255, 254, 242);
}

void keyPressed() {
 // add code for the star class
}