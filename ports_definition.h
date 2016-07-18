/*
 * ports_definition.h - definition of ports pins & so on
 *
 * Copyright 2014 Edward V. Emelianov <eddy@sao.ru, edward.emelianoff@gmail.com>
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

#pragma once
#ifndef __PORTS_DEFINITION_H__
#define __PORTS_DEFINITION_H__ 


#include "stm8s.h"

// macro for using in port constructions like PORT(LED_PORT, ODR) = xx
#define CONCAT(a, b)	a ## _ ## b
#define PORT(a, b)		CONCAT(a , b)

// on-board LED
#define LED_PORT		PC
#define LED_PIN			GPIO_PIN2

#define LED_GPIO_PORT  (GPIOB)
#define LED_GPIO_PINS  (GPIO_PIN_5)

// UART2_TX
#define UART_PORT		PD
#define UART_TX_PIN		GPIO_PIN5
#define UART_RX_PIN		GPIO_PIN6

// SPI pins: SCK - PC5, MOSI - PC6, MISO - PC7
#define SPI_PORT		PC
#define SPI_SCK_PIN		GPIO_PIN5
#define SPI_MOSI_PIN	GPIO_PIN6
#define SPI_MISO_PIN	GPIO_PIN7

#define LED_GPIO_PORT  (GPIOB)
#define LED_GPIO_PINS  (GPIO_PIN_5)
#define RELAY_GPIO_PORT  (GPIOA)
#define RELAY_GPIO_PINS  (GPIO_PIN_5)
#define BUZZER_GPIO_PORT  (GPIOD)
#define BUZZER_GPIO_PINS  (GPIO_PIN_4)

#define KEY1_GPIO_PORT  (GPIOA)
#define KEY1_GPIO_PIN  (GPIO_PIN_3)
#define KEY2_GPIO_PORT  (GPIOA)
#define KEY2_GPIO_PIN  (GPIO_PIN_1)
#define KEY3_GPIO_PORT  (GPIOB)
#define KEY3_GPIO_PIN  (GPIO_PIN_4)
//#define KEY1_GPIO_PORT  (GPIOA)
//#define KEY1_GPIO_PIN  (GPIO_PIN_3)


#endif // __PORTS_DEFINITION_H__
