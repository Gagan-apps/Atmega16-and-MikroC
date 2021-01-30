
_map:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;servo_uart.c,26 :: 		long map(long x, long in_min, long in_max, long out_min, long out_max)
; in_max start address is: 10 (R10)
	LDD        R10, Y+0
	LDD        R11, Y+1
	LDD        R12, Y+2
	LDD        R13, Y+3
	LDD        R16, Y+4
	LDD        R17, Y+5
	LDD        R18, Y+6
	LDD        R19, Y+7
	STD        Y+4, R16
	STD        Y+5, R17
	STD        Y+6, R18
	STD        Y+7, R19
	LDD        R16, Y+8
	LDD        R17, Y+9
	LDD        R18, Y+10
	LDD        R19, Y+11
	STD        Y+8, R16
	STD        Y+9, R17
	STD        Y+10, R18
	STD        Y+11, R19
;servo_uart.c,28 :: 		return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
	MOVW       R20, R2
	MOVW       R22, R4
	SUB        R20, R6
	SBC        R21, R7
	SBC        R22, R8
	SBC        R23, R9
	LDD        R0, Y+4
	LDD        R1, Y+5
	LDD        R16, Y+8
	LDD        R17, Y+9
	SUB        R16, R0
	SBC        R17, R1
	LDD        R0, Y+6
	LDD        R1, Y+7
	LDD        R18, Y+10
	LDD        R19, Y+11
	SBC        R18, R0
	SBC        R19, R1
	CALL       _HWMul_32x32+0
	MOVW       R20, R10
	MOVW       R22, R12
	SUB        R20, R6
	SBC        R21, R7
	SBC        R22, R8
	SBC        R23, R9
; in_max end address is: 10 (R10)
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDD        R20, Y+4
	LDD        R21, Y+5
	LDD        R22, Y+6
	LDD        R23, Y+7
	ADD        R16, R20
	ADC        R17, R21
	ADC        R18, R22
	ADC        R19, R23
;servo_uart.c,29 :: 		}
L_end_map:
	POP        R29
	POP        R28
	RET
; end of _map

_updateLCD:

;servo_uart.c,31 :: 		void updateLCD()
;servo_uart.c,33 :: 		LCD_Cmd(_LCD_CLEAR);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;servo_uart.c,34 :: 		sprintf(angleString, "%u", atoi(uartResponse));
	LDI        R27, #lo_addr(_uartResponse+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_uartResponse+0)
	MOV        R3, R27
	CALL       _atoi+0
	PUSH       R17
	PUSH       R16
	LDI        R27, hi_addr(?lstr_1_servo_uart+0)
	PUSH       R27
	LDI        R27, #lo_addr(?lstr_1_servo_uart+0)
	PUSH       R27
	LDI        R27, hi_addr(_angleString+0)
	PUSH       R27
	LDI        R27, #lo_addr(_angleString+0)
	PUSH       R27
	CALL       _sprintf+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;servo_uart.c,35 :: 		LCD_Out(1,1, "ServoAngleSet to");
	LDI        R27, #lo_addr(?lstr2_servo_uart+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr2_servo_uart+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;servo_uart.c,36 :: 		LCD_Out(2,1, angleString);
	LDI        R27, #lo_addr(_angleString+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_angleString+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;servo_uart.c,37 :: 		}
L_end_updateLCD:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _updateLCD

_myDelayUs:

;servo_uart.c,39 :: 		void myDelayUs(long delay)
;servo_uart.c,41 :: 		long i = 0;
;servo_uart.c,42 :: 		for(i=0; i<delay; i+=5)
; i start address is: 20 (R20)
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
; i end address is: 20 (R20)
L_myDelayUs0:
; i start address is: 20 (R20)
	CP         R20, R2
	CPC        R21, R3
	CPC        R22, R4
	CPC        R23, R5
	BRLT       L__myDelayUs19
	JMP        L_myDelayUs1
L__myDelayUs19:
;servo_uart.c,44 :: 		Delay_us(5);
	LDI        R16, 26
L_myDelayUs3:
	DEC        R16
	BRNE       L_myDelayUs3
	NOP
	NOP
;servo_uart.c,42 :: 		for(i=0; i<delay; i+=5)
	MOVW       R16, R20
	MOVW       R18, R22
	SUBI       R16, 251
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	MOVW       R20, R16
	MOVW       R22, R18
;servo_uart.c,45 :: 		}
; i end address is: 20 (R20)
	JMP        L_myDelayUs0
L_myDelayUs1:
;servo_uart.c,46 :: 		}
L_end_myDelayUs:
	RET
; end of _myDelayUs

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;servo_uart.c,47 :: 		void main()
;servo_uart.c,50 :: 		servo_Direction = 1;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;servo_uart.c,51 :: 		flag_data_received = 0;
	LDI        R27, 0
	STS        _flag_data_received+0, R27
	STS        _flag_data_received+1, R27
;servo_uart.c,53 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;servo_uart.c,55 :: 		UART1_Init(9600);
	LDI        R27, 103
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;servo_uart.c,57 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;servo_uart.c,58 :: 		LCD_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;servo_uart.c,60 :: 		updateLCD();
	CALL       _updateLCD+0
;servo_uart.c,61 :: 		while(1)
L_main5:
;servo_uart.c,64 :: 		if(UART1_Data_Ready() > 0)
	CALL       _UART1_Data_Ready+0
	LDI        R17, 0
	CP         R17, R16
	BRLO       L__main21
	JMP        L_main7
L__main21:
;servo_uart.c,66 :: 		UART1_Read_Text(uartResponse, "#", 4);
	LDI        R27, 4
	MOV        R6, R27
	LDI        R27, #lo_addr(?lstr3_servo_uart+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr3_servo_uart+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_uartResponse+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_uartResponse+0)
	MOV        R3, R27
	CALL       _UART1_Read_Text+0
;servo_uart.c,67 :: 		flag_data_received = 1;
	LDI        R27, 1
	STS        _flag_data_received+0, R27
	LDI        R27, 0
	STS        _flag_data_received+1, R27
;servo_uart.c,68 :: 		}
L_main7:
;servo_uart.c,69 :: 		if(flag_data_received == 1)
	LDS        R16, _flag_data_received+0
	LDS        R17, _flag_data_received+1
	CPI        R17, 0
	BRNE       L__main22
	CPI        R16, 1
L__main22:
	BREQ       L__main23
	JMP        L_main8
L__main23:
;servo_uart.c,71 :: 		if((atoi(uartResponse) >= 0) && (atoi(uartResponse) <= 180))
	LDI        R27, #lo_addr(_uartResponse+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_uartResponse+0)
	MOV        R3, R27
	CALL       _atoi+0
	LDI        R18, 0
	LDI        R19, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__main24
	JMP        L__main15
L__main24:
	LDI        R27, #lo_addr(_uartResponse+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_uartResponse+0)
	MOV        R3, R27
	CALL       _atoi+0
	LDI        R18, 180
	LDI        R19, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__main25
	JMP        L__main14
L__main25:
L__main13:
;servo_uart.c,73 :: 		delayHigh = map(atoi(uartResponse), 0, 180, 840, 1683);
	LDI        R27, #lo_addr(_uartResponse+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_uartResponse+0)
	MOV        R3, R27
	CALL       _atoi+0
	CLR        R6
	CLR        R7
	CLR        R8
	CLR        R9
	MOVW       R2, R16
	LDI        R27, 0
	SBRC       R17, 7
	LDI        R27, 255
	MOV        R4, R27
	MOV        R5, R4
	LDI        R27, 0
	PUSH       R27
	PUSH       R27
	LDI        R27, 6
	PUSH       R27
	LDI        R27, 147
	PUSH       R27
	LDI        R27, 0
	PUSH       R27
	PUSH       R27
	LDI        R27, 3
	PUSH       R27
	LDI        R27, 72
	PUSH       R27
	LDI        R27, 0
	PUSH       R27
	PUSH       R27
	PUSH       R27
	LDI        R27, 180
	PUSH       R27
	CALL       _map+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 12
	OUT        SPL+0, R26
	OUT        SPL+1, R27
	STS        _delayHigh+0, R16
	STS        _delayHigh+1, R17
	STS        _delayHigh+2, R18
	STS        _delayHigh+3, R19
;servo_uart.c,74 :: 		delayLow = 20000 - delayHigh;
	MOVW       R0, R16
	LDI        R16, 32
	LDI        R17, 78
	SUB        R16, R0
	SBC        R17, R1
	MOVW       R0, R18
	LDI        R18, 0
	LDI        R19, 0
	SBC        R18, R0
	SBC        R19, R1
	STS        _delayLow+0, R16
	STS        _delayLow+1, R17
	STS        _delayLow+2, R18
	STS        _delayLow+3, R19
;servo_uart.c,75 :: 		updateLCD();
	CALL       _updateLCD+0
;servo_uart.c,76 :: 		UART1_Write_Text("\n\rServo Angle Set To: ");
	LDI        R27, #lo_addr(?lstr4_servo_uart+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_servo_uart+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;servo_uart.c,77 :: 		UART1_Write_Text(uartResponse);
	LDI        R27, #lo_addr(_uartResponse+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_uartResponse+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;servo_uart.c,78 :: 		UART1_Write_Text(" Degrees\n\r");
	LDI        R27, #lo_addr(?lstr5_servo_uart+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_servo_uart+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;servo_uart.c,79 :: 		servo = 1;
	IN         R27, PORTB3_bit+0
	SBR        R27, BitMask(PORTB3_bit+0)
	OUT        PORTB3_bit+0, R27
;servo_uart.c,80 :: 		myDelayUs(delayHigh);
	LDS        R2, _delayHigh+0
	LDS        R3, _delayHigh+1
	LDS        R4, _delayHigh+2
	LDS        R5, _delayHigh+3
	CALL       _myDelayUs+0
;servo_uart.c,81 :: 		servo = 0;
	IN         R27, PORTB3_bit+0
	CBR        R27, BitMask(PORTB3_bit+0)
	OUT        PORTB3_bit+0, R27
;servo_uart.c,82 :: 		myDelayUs(delayLow);
	LDS        R2, _delayLow+0
	LDS        R3, _delayLow+1
	LDS        R4, _delayLow+2
	LDS        R5, _delayLow+3
	CALL       _myDelayUs+0
;servo_uart.c,83 :: 		}
	JMP        L_main12
;servo_uart.c,71 :: 		if((atoi(uartResponse) >= 0) && (atoi(uartResponse) <= 180))
L__main15:
L__main14:
;servo_uart.c,86 :: 		UART1_Write_Text("\r\nInvalid Sevro Angle Value\r\n");
	LDI        R27, #lo_addr(?lstr6_servo_uart+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_servo_uart+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;servo_uart.c,87 :: 		}
L_main12:
;servo_uart.c,88 :: 		flag_data_received = 0;
	LDI        R27, 0
	STS        _flag_data_received+0, R27
	STS        _flag_data_received+1, R27
;servo_uart.c,89 :: 		}
L_main8:
;servo_uart.c,90 :: 		}
	JMP        L_main5
;servo_uart.c,91 :: 		}
L_end_main:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
