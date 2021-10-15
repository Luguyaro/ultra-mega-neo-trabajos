    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT maincode,class=CODE,reloc=2,abs
    org 00000H
maincode:    goto configuro
    org 00008H
    goto TMR0_ISR
    org 00020H
configuro:
    bcf TRISD,5	;RD5 salida
    movlw 0C0H
    movwf T0CON	;TMR0 On ,8bits
    movlw 0A0H
    movwf INTCON	;TMR0 On ,8bits
inicio:
    nop
    goto inicio
TMR0_ISR:
    btg LATD,5
    nop
    movlw 12
    movwf TMR0L
    bcf INTCON, 2	;bajamos la bander de interrupcion 
    retfie
    end maincode

var_bucle EQU 000H
value	EQU 000H
multiplicacion:
    btfss STATUS,C