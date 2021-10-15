    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT multiplexacion,class=CODE,reloc=2,abs
cuenta EQU 0000H    

    org 00008H
vector_hp: goto TMR0_ISR 
    org 00300H
mensaje: db 00H,00H, 00H, 00H, 38H, 3EH, 06H, 6DH, 00H,7DH,3EH,6DH,07H,77H,3EH,3FH,00H,00H, 00H, 00H
    org 00000H
multiplexacion:    goto configuro
    org 00020H
configuro:
    movlw 080H
    movwf TRISD	; RD6-RD0 SALIDAS
    movlw 0F0H
    movwf TRISB	; RB3-RB0
    clrf LATB
    movlw HIGH mensaje
    movwf TBLPTRH
    movlw LOW mensaje
    movwf TBLPTRL
    movlw 81H
    movwf T0CON	;Conf TMR0 : FOSC/4 16bit PSCC 1:4 
    movlw 0A0H	;
    movwf INTCON; Conf Desborde de tmr0
    clrf cuenta
inicio:
    movf cuenta,0
    addwf TBLPTRL
    TBLRD*+
    movff TABLAT, LATD
    bsf LATB,0
    nop
    bcf LATB,0
    TBLRD*+
    movff TABLAT, LATD
    bsf LATB,1
    nop
    bcf LATB,1
    TBLRD*+
    movff TABLAT, LATD
    bsf LATB,2
    nop
    bcf LATB,2
    TBLRD*+
    movff TABLAT, LATD
    bsf LATB,3
    nop
    bcf LATB,3
    clrf TBLPTRL
    goto inicio
TMR0_ISR:
    movlw 16
    cpfseq cuenta
    goto incremento
    clrf cuenta 
    goto otro
incremento: incf cuenta,1
otro:
    movlw 0BH
    movwf TMR0H
    movlw  0DCH
    movwf TMR0L
    bcf INTCON ,2
    retfie
    end multiplexacion