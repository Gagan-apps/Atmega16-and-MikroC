/*
        Program By: Gagan -- Life & Learnings Tutorials
        Use Timer0 8-bit to generate timing

        MCU     ATMEGA16A
        FCPU        16MHz
        LFUSE        CE
        HFUSE        D9

        TCNT0 = Timer/Counter 0 value register (8bit)
        TIMSK = Timer Interrupt Mask Register (page 82)
        TIFR = Timer Interrupt Flag Register
        TCCR0 = Timer Counter Control Register 0 (Page 79)

        At 16MHz--- Machine Cycle = 0.0625 uSec
        at prescaler 1:1 = Max delay = 0.0625*255 = 15.93 uSec
        at Prescaler 1:8 = Max delay = 0.5*255 = 127.5 uSec

        To create 100uS delay TCNT0 = 255-200 = 55

        100uS*10  = 1mS
        100uS*100 = 10mS
        100uS*1000= 100mS
*/

//*** LED pins
      sbit led at PORTC0_bit;
      sbit led_dir at DDC0_bit;

//***Switch pins
      sbit sw at PIND0_bit;
      sbit sw_dir at DDD0_bit;

      char startTimerBit = 0;
      int currentTime=0;
      
      void main(void)
{
      led_dir = 1;// output pin
      led = 0;    // initially LED off
      sw_dir = 0; //input pin
      TCCR0 = 0x00;
      CS02_bit = 1; // 1024 prescaler
      CS01_bit = 0;
      CS00_bit = 1;
//***for creating 15mS delay at 1024 prescaler, 255-235
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