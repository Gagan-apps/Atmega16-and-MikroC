
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Toggle Ports.c,11 :: 		void main()
;Toggle Ports.c,13 :: 		leds1_dir = 0xFF;
	LDI        R27, 255
	OUT        DDRB+0, R27
;Toggle Ports.c,14 :: 		leds2_dir = 0xFF;
	LDI        R27, 255
	OUT        DDRA+0, R27
;Toggle Ports.c,15 :: 		leds3_dir = 0xFF;
	LDI        R27, 255
	OUT        DDRC+0, R27
;Toggle Ports.c,16 :: 		leds4_dir = 0xFF;
	LDI        R27, 255
	OUT        DDRD+0, R27
;Toggle Ports.c,18 :: 		while(1)
L_main0:
;Toggle Ports.c,20 :: 		leds1 = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;Toggle Ports.c,21 :: 		leds2 = 0x00;
	LDI        R27, 0
	OUT        PORTA+0, R27
;Toggle Ports.c,22 :: 		leds3 = 0x00;
	LDI        R27, 0
	OUT        PORTC+0, R27
;Toggle Ports.c,23 :: 		leds4 = 0x00;
	LDI        R27, 0
	OUT        PORTD+0, R27
;Toggle Ports.c,24 :: 		delay_ms(500);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
	DEC        R18
	BRNE       L_main2
;Toggle Ports.c,25 :: 		leds1 = 0xFF;
	LDI        R27, 255
	OUT        PORTB+0, R27
;Toggle Ports.c,26 :: 		leds2 = 0xFF;
	LDI        R27, 255
	OUT        PORTA+0, R27
;Toggle Ports.c,27 :: 		leds3 = 0xFF;
	LDI        R27, 255
	OUT        PORTC+0, R27
;Toggle Ports.c,28 :: 		leds4 = 0xFF;
	LDI        R27, 255
	OUT        PORTD+0, R27
;Toggle Ports.c,29 :: 		delay_ms(500);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main4:
	DEC        R16
	BRNE       L_main4
	DEC        R17
	BRNE       L_main4
	DEC        R18
	BRNE       L_main4
;Toggle Ports.c,30 :: 		}
	JMP        L_main0
;Toggle Ports.c,31 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
