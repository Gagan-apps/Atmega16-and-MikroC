        sbit sw1 at  PIND0_bit;
        sbit led1 at PORTC5_bit;
        
        sbit sw1_dir at DDD0_bit;
        sbit led1_dir at DDC5_bit;
        
        void main()
{
// config the switch as an INPUT
        sw1_dir = 0;
// config the led as an OUTPUT
        led1_dir = 1;
        
        while(1)
{
        if(sw1 == 0)
{
        led1 = 1;
        delay_ms(500);
        led1 = 0;
        delay_ms(500);
}

}
}