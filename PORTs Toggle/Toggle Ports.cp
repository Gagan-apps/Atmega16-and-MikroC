#line 1 "C:/Users/Gagan/Desktop/PORTs Toggle/Toggle Ports.c"










 void main()
{
  DDRB  = 0xFF;
  DDRA  = 0xFF;
  DDRC  = 0xFF;
  DDRD  = 0xFF;

 while(1)
{
  PORTB  = 0x00;
  PORTA  = 0x00;
  PORTC  = 0x00;
  PORTD  = 0x00;
 delay_ms(500);
  PORTB  = 0xFF;
  PORTA  = 0xFF;
  PORTC  = 0xFF;
  PORTD  = 0xFF;
 delay_ms(500);
}
}
