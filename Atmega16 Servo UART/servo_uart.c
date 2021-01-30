
        sbit LCD_RS at PORTC5_bit;
        sbit LCD_EN at PORTC4_bit;
        sbit LCD_D4 at PORTC3_bit;
        sbit LCD_D5 at PORTC2_bit;
        sbit LCD_D6 at PORTC1_bit;
        sbit LCD_D7 at PORTC0_bit;

        sbit LCD_RS_Direction at DDC5_bit;
        sbit LCD_EN_Direction at DDC4_bit;
        sbit LCD_D4_Direction at DDC3_bit;
        sbit LCD_D5_Direction at DDC2_bit;
        sbit LCD_D6_Direction at DDC1_bit;
        sbit LCD_D7_Direction at DDC0_bit;
        
        sbit servo at PORTB3_bit;
        sbit servo_Direction at DDB3_bit;

        char uartResponse[5] = {0};
        char angleString[4] = {0};

        int flag_data_received;

        long delayHigh=0, delayLow =0;

        long map(long x, long in_min, long in_max, long out_min, long out_max) 
        {
          return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
        }
        
        void updateLCD()
        {
          LCD_Cmd(_LCD_CLEAR);
          sprintf(angleString, "%u", atoi(uartResponse));
          LCD_Out(1,1, "ServoAngleSet to");
          LCD_Out(2,1, angleString);
        }

        void myDelayUs(long delay)
        {
          long i = 0;
          for(i=0; i<delay; i+=5)
          {
            Delay_us(5);
          }
        }
        void main()
{
        unsigned int i;
        servo_Direction = 1;
        flag_data_received = 0;

        LCD_Init();
        
        UART1_Init(9600);

        LCD_Cmd(_LCD_CURSOR_OFF);
        LCD_Cmd(_LCD_CLEAR);

        updateLCD();
        while(1)
        {
         //expected response: "120#"
         if(UART1_Data_Ready() > 0)
         {
           UART1_Read_Text(uartResponse, "#", 4);
           flag_data_received = 1;
         }
         if(flag_data_received == 1)
         {
           if((atoi(uartResponse) >= 0) && (atoi(uartResponse) <= 180))
           {
             delayHigh = map(atoi(uartResponse), 0, 180, 840, 1683);
             delayLow = 20000 - delayHigh;
             updateLCD();
             UART1_Write_Text("\n\rServo Angle Set To: ");
             UART1_Write_Text(uartResponse);
             UART1_Write_Text(" Degrees\n\r");
             servo = 1;
             myDelayUs(delayHigh);
             servo = 0;
             myDelayUs(delayLow);
           }
           else
           {
            UART1_Write_Text("\r\nInvalid Sevro Angle Value\r\n");
           }
           flag_data_received = 0;
         }
        }
}
