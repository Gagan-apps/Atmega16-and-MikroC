#line 1 "C:/Users/Gagan/Desktop/UART/uart.c"

 void main()
{
 UART1_Init(9600);

 while(1)
{
 if(UART1_Data_Ready() == 1)
{
 char c=0;

 c = UART1_Read();

 UART1_Write_Text("You Typed: ");
 UART1_Write(c);
 UART1_Write(13);
}
}
}
