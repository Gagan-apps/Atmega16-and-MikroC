
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MyProject.c,37 :: 		void main(void)
;MyProject.c,39 :: 		led_dir = 1;// output pin
	IN         R27, DDC0_bit+0
	SBR        R27, 1
	OUT        DDC0_bit+0, R27
;MyProject.c,40 :: 		led = 0;    // initially LED off
	IN         R27, PORTC0_bit+0
	CBR        R27, 1
	OUT        PORTC0_bit+0, R27
;MyProject.c,41 :: 		sw_dir = 0; //input pin
	IN         R27, DDD0_bit+0
	CBR        R27, 1
	OUT        DDD0_bit+0, R27
;MyProject.c,42 :: 		TCCR0 = 0x00;
	LDI        R27, 0
	OUT        TCCR0+0, R27
;MyProject.c,43 :: 		CS02_bit = 1; // 1024 prescaler
	IN         R27, CS02_bit+0
	SBR        R27, 4
	OUT        CS02_bit+0, R27
;MyProject.c,44 :: 		CS01_bit = 0;
	IN         R27, CS01_bit+0
	CBR        R27, 2
	OUT        CS01_bit+0, R27
;MyProject.c,45 :: 		CS00_bit = 1;
	IN         R27, CS00_bit+0
	SBR        R27, 1
	OUT        CS00_bit+0, R27
;MyProject.c,47 :: 		TCNT0 = 20;
	LDI        R27, 20
	OUT        TCNT0+0, R27
;MyProject.c,49 :: 		while(1)
L_main0:
;MyProject.c,51 :: 		led=0;
	IN         R27, PORTC0_bit+0
	CBR        R27, 1
	OUT        PORTC0_bit+0, R27
;MyProject.c,53 :: 		while(sw == 0)
L_main2:
	IN         R27, PIND0_bit+0
	SBRC       R27, 0
	JMP        L_main3
;MyProject.c,55 :: 		while(TOV0_bit == 0);
L_main4:
	IN         R27, TOV0_bit+0
	SBRC       R27, 0
	JMP        L_main5
	JMP        L_main4
L_main5:
;MyProject.c,56 :: 		TOV0_bit = 1;
	IN         R27, TOV0_bit+0
	SBR        R27, 1
	OUT        TOV0_bit+0, R27
;MyProject.c,57 :: 		currentTime ++;
	LDS        R16, _currentTime+0
	LDS        R17, _currentTime+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _currentTime+0, R18
	STS        _currentTime+1, R19
;MyProject.c,58 :: 		TCNT0 = 20;
	LDI        R27, 20
	OUT        TCNT0+0, R27
;MyProject.c,59 :: 		if(currentTime >= 66)
	LDI        R16, 66
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__main8
	JMP        L_main6
L__main8:
;MyProject.c,61 :: 		led = ~led;
	IN         R0, PORTC0_bit+0
	LDI        R27, 1
	EOR        R0, R27
	OUT        PORTC0_bit+0, R0
;MyProject.c,62 :: 		currentTime=0;
	LDI        R27, 0
	STS        _currentTime+0, R27
	STS        _currentTime+1, R27
;MyProject.c,63 :: 		}
L_main6:
;MyProject.c,64 :: 		}
	JMP        L_main2
L_main3:
;MyProject.c,66 :: 		}
	JMP        L_main0
;MyProject.c,67 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
