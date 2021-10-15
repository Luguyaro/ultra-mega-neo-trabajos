    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT code
    org 0000H
    goto configuro
    org 0020H
configuro:
    clrf TRISB	;Todo el RB salida
    clrf TRISD	;Todo el RD salida
inicio:
    movlw 0xA5	;muevo literal 0xA5 a Wreg
    movwf LATB	;muevo Wreg a LATB
    movlw 0x5A	;muevo literal 0x5A a Wreg
    movwf LATD	;muevo Wreg a LATD
    end