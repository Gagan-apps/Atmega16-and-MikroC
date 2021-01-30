
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;relay.c,5 :: 		void main()
;relay.c,8 :: 		load1_dir = 1;
	IN         R27, DDC0_bit+0
	SBR        R27, 1
	OUT        DDC0_bit+0, R27
;relay.c,10 :: 		while(1)
L_main0:
;relay.c,12 :: 		load1 = 1;
	IN         R27, PORTC0_bit+0
	SBR        R27, 1
	OUT        PORTC0_bit+0, R27
;relay.c,13 :: 		delay_ms(1000);
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
	DEC        R18
	BRNE       L_main2
	NOP
	NOP
	NOP
	NOP
;relay.c,14 :: 		load1 = 0;
	IN         R27, PORTC0_bit+0
	CBR        R27, 1
	OUT        PORTC0_bit+0, R27
;relay.c,15 :: 		delay_ms(1000);
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L_main4:
	DEC        R16
	BRNE       L_main4
	DEC        R17
	BRNE       L_main4
	DEC        R18
	BRNE       L_main4
	NOP
	NOP
	NOP
	NOP
;relay.c,16 :: 		}
	JMP        L_main0
;relay.c,18 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
