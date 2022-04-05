void serialEvent (Serial myPort) {// triggers when new data comes in
  String pulses_raw = myPort.readStringUntil('\n'); 
  int val = 0; 
  if(pulses_raw.charAt(0)=='x'){  // Button wurde gedrückt 
      edit_slider++; if(edit_slider>slider.length-1)edit_slider=0;
      println("bearbeite slider "+edit_slider);
  } else 
    if(pulses_raw.charAt(0)=='+'){  // Button wurde gedrückt 
      val++; 
      println("erhöhe den slider  "+edit_slider + " um 1"); 
  }
  if(pulses_raw.charAt(0)=='-'){  // Button wurde gedrückt 
      val--; 
      println("verringere den slider  "+edit_slider + " um 1"); 
  }
  // Hier werden die slider bearbeitet wie folgt : 
  if(edit_slider>-1&&edit_slider<slider.length&& val!=0)
      slider[edit_slider].value+=(float)val/100;
 
  for(int i=0;i<slider.length;i++)slider[i].self_correct();  // Auto Fehlerkorrketur : Min max darf nicht überschritten werden 
}

void mouseReleased ()
{  if(checkbox_hover) 
    { if(sin_id==0)slider[checkbox_id].sinus =!slider[checkbox_id].sinus;
      if(sin_id==1)slider[checkbox_id].sinus2=!slider[checkbox_id].sinus2; 
      checkbox_hover=false; 
    }

  


}
