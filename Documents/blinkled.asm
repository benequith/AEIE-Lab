; BLINKING LEDS
	ORG 2000H
	MVI A,82H
	OUT 83H
	MVI A, 0FFH
LINK:	OUT 80H
	NOP
	NOP
	NOP
	NOP
	NOP ;DELAY Generation
	CMA
	JMP LINK
	HLT
	END
