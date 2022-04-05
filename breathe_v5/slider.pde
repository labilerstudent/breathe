


void slider (int Slider_ID, int x, int y, int w) 
{ 
  
  fill(0);noStroke();rect(x-6,y-6,x+w+6+textWidth(slider[Slider_ID].name),12);  // resetBackground 
  stroke(255); line(x,y,x+w,y);                // show Line
  if(edit_slider==Slider_ID)fill(128);else fill(0);
  ellipse(x+map(slider[Slider_ID].value,0,1,0,w),y,10,10); noFill();
  fill(360);text(slider[Slider_ID].name,x+w+10,y);
  
  if(dist(mouseX,mouseY,x+map(slider[Slider_ID].value,0,1,0,w),y)<10&&mousePressed)
     { slider[Slider_ID].value=min(max(map(mouseX,x,x+w,0,1),0),1); 
       edit_slider=Slider_ID;
     }
    else slider[Slider_ID].value= slider[Slider_ID].value; 
  check_box ( x-24 ,y,slider[Slider_ID].sinus  ,Slider_ID, 0 );
  check_box ( x-10 ,y,slider[Slider_ID].sinus2 ,Slider_ID, 1 );
}
Boolean checkbox_hover = false; 
int checkbox_id=0, sin_id=0;

void check_box ( int px, int py, boolean on, int id , int sid)
{ noFill(); stroke(360,0,360); 
  rect(px-5,py-5,9,9);
  if(mouseX>px-4&&mouseY>py-4&&mouseX<px+4&&mouseY<py+4)
        { fill(180,0,180); noStroke();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
          rect(px-3,py-3,6,6);
            checkbox_hover=true; 
            checkbox_id=id;
            sin_id=sid;
        }
  
  
  if(on){ noStroke(); fill(360,0,360); 
         rect(px-3,py-3,6,6);
  }
}

class setting 
{ boolean sinus=false,sinus2=false; 
  String name ="";               // name vom slider 
  float min = 0, max = 1;        // Standartwerte : hiert werden die maximalen skala werte gespeichert 
  float value =.5;               // value vom slider : zwischen 0 und 1 : 
  setting (String n, float mn, float mx ) 
    { this.name=n; 
      this.min=mn;
      this.max=mx;
    }
  void self_correct ()
  { this.value=min(this.value,1);          
    this.value=max(this.value,0);
  }
  float read_setting ()
  {  return map(this.value,0,1,this.min,this.max);        // auslesen der eigientlichen werte die auf die skala gemappt sind
  }
  void update_sin () 
  { if(this.sinus)this.value=(this.value*9+(sin( angle3/2 )+1)/2 )/10;  
    if(this.sinus2)this.value=(this.value*9+(sin( angle4/2 )+1)/2 )/10;       // Hier kommt 2 sinus variable hun
    //if(this.sinus)this.value=(sin( angle3/2 )+1)/2 ;  
    //if(this.sinus2)this.value=(sin( angle4/2 )+1)/2 ;       // Hier kommt 2 sinus variable hun
    
  }
   
}
