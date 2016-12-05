/*
Sarah Andrews
Final Project: Musical sky
*/

PImage mountains;
PImage moon;

Star[] stars = new Star[2];

void setup() {
  size(1000,650);
  mountains = loadImage("mountains.png");
  moon = loadImage("moon.png");
}

void draw() {
  background(23, 16, 93); //temporary bcolor; will change later after getting the stars to work
  
  //moon
  //note: when I get the stars working, need to put boundries around the moon area; No stars should touch the moon
  image(moon, 750, 50);
  
  //mountains
  image(mountains, 0, 0);
}

void keyPressed() {
 // add code for the star class
}