		ORG 00H
		SJMP MAIN
		ORG 50H
MAIN: 	CLR P0.7
		MOV A, #00H
LOOP:	MOV P1,A
		INC A
		SJMP LOOP		
		