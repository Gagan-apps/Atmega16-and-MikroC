
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;16x2 lcd library.c,17 :: 		void main()
;16x2 lcd library.c,19 :: 		int val=0;
	PUSH       R2
	PUSH       R3
	PUSH       R4
;16x2 lcd library.c,21 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;16x2 lcd library.c,23 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;16x2 lcd library.c,25 :: 		for(val=0; val<100; val++)
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
L_main0:
	LDD        R18, Y+0
	LDD        R19, Y+1
	LDI        R16, 100
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__main6
	JMP        L_main1
L__main6:
;16x2 lcd library.c,27 :: 		LCD_Chr(1,1,arr[val/1000%10]);
	LDI        R20, 232
	LDI        R21, 3
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R18, #lo_addr(_arr+0)
	LDI        R19, hi_addr(_arr+0)
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	MOV        R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;16x2 lcd library.c,28 :: 		LCD_Chr(1,2,arr[val/100%10]);
	LDI        R20, 100
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R18, #lo_addr(_arr+0)
	LDI        R19, hi_addr(_arr+0)
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	MOV        R4, R16
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;16x2 lcd library.c,29 :: 		LCD_Chr(1,3,arr[val/10%10]);
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R18, #lo_addr(_arr+0)
	LDI        R19, hi_addr(_arr+0)
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	MOV        R4, R16
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;16x2 lcd library.c,30 :: 		LCD_Chr(1,4,arr[val%10]);
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R18, #lo_addr(_arr+0)
	LDI        R19, hi_addr(_arr+0)
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	MOV        R4, R16
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;16x2 lcd library.c,31 :: 		delay_ms(300);
	LDI        R18, 25
	LDI        R17, 90
	LDI        R16, 178
L_main3:
	DEC        R16
	BRNE       L_main3
	DEC        R17
	BRNE       L_main3
	DEC        R18
	BRNE       L_main3
	NOP
	NOP
;16x2 lcd library.c,25 :: 		for(val=0; val<100; val++)
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;16x2 lcd library.c,32 :: 		}
	JMP        L_main0
L_main1:
;16x2 lcd library.c,33 :: 		}
L_end_main:
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
