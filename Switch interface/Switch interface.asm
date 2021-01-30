
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Switch interface.c,7 :: 		void main()
;Switch interface.c,10 :: 		sw1_dir = 0;
	IN         R27, DDD0_bit+0
	CBR        R27, 1
	OUT        DDD0_bit+0, R27
;Switch interface.c,12 :: 		led1_dir = 1;
	IN         R27, DDC5_bit+0
	SBR        R27, 32
	OUT        DDC5_bit+0, R27
;Switch interface.c,14 :: 		while(1)
L_main0:
;Switch interface.c,16 :: 		if(sw1 == 0)
	IN         R27, PIND0_bit+0
	SBRC       R27, 0
	JMP        L_main2
;Switch interface.c,18 :: 		led1 = 1;
	IN         R27, PORTC5_bit+0
	SBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Switch interface.c,19 :: 		delay_ms(500);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main3:
	DEC        R16
	BRNE       L_main3
	DEC        R17
	BRNE       L_main3
	DEC        R18
	BRNE       L_main3
;Switch interface.c,20 :: 		led1 = 0;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Switch interface.c,21 :: 		delay_ms(500);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
	DEC        R18
	BRNE       L_main5
;Switch interface.c,22 :: 		}
L_main2:
;Switch interface.c,24 :: 		}
	JMP        L_main0
;Switch interface.c,25 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
