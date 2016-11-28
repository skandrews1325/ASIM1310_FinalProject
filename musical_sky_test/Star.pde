/*
As of right now (11/28/16), the syntax for the star function
 is taken from one of the examples found on the Processing website
 https://processing.org/examples/star.html
 however, changes have been made to the number of points on the star, 
 the star's overall size, and the rotation
*/

class Star {
  
  float r = random(188, 255); //red value
  
  Star() {
   
  }
  
  void drawStar() {
    pushMatrix();
    translate(width*0.8, height*0.5); //this deals with star's coordinates in the sketch
    rotate(frameCount / 100.0);
    star(0, 0, 3, 8, 4);
    fill(r, 253, 188);
    noStroke();
    popMatrix();

    pushMatrix();
    translate(width*0.8, height*0.5);
    rotate(frameCount / -100.0);
    star(0, 0, 3, 8, 4);
    fill(r, 253, 188, 50);
    stroke(r, 254, 209, 50);
    popMatrix();
  }

  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}