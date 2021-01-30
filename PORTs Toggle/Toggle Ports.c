        #define leds1 PORTB
        #define leds2 PORTA
        #define leds3 PORTC
        #define leds4 PORTD
        
        #define leds1_dir DDRB
        #define leds2_dir DDRA
        #define leds3_dir DDRC
        #define leds4_dir DDRD
        
        void main()
{
        leds1_dir = 0xFF;
        leds2_dir = 0xFF;
        leds3_dir = 0xFF;
        leds4_dir = 0xFF;
        
        while(1)
{
        leds1 = 0x00;
        leds2 = 0x00;
        leds3 = 0x00;
        leds4 = 0x00;
        delay_ms(500);
        leds1 = 0xFF;
        leds2 = 0xFF;
        leds3 = 0xFF;
        leds4 = 0xFF;
        delay_ms(500);
}
}