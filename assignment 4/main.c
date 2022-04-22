#include <avr/io.h>
#include <util/delay.h>

 
int main (void)
{
	
	
  
 
 DDRD   |= 0b00000000;



 DDRB   |= ((1 << DDB5));
 int i,x,y,z,w,a,b,output;
  while (1) {

     i = PIND;
 
	   
     w= i & 0b00000100;
     z= i & 0b00001000;
     y= i & 0b00010000;
     x= i & 0b00100000;
	output=(z&&(!w))||(y&&z)||(x&&(!y))||(x&&w);

if(output==1)
PORTB = ((1 <<  PB5));
else
PORTB = ((0 <<  PB5));

  }

  /* . */
  return 0;

}
