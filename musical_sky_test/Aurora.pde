class Aurora {
  PImage aurora;
  float move;
  
  Aurora() {
    aurora = loadImage("auora3w50opacity.png");
    move = width/2;
  }
  
  void drawAurora() {
   aurora.resize(2500, 200);
   image(aurora, move, 90);
   move = move - 2;
   if(move<-2500) {
     move = width;
   }
  }
}
  