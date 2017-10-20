float len = 350;
float angle = PI / 4;
float offX = 0;

void setup(){
  fullScreen();
  frameRate(24);
  background(0);
  colorMode(HSB);
}

void draw(){
  //background(0);
  
  translate(width / 2, height);
  
  angle = map(mouseX, 0 , width, 0, PI / 4);
  branch(len, angle);
  //saveFrame("FractalImpression10-#####"); 
  if(keyPressed == true){
   if(key == ' '){
    background(0); 
   }
  }
}

void branch(float l, float a){
    
   stroke(map(l, 0, 350, 40, 170), 150, map(l, 0, 350, 150, 250), map(l, 0, 250, 2, 85));
    line(0,0,0, -l);
    translate(0, -l);
    
    l *= map(noise(offX), 0, 1.0, 0.55, 0.80);
    a = map(noise(offX),0, 1.0, -PI, PI);
    
    if(l > 5){
    pushMatrix();
    rotate(a);
    branch(l, a);
    popMatrix();
    
    pushMatrix();
    rotate(-a);
    branch(l, a);
    popMatrix();
    offX += map(noise(offX), 0.0, 1.0, 0.0000001, 0.00001);
  }
 }
 
 void keyPressed(){
  if(key == ' '){
  }
 }