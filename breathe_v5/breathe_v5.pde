import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.svg.*;
import processing.serial.*;

setting slider[];
Serial myPort;

int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float diameter;
float angle,angle2,angle3,angle4;
StringList lib;
PFont schriftart;
int edit_slider=0;
boolean UI_on = true;
float prev_xs,prev_ys,xs,inc;
float ys = 500;

void setup() {
  
  
  textParameter();
  fullScreen(P2D, 0);
  background(0);
  colorMode(HSB, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];

  
  diameter = height - 10;
  
  println(Serial.list());// look in the window when the program runs to see which port to use
  myPort = new Serial(this, Serial.list()[0], 9600);  // for me com 26 was port 0, so I put a 0 here
  myPort.bufferUntil('\n');
  
      slider = new setting[16]; // erstelle 7 Slider die leer sind ;
      slider[0] = new setting("H", 0, 360);    // erstelle ersten sl vider mit namen ""  mit skala zwischen -5 und 5
      slider[1] = new setting("S", 0, 360);    // zweiter slider B, und min/max skala zu auslesen
      slider[2] = new setting("B", 4, 200);
      slider[2].value = 0;
      slider[3] = new setting("size", 10, 1000);
      slider[4] = new setting("corners",1 , 0); 
      slider[5] = new setting("FH",0 ,360);
      slider[6] = new setting("FS", 0, 360);
      slider[7] = new setting("FB", 0, 360);
      slider[7].value = 0;
      slider[8] = new setting("FT", 0,360);      
      slider[9] = new setting("fps",30 , 240);
      slider[10] = new setting("movement", -0.01, 0.01);
      slider[11] = new setting("amount", 1, 300);
      slider[12] = new setting("space", .01,4);
      slider[13] = new setting("rotate",-0.0000001, 0.0000001);
      slider[14] = new setting("sinus 1",-0.01, 0.01);
      slider[15] = new setting("sinus 2",-0.01, 0.01);
     // slider[16] = new setting("sinus 2",-0.01, 0.01);
       frameRate(slider[9].read_setting());

}
// slider rotation switch slider corners 8, 4 1 0 rotation, space  stroke rotation, -0.0000001 , 0.0000001 1, 20
// 
void draw() {
  
  textSize(17);
  textAlign(LEFT, CENTER);
  checkbox_hover=false;
  
  float d1 = 10 + (sin(angle/2) * diameter) + diameter/2;
  float d2 = 10 + (sin(angle2/2) * diameter/2) + diameter/2;
  int corners2 = 0;
  int i2 = 1;
  float a = 0.0;
  float inc = TWO_PI/25.0;
  float prev_x = 0, prev_y = 50, x, y;
  noStroke();
  fill(0, 360, 0, 35);
  rect(0, 0, width, height);
 
  pushMatrix();

  scale(0.5);
  translate(400+width, 100+height);

  for (int i = 0; i<width; i =i+width/int( slider[11].read_setting()  )) {
  fill(slider[5].read_setting(),slider[6].read_setting(),slider[7].read_setting(),slider[8].read_setting());
  strokeWeight(1);
  stroke((float)slider[0].read_setting()+i/10, (float)slider[1].read_setting(), (float)slider[2].read_setting());
  rotate(d1);
    
    
  // main sketch running  
  
     int corners = 0; 
     corners =int( min((slider[3].read_setting()-(float)i/32 )/2,(slider[3].read_setting()-(float)i/32 )/2)*slider[4].read_setting()  );
     
      rect(  i/slider[12].read_setting()+d2/4, d2/16,slider[3].read_setting()-(float)i/32,slider[3].read_setting()-(float)i/32, corners, corners ,corners, corners );

    // slider[3].read_setting()            ==> Werte anhand der skala einstellen
    // slider[3].value = etwas             ==> slider auf einen wert zwingen ACTUNG!!! zwischen 0 und 1
    // slider[3].max oder .min    = etwas  ==> skala verändern
   
  }
  angle4 += slider[15].read_setting();
  angle3 += slider[14].read_setting();
  angle2 += slider[10].read_setting();
  angle += slider[13].read_setting();
  
  popMatrix();
  fill(0);
  noStroke();
  rect(0,0,width,120);
  pushMatrix();
  
  stroke((float)slider[0].read_setting(), (float)slider[1].read_setting(), (float)slider[2].read_setting());
  corners2 =int( min((slider[3].read_setting()-(float)i2/32 )/2,(slider[3].read_setting()-(float)i2/32 )/2)*slider[4].read_setting()  );
  noStroke();
  rect(0,0,350,height);
  rectMode(CENTER);
  stroke(360);
  noFill();
  strokeWeight(0.5);
  
      rect(140,300,200,200);
  
  stroke((float)slider[0].read_setting()/10, (float)slider[1].read_setting(), (float)slider[2].read_setting()); 
  strokeWeight(1);
  fill(slider[5].read_setting(),slider[6].read_setting(),slider[7].read_setting(),slider[8].read_setting());
  
      rect(  slider[12].read_setting()+140, 300,slider[3].read_setting()/8,slider[3].read_setting()/8, corners2, corners2 ,corners2, corners2 );
  fill(0);
  
  noStroke();
  rectMode(CORNER);
 
 

  popMatrix();
    strokeWeight(1);

    slider (0, 40,20, 200);
    slider (1, 40,40, 200);
    slider (2, 40,60, 200);
    slider (3, 40,80, 200);
    slider (4, 40,100,200);
    slider (5, 40,120, 200);
    slider (6, 40,140, 200);
    slider (7,40,160,200);
    slider (8,40,180,200);
   // slider (9,40,height-625,200);
    slider (10,40,height-490,200);
    slider (11,40,height-470,200);
    slider (12,40,height-450,200);
    slider (13,40,height-200,200);
    slider (14,40,height-110,200);
    slider (15,40,height-20,200);
   
float current_state = angle3,current_state2 = angle4;
int laenge = 200; 
  noFill();
  stroke(360);
  ellipse(40+laenge, height-150+(sin(current_state/2) )*15,5,5);
    
beginShape(); 
    
  for(int i=0;i<laenge;i++){
    current_state-= slider[14].read_setting()*10;
     
    vertex(40+laenge-i, height-150+(sin(current_state/2) )*15);
}

endShape();

  noFill();
  stroke(360); 
  ellipse(40+laenge, height-60+(sin(current_state2/2) )*15,5,5);
    
beginShape(); 
 
  for(int i=0;i<laenge;i++){
    current_state2-= slider[15].read_setting()*10;
     
    vertex(40+laenge-i, height-60+(sin(current_state2/2) )*15);    
}

endShape();


  for(int i=0;i<slider.length;i++)slider[i].update_sin();
   if(key == 'w'){

     fill(0);
     noStroke();
     rect(0,0,350,height);
     rect(0,0,width,120);
     rectMode(CENTER);
     stroke(360);
     noFill();
     strokeWeight(0.5); 
     rect(300,height-120,200,200);
     stroke((float)slider[0].read_setting()/10, (float)slider[1].read_setting(), (float)slider[2].read_setting());
     strokeWeight(1);
     
     rect(  slider[12].read_setting()+140, height - 120,slider[3].read_setting()/8,slider[3].read_setting()/8, corners2, corners2 ,corners2, corners2 );rectMode(CORNER);
     
   }
   if(key == 'e'){
     noFill();
   }
   
  rectMode(CENTER);
  rect(140,750,200,200);
  rectMode(CORNER);
  pushMatrix(); 
  translate(140,750);
  rotate(d1*125);
  ellipse(60,60,20,20);
  popMatrix();
 // text(frameRate,190,450);
ellipse(75+d2/8,540,50,50);

textAlign(LEFT,TOP);

 text("fps = "+(int)frameRate,40,420);
 text("amount = "+(int)slider[11].read_setting(),140,420);



 textAlign(RIGHT, CENTER);
 text("breathe", width-20,35 );
 text("lukas neumeister", width-20,55 );
 text("intro: computational design", width-20,75 );
 text("prof. dominik schumacher", width-20,95 );
}
