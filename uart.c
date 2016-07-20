/*
 * blinky.c
 *
 * Copyright 2014 Edward V. Emelianoff <eddy@sao.ru>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 */


#include "ports_definition.h"
#include "uart.h"

U8 UART_rx[UART_BUF_LEN]; // cycle buffer for received data
U8 UART_rx_start_i = 0;   // started index of received data (from which reading starts)
U8 UART_rx_cur_i = 0;     // index of current first byte in rx array (to which data will be written)


U8 U8toHEX(U8 val){
	val &= 0x0f;
	if(val < 10) val += '0';
	else val += 'a' - 10;
	return val;
}

void printUHEX(U8 val){
	uart_write("0x");
	UART_send_byte(U8toHEX(val>>4)); // MSB
	UART_send_byte(U8toHEX(val));    // LSB
}


/**
  * @brief  UART1 Configuration for interrupt communication
  * @param  None
  * @retval None
  */
void UART_Config(void)
{
  /* Deinitializes the UART1 and UART3 peripheral */
    UART1_DeInit();
    /* UART1 and UART3 configuration -------------------------------------------------*/
    /* UART1 configured as follow:
          - BaudRate = 1200 baud
          - Word Length = 8 Bits
          - One Stop Bit
          - No parity
          - Receive and transmit enabled
          - UART1 Clock disabled
     */
    /* Configure the UART1 */
    UART1_Init((uint32_t)1200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
                UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);

    /* Enable UART1 Transmit interrupt*/
//    UART1_ITConfig(UART1_IT_TXE, ENABLE);

    UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);

    /* Enable general interrupts */
    enableInterrupts();
}

