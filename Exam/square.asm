ORG 00H
SJMP MAIN
MAIN: 	CLR P0.7
LOOP: 	MOV P1, #00H
	  	CALL DELAY
		MOV P1, #0FFH
		CALL DELAY
		SJMP LOOP

DELAY: MOV R0, #00FH
L1: 	DJNZ R0,L1
		RET
