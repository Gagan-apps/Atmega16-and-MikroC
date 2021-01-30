        sbit LCD_RS at PORTC0_bit;
        sbit LCD_EN at PORTC1_bit;
        sbit LCD_D4 at PORTC2_bit;
        sbit LCD_D5 at PORTC3_bit;
        sbit LCD_D6 at PORTC4_bit;
        sbit LCD_D7 at PORTC5_bit;

        sbit LCD_RS_Direction at DDC0_bit;
        sbit LCD_EN_Direction at DDC1_bit;
        sbit LCD_D4_Direction at DDC2_bit;
        sbit LCD_D5_Direction at DDC3_bit;
        sbit LCD_D6_Direction at DDC4_bit;
        sbit LCD_D7_Direction at DDC5_bit;

        char arr[11] = "0123456789";

        void main()
{
        LCD_Init();
        ADC_Init();
        
        LCD_Cmd(_LCD_CLEAR);
        LCD_Cmd(_LCD_CURSOR_OFF);
        LCD_Out(1,1,"Temperature");
        
        while(1)
{
        int res = 0;
        
        res = ADC_Read(0);
        
        res = res * 4.88;
        
        LCD_Chr(2,1,arr[res/1000%10]);
        LCD_Chr(2,2,arr[res/100%10]);
        LCD_Chr(2,3,arr[res/10%10]);
        LCD_chr(2,4,'.');
        LCD_Chr(2,5,arr[res%10]);
        
        LCD_Out(2,7,"Centi.");
}
        
}