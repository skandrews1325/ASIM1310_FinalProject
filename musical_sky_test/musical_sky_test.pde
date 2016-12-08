/*
Sarah Andrews
 Final Project: Musical sky
 */

PImage mountains;
PImage moon;

PImage cloud1;
PImage cloud2;
float move1; //for cloud1
float move2; //for cloud2

PImage sign1; //sign with black text
PImage sign2; //sign with cyan-ish text

//Star[] stars = new Star[2];
ArrayList<Star> stars = new ArrayList<Star>();

void setup() {
  size(1000, 650);
  mountains = loadImage("mountains.png");
  moon = loadImage("moon.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");

  move1 = width/2;
  move2 = move1;
  
  sign1 = loadImage("signpost1.png");
  sign2 = loadImage("signpost2.png");
}

void draw() {
  background(23, 16, 93); //temporary bcolor; will change later after getting the stars to work
  //moon
  //note: when I get the stars working, need to put boundries around the moon area; No stars should touch the moon
  image(moon, 750, 50);
  //mountains
  image(mountains, 0, 0);
  
  movingClouds();
  
  lightUpSign();

  for (int i = 0; i < stars.size(); i++) {
    stars.get(i).drawStar();
  }
}

void movingClouds() {
  image(cloud1, move1, 400);
  move1 = move1 -0.5;
  if(move1 < -765){
    move1 = width;
  }
  
  image(cloud2, move2, 300);
  move2 = move2 -1;
  if(move2 < -569) {
    move2 = width;
  }
}

void lightUpSign() {
  float x = 319;
  float y = 256;
  float lightUp = sqrt(pow(mouseX - x,2) + pow(mouseY - y,2)); //NEEDS FIXING
  if(lightUp > sign1.width && lightUp > sign1.height) {
   image (sign2, 0, 394);
  } else {
   image (sign1, 0, 394); 
  }
}


void keyPressed() {
  // add code for the star class
  boolean appear = true;
  if (appear) {
    for (int i = 0; i < 1; i++) {
      stars.add(new Star());
    }
  }
}