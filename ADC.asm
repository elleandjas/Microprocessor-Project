#include p18f87k22.inc
;
;    global  ADC_Setup, ADC_Read
;    
;ADC    code
;    
;ADC_Setup
;    bsf	    TRISA,RA0	    ; use pin A0(==AN0) for input
;    bsf	    ANCON0,ANSEL0   ; set A0 to analog
;    movlw   0x01	    ; select AN0 for measurement
;    movwf   ADCON0	    ; and turn ADC on
;    movlw   0x30	    ; Select 4.096V positive reference
;    movwf   ADCON1	    ; 0V for -ve reference and -ve input
;    movlw   0xF6	    ; Right justified output
;    movwf   ADCON2	    ; Fosc/64 clock and acquisition times
;    return
;
;ADC_Read
;    bsf	    ADCON0,GO	    ; Start conversion
;    
;adc_loop
;    btfsc   ADCON0,GO	    ; check to see if finished
;    bra	    adc_loop
;    return
;multiply routine 
   
   acs0    udata_acs   ; named variables in access ram
   lowprod1	    res 1
   lowprod2	    res 1	    
   highprod1	    res 1
   highprod2	    res 1
    
 
    movlw 0x12
    mulwf ADRESL, ACCESS
    movff PRODL,  lowprod1
    movff PRODH,  highprod1
    movlw 0x12 
    mulwf ADRESH, ACCESS
    movff PRODL,  lowprod2
    movff PRODH,  highprod2
    add 
    
    
    
    
    end