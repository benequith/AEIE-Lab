	    ORG 2000H
	    MVI B, 00H
	    LXI H, 3000H
	    MOV A,M
	    INX H
	    SUB M
	    JNC SKIP
	    INR B
SKIP:       INX H
	    MOV M,A
	    INX H
	    MOV M,B
	    HLT
	    ORG 3000H
	    DB 70H,50H,00H,00H
	    END