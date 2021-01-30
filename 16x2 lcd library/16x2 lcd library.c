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
        int val=0;
        
        LCD_Init();
        
        LCD_Cmd(_LCD_CURSOR_OFF);
        
        for(val=0; val<100; val++)
{
        LCD_Chr(1,1,arr[val/1000%10]);
        LCD_Chr(1,2,arr[val/100%10]);
        LCD_Chr(1,3,arr[val/10%10]);
        LCD_Chr(1,4,arr[val%10]);
        delay_ms(300);
}
}