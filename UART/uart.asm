
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;uart.c,2 :: 		void main()
;uart.c,4 :: 		UART1_Init(9600);
	PUSH       R2
	PUSH       R3
	LDI        R27, 103
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;uart.c,6 :: 		while(1)
L_main0:
;uart.c,8 :: 		if(UART1_Data_Ready() == 1)
	CALL       _UART1_Data_Ready+0
	CPI        R16, 1
	BREQ       L__main4
	JMP        L_main2
L__main4:
;uart.c,10 :: 		char c=0;
	LDI        R27, 0
	STD        Y+0, R27
;uart.c,12 :: 		c = UART1_Read();
	CALL       _UART1_Read+0
	STD        Y+0, R16
;uart.c,14 :: 		UART1_Write_Text("You Typed: ");
	LDI        R27, #lo_addr(?lstr1_uart+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_uart+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;uart.c,15 :: 		UART1_Write(c);
	LDD        R2, Y+0
	CALL       _UART1_Write+0
;uart.c,16 :: 		UART1_Write(13);
	LDI        R27, 13
	MOV        R2, R27
	CALL       _UART1_Write+0
;uart.c,17 :: 		}
L_main2:
;uart.c,18 :: 		}
	JMP        L_main0
;uart.c,19 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
