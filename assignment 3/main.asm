
  
.include "m328Pdef.inc"

Start:
	ldi r17, 0b11000011 ; identifying input pins 10,11,12,13
	out DDRD,r17		; declaring pins as input
	ldi r17, 0b11111111 ;
	out PORTD,r17		; activating internal pullup for pins 10,11,12,13  
	in r17,PIND
	
	ldi r20,0b00000010
	rcall loopr
	;21,22,23 and 24 are the inputs
	
	ldi r21,0b00000001
	and r21,r17 ;w
	lsr r17
	ldi r22,0b00000001
	and r22,r17 ;z
	lsr r17
	ldi r23,0b00000001
	and r23,r17 ;y
	lsr r17
	ldi r24,0b00000001
	and r24,r17 ;x

	ldi r25,0b00000001
	
    ldi r26,0b00000001 
	ldi r27,0b00000001 
    ldi r28,0b00000001 
	ldi r29,0b00000001
	
	;Mov all inputs to other registers
	mov r26,r21 ; w
    mov r27,r22 ; z
    mov r28,r23 ; y
    mov r29,r24 ; x
    
    ;Compliment all the inputs   
    eor r21, r25 ; w'
    eor r22, r25 ; z'
    eor r23, r25 ; y'
    eor r24, r25 ; x'
    
    ;First implicant : im1 =zw'
    ;store first implicant in x' as we are not using it further
    
    and r21,r27
    
         
    ;Second implicant : im2 = yz
    ;store second implicant in w as we are not using it further
    
    and r27,r28
    
    
    ;Third implicant : im3 = xy'
    ;store third implicant in w' as we are not using it further
    and r23,r29
    

    ;Fourther implicant : im4 = xw
    ;store fourth implicant in x as we are not using it further
    and r29,r26
    
    
    ;Final implicant
    or r21,r27 ; im1+im2
    or r21,r23 ; im1+im2+im3
    or r21,r29 ; im1+im2+im3+im4
    mov r24,r21    
    
   

	ldi r20,0b00000101
	rcall loopl

	ldi r16, 0b00100000 ;identifying output pins 2,3,4,5
	out DDRB,r16		;declaring pins as output
	out PORTB,r24		;writing output to pins 2,3,4,5
	

	rjmp Start

loopr:	lsr r17
	dec r20
	brne loopr
	ret

loopl:	lsl r24
	dec r20
	brne loopl
	ret
