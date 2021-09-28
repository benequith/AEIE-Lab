	ORG	0000H
        MVI	A,100
        MVI  	B,55
LOOP:	CMP B	       		;(A) – (B)		
	JNC EXIT		;if CY == 0 then EXIT
	JMP STORE
EXIT:	MOV A, B
STORE:	STA 2050H
	HLT