        sbit load1 at PORTC0_bit;
        
        sbit load1_dir at DDC0_bit;
        
        void main()
{
// pin as an output
        load1_dir = 1;
        
        while(1)
{
        load1 = 1;
        delay_ms(1000);
        load1 = 0;
        delay_ms(1000);
}
        
}