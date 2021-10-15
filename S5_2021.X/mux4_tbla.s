    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT multiplexacion,class=CODE,reloc=2,abs
    org 00300H
mensaje: db 76H, 3FH, 38H, 77H
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
inicio:
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
    end multiplexacion