/*
Sarah Andrews
ASIM 1310 Final Project: Musical sky
 */

MidiHandler mh = new MidiHandler();
int lastPitch = 0;
String starKeys = "abcdefghijklmnopqrstuvwxyz"; // keys that trigger stars to appear
String auroraKeys = "123456789"; //keys that trigger auroras to appear

PImage night_sky;
PImage mountains;
PImage moon;

PImage cloud1;
PImage cloud2;
float move1; //for cloud1
float move2; //for cloud2

PImage sign1; //sign with black text
PImage sign2; //sign with cyan-ish text

ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Aurora> auroras = new ArrayList<Aurora>();

void setup() {
  size(1000, 650);
  mh.initialize();
  night_sky = loadImage("nightskybackground.jpg");
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
  background(night_sky);

  //stars
  for (int i = 0; i < stars.size(); i++) {
    stars.get(i).drawStar();
  }

  //moon
  image(moon, 750, 50);
  //mountains
  image(mountains, 0, 0);

  //auroras
  for (int j = 0; j < auroras.size(); j++) {
    auroras.get(j).drawAurora();
  }

  movingClouds();

  lightUpSign();
}

void movingClouds() {
  image(cloud1, move1, 400);
  move1 = move1 -0.5;
  if (move1 < -765) {
    move1 = width;
  }

  image(cloud2, move2, 300);
  move2 = move2 -1;
  if (move2 < -569) {
    move2 = width;
  }
}

void lightUpSign() {
  if (mouseX < (width - (sign1.width * 2)) && mouseY> (height - sign1.height)) {
    image (sign2, 0, 394);
  } else {
    image (sign1, 0, 394);
  }
}


void keyPressed() {
  boolean star_appear = true;
  if (star_appear && isStarKey()) {
    for (int i = 0; i < 1; i++) {
      stars.add(new Star());
      playNote();
    }
  }

  boolean aurora_appear = true;
  if (aurora_appear && isAuroraKey()) {
    for (int j = 0; j < 1; j++) {
      auroras.add(new Aurora());
    }
  }
  if (key == BACKSPACE) {
    for (int j = 0; j < 1; j++) {
      auroras.remove(j);
    }
  }
}

void playNote() {
  char space = ' ';
  if (key == space) {
    mh.noteOff(lastPitch);
  } else if (isStarKey()) {
    randomPitch();
  }
}

void randomPitch() {
  int pitch = round(random(60, 100));
  mh.noteOff(lastPitch);
  mh.noteOn(pitch);
  lastPitch = pitch;
}


boolean isStarKey() {
  boolean retVal = false;
  for (int i=0; i<starKeys.length(); i++) {
    if (key == starKeys.charAt(i)) {
      retVal = true;
    }
  }
  return retVal;
}

boolean isAuroraKey() {
  boolean retVal = false;
  for (int j=0; j<auroraKeys.length(); j++) {
    if (key == auroraKeys.charAt(j)) {
      retVal = true;
    }
  }
  return retVal;
}