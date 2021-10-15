    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT multiplexacion,class=CODE,reloc=2,abs
    org 00000H
multiplexacion:    goto configuro
    org 00020H
configuro:
    movlw 080H
    movwf TRISD	; RD6-RD0 SALIDAS
    movlw 0F0H
    movwf TRISB	; RB3-RB0
    clrf LATB
inicio:
    movlw 01110110B
    movwf LATD
    bsf LATB,0
    nop
    bcf LATB,0
    movlw 00111111B
    movwf LATD
    bsf LATB,1
    nop
    bcf LATB,1
    movlw 00111000B
    movwf LATD
    bsf LATB,2
    nop
    bcf LATB,2
    movlw 01110111B
    movwf LATD
    bsf LATB,3
    nop
    bcf LATB,3
    goto inicio
    end multiplexacion