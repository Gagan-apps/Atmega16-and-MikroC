
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

;lm35.c,17 :: 		void main()
;lm35.c,19 :: 		LCD_Init();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Init+0
;lm35.c,20 :: 		ADC_Init();
	CALL       _ADC_Init+0
;lm35.c,22 :: 		LCD_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;lm35.c,23 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;lm35.c,24 :: 		LCD_Out(1,1,"Temperature");
	LDI        R27, #lo_addr(?lstr1_lm35+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr1_lm35+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;lm35.c,26 :: 		while(1)
L_main0:
;lm35.c,28 :: 		int res = 0;
;lm35.c,30 :: 		res = ADC_Read(0);
	CLR        R2
	CALL       _ADC_Read+0
;lm35.c,32 :: 		res = res * 4.88;
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDI        R20, 246
	LDI        R21, 40
	LDI        R22, 156
	LDI        R23, 64
	CALL       _float_fpmul1+0
	CALL       _float_fpint+0
	STD        Y+0, R16
	STD        Y+1, R17
;lm35.c,34 :: 		LCD_Chr(2,1,arr[res/1000%10]);
	LDI        R20, 232
	LDI        R21, 3
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;lm35.c,35 :: 		LCD_Chr(2,2,arr[res/100%10]);
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;lm35.c,36 :: 		LCD_Chr(2,3,arr[res/10%10]);
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;lm35.c,37 :: 		LCD_chr(2,4,'.');
	LDI        R27, 46
	MOV        R4, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;lm35.c,38 :: 		LCD_Chr(2,5,arr[res%10]);
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
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;lm35.c,40 :: 		LCD_Out(2,7,"Centi.");
	LDI        R27, #lo_addr(?lstr2_lm35+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr2_lm35+0)
	MOV        R5, R27
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;lm35.c,41 :: 		}
	JMP        L_main0
;lm35.c,43 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
