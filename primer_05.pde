// refererd from http://code.compartmental.net/minim/waves_class_waves.html

import ddf.minim.*;
import ddf.minim.ugens.*;

float freq = 220; // frequency
float amp = 1; // amplitude

Minim minim;
AudioOutput out;
Oscil tone;


void setup(){
  size( 512, 200, P2D );
  minim = new Minim(this);
  out = minim.getLineOut();
  Oscil tone = new Oscil( freq, amp, Waves.SINE );
  tone.patch( out );
}
void draw(){
  background( 0 );
  stroke( 255 );
  for( int i = 0; i < out.bufferSize() - 1; i++ ){
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    line( x1, 100 - out.mix.get(i)*50, x2, 100 - out.mix.get(i+1)*50);
  } 
}
