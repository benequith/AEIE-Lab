	ORG 2000H
L1:	LXI H,2500H
	MOV A,M
	OUT 80H
	INX H
	MOV A,M
	OUT 81H
	INX H
	MOV A,M
	OUT 82H
	JMP L1
	HLT
	ORG 2500H
	DB 39H,6DH,79H
	END
	