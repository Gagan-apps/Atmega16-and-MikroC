#line 1 "C:/Users/asus/Desktop/Atmega16 Timer0 & LED/MyProject.c"
#line 27 "C:/Users/asus/Desktop/Atmega16 Timer0 & LED/MyProject.c"
 sbit led at PORTC0_bit;
 sbit led_dir at DDC0_bit;


 sbit sw at PIND0_bit;
 sbit sw_dir at DDD0_bit;

 char startTimerBit = 0;
 int currentTime=0;

 void main(void)
{
 led_dir = 1;
 led = 0;
 sw_dir = 0;
 TCCR0 = 0x00;
 CS02_bit = 1;
 CS01_bit = 0;
 CS00_bit = 1;

 TCNT0 = 20;

 while(1)
{
 led=0;

 while(sw == 0)
{
 while(TOV0_bit == 0);
 TOV0_bit = 1;
 currentTime ++;
 TCNT0 = 20;
 if(currentTime >= 66)
{
 led = ~led;
 currentTime=0;
}
}

}
}
