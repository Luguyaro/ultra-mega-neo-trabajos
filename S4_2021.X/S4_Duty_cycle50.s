    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT maincode,class=CODE,reloc=2,abs
    org 00000H
maincode:    goto configuro
    org 00020H
configuro:
    bcf TRISD,5	;RD5 salida
    movlw 0C0H
    movwf T0CON	;TMR0 On ,8bits
inicio:
    btfss INTCON, 2    ;SE DESBORDO tmr0
    goto inicio
    nop 
    nop
    btg LATD,5
    movlw 11
    movwf TMR0L
    bcf INTCON, 2	;bajamos la bander de interrupcion 
    goto inicio
    end maincode