		ORG 2000H
		MVI C, 0AH
		LXI H, 3000H
		LXI D, 3500H
LINK:		MOV A,M
		STAX D
		INX H
		INX D
		DCR C
		JNZ LINK
		HLT
		ORG 3000H
		DB 01H, 02H, 03H, 04H, 05H, 06H, 07H, 08H, 09H, 0AH
		END
