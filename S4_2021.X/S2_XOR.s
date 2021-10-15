    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT code
    org 0000H
    goto configuro
    org 0020H
configuro:
    bcf TRISD,0	;RD0 salida
inicio:
    btfsc PORTB,0 ;pregunto si es 0
    goto falso1
    btfsc PORTB,1 ;pregunto si es 0
    goto falso2
    bcf LATD,0
    goto inicio
falso1:
    btfsc PORTB,1 ;pregunto si es 0
    goto falso3
    bsf LATD,0
    goto inicio
falso2:
    bsf LATD,0
    goto inicio
falso3:
    bcf LATD,0
    goto inicio
    end


