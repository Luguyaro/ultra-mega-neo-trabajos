    PROCESSOR 18F4550
    #include "cabecera.inc"
    PSECT rstVect,class=CODE,reloc=2,abs
    org 00500H
valores_7s: DB 0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67,0x79,0x79,0x79,0x79
    org 00000H
rstVect:    goto configuro
    org 00020H
configuro:
	movlw 80H
	movwf TRISD   ;RD0 al RD6 salidas
	clrf TBLPTRU
	movlw HIGH valores_7s
	movwf TBLPTRH
	movlw LOW valores_7s
	movwf TBLPTRL
    
inicio:
	movf PORTB,w  ;Leemos  RB y alamcenamos el contenido de Wreg
	andlw 0FH	    ;enmascaramiento  de wreg con 0FH
	movwf TBLPTRL	;Asignamos el valor de entrada a TBLPTRL
	TBLRD*		;Accion de lectura de la tabla 
	movff TABLAT,LATD	;movemos el contenide de TABLAT a LATD
	goto inicio
end rstVect