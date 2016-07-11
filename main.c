/**
  ******************************************************************************
  * @file    TIM1_ComplementarySignals_DeadTime_Break_Lock\main.c
  * @author  MCD Application Team
  * @version  V2.2.0
  * @date     30-September-2014
  * @brief   This file contains the main function for TIM1 Complementary Signals &
  *          DeadTime & Break & Lock.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "ports_definition.h" 

/**
  * @addtogroup TIM1_ComplementarySignals_DeadTime_Break_Lock
  * @{
  */

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/
#define CCR1_Val  ((uint16_t)32767)
#define CCR2_Val  ((uint16_t)16383)
#define CCR3_Val  ((uint16_t)8191)
#define LED_GPIO_PORT  (GPIOB)
#define LED_GPIO_PINS  (GPIO_PIN_5)
#define RELAY_GPIO_PORT  (GPIOA)
#define RELAY_GPIO_PINS  (GPIO_PIN_5)


/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
void Delay(uint16_t nCount);
static void TIM1_Config(void);
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/* Global val\riables --------------------------------------------------------*/
unsigned long Global_time = 0L; // global time in ms


/**
  * @brief Delay
  * @param nCount
  * @retval None
  */
void Delay(uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}
/**
  * @brief  Configure TIM1 to generate 3 complementary signals, to insert a 
  *         defined dead time value, to use the break feature and to lock the 
  *         desired parameters
  * @param  None
  * @retval None
  */
static void TIM1_Config(void)
{
  /* TIM1 Peripheral Configuration */ 
  TIM1_DeInit();
	
		// Configure Timer1
	// prescaler = f_{in}/f_{tim1} - 1
	// set Timer1 to 1MHz: 1/1 - 1 = 15
	TIM1_PSCRH = 0;
	TIM1_PSCRL = 15; // LSB should be written last as it updates prescaler
	// auto-reload each 1ms: TIM_ARR = 1000 = 0x03E8
	TIM1_ARRH = 0x03;
	TIM1_ARRL = 0xE8;
	// interrupts: update
	TIM1_IER = TIM_IER_UIE;
	// auto-reload + interrupt on overflow + enable
	TIM1_CR1 = TIM_CR1_APRE | TIM_CR1_URS | TIM_CR1_CEN;

  /* TIM1 counter enable */
  TIM1_Cmd(ENABLE);

}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/



/** @addtogroup STM32F0_Discovery_Peripheral_Examples
  * @{
  */

/** @addtogroup IO_Toggle
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define BSRR_VAL        0x0300


/* Private macros ------------------------------------------------------------*/

#define TEST_TKEY(NB) (MyTKeys[(NB)].p_Data->StateId == TSL_STATEID_DETECT)
void SystickDelay(__IO uint32_t nTime);
#define STATUS_ERROR   (-1)
#define STATUS_FREE    (0)
#define STATUS_WAITING (3)
#define STATUS_WORKING (1)
#define STATUS_COOLING (2)
#define START_COUNTER_TIME  3000
#define ENTER_SERVICE_DELAY 7500
#define SERVICE_NEXT_DELAY  1200
#define EXIT_SERVICE_TIME   1800
#define START_DELAY         600


/* Private variables ---------------------------------------------------------*/
static long buzz_counter = 0;
static long pitches[255];
static long durations[255];
static int start_note = 0; // Or current note
static int end_note = 0;
static char digits[3];
static __IO uint32_t TimingDelay;
static int display_data=0;
int rx_state= 0;
typedef enum states {state_show_time,state_set_time,state_show_hours,state_enter_service,state_clear_hours,state_address,
	state_pre_time,state_cool_time,state_ext_mode}states;
typedef enum rxstates {rx_state_none, rx_state_pre_time, rx_state_main_time, rx_state_cool_time, rx_state_get_checksum}rxstates;
static states state = 0;
typedef enum modes {mode_null,mode_clear_hours,mode_set_address,mode_set_pre_time,mode_set_cool_time}modes;
static modes service_mode;
volatile unsigned char controller_address = 0x10;
volatile int curr_status;
volatile int prev_status;
volatile int curr_time;
volatile int flash_mode = 0;
volatile long start_delay = 0;
volatile int minute_counter =0;
volatile int pre_time = 0, main_time = 0, cool_time = 0;
volatile int Gv_UART_Timeout = 1000; // Timeout in mSec
volatile int pre_time_sent = 0, main_time_sent = 0, cool_time_sent = 0;
//static unsigned char  main_time = 0;
static unsigned int   work_hours[3] = {9,10,30}; //HH HL MM - Hours[2], Minutes[1]
static unsigned char  preset_pre_time = 7;
static unsigned char  preset_cool_time = 3;
volatile int start_counter = 0;
volatile int counter_hours = 0;
volatile int flash_counter_prev = 0;
volatile int Gv_miliseconds = 0;
uint16_t data = 0;
int useUart=0;

// for Display:
static unsigned int led_counter = 0;
static unsigned int flash_counter = 0;
static int digit_num = 0;
typedef struct time_str{
	uint8_t used_flag :8;
	uint8_t hours_h   :8;
	uint8_t hours_l   :8;
	uint8_t minutes   :8;
}time_str;
typedef struct settings_str{
	uint8_t addresse  :8;
	uint8_t pre_time  :8;
	uint8_t cool_time :8;
	uint8_t unused    :8;
}settings_str;
typedef struct flash_struct{
	time_str time;
	settings_str settings;
}flash_struct;

static int key_states[5] = {-1,-1,-1, -1, -1};
static int last_key_states[5] = {-1,-1,-1, -1, -1};

/* Private function prototypes -----------------------------------------------*/
void push_note(int pitch, int duration);
void ProcessSensors(void);
void SystickDelay(__IO uint32_t nTime);
//void ping_status(void);
int ToBCD(int value);
void send_time(void);
void send_start(void);
void write_eeprom(void);
void read_eeprom(void);
void update_status(void);
void KeyPressed_0(void);
void KeyPressed_1(void);
void KeyPressed_2(void);
void KeyPressed_3();
void set_relay1(unsigned char state);
void set_relay2(unsigned char state);
void update_outputs(void);

/* Global variables ----------------------------------------------------------*/

__IO uint32_t Gv_SystickCounter;
static const uint32_t eeprom_array[512] __attribute__ ((section (".eeprom1text")));

/* Private functions ---------------------------------------------------------*/
void Delay(__IO uint32_t nTime)
{
  TimingDelay = nTime;

  while(TimingDelay != 0);
}

void show_digit(int digit){
	digit = digit & 0x0F;


}

int get_controller_status(int n){

	static int sts, data;
	// clear in fifo
	// send conmmand
	while(USART_GetFlagStatus(USART1,USART_FLAG_RXNE))	data =  USART_ReceiveData(USART1); // Flush input
    while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET); // wAIT UNTIL TX BUFFER IS EMPTY
	USART_SendData(USART1,0x80 | ((n & 0x0f)<<3) | 0);
//    while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET); // wAIT UNTIL TX BUFFER IS EMPTY
//    delta = (delta + 1)& 0xff;
//	USART_SendData(USART1,delta);

//	USART_SendData(USART1,0x0f);
    SystickDelay(70);

    //read Rx buffer
    sts = USART_GetFlagStatus(USART1,USART_FLAG_RXNE);
    if(sts) {
    	data =  USART_ReceiveData(USART1);
    	//			while(1);
    	return (data);
	}
	return -1;
}
// Function to get controller's address
void get_address(void){
	int i, result;
	for (i = 0; i<16; i++){
		result = get_controller_status(i);
		if (result!=-1) break;
		SystickDelay(60);
	}
	controller_address = i;
}


/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
int main(void)
{
  /*!< At this stage the microcontroller clock setting is already configured, 
       this is done through SystemInit() function which is called from startup
       file (startup_stm32f0xx.s) before to branch to application main.
       To reconfigure the default setting of SystemInit() function, refer to
       system_stm32f0xx.c file
     */
		   /* Initialize I/Os in Output Mode */
  GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);

//  while (1)
//  {
    /* Toggles LEDs */
//    GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
//    Delay(0xFFFF);
//  }

	spi_init();
	uart_init();
  /* TIM1 configuration -----------------------------------------*/
  TIM1_Config(); 

	
/*
 * commads:
 * 0 - status 0-free, 1-Working, 2-COOLING, 3-WAITING
 * 1 - start
 * 2 - set pre-time
 * 3 - set cool-time
 * 4 - stop - may be not implemented in some controllers
 * 5 - set main time
 */

	
	  push_note(F3,3);
	  push_note(E3,3);
	  push_note(C3,3);
	
	  digits[0] = 0;
	  digits[1] = 1;
	  digits[2] = 2;
	  prev_status = 0;

//	  while (1){
//		  while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) != RESET)
//			  USART_SendData(USART1,0x80 );
//	  }

	  read_eeprom();
	  if(!preset_pre_time || ! preset_cool_time){
		  preset_pre_time = 7;
		  preset_cool_time = 3;
		  controller_address = 14;
		  write_eeprom();
	  }
	  if (SysTick_Config(SystemCoreClock / (1000))){
		  		while(1); // Capture error
	  }
//	  if(controller_address == 15){
//		  display_data = 0xEAF;
//		  // Try to get controller address continuously
//		  get_address();
//		  if(controller_address != 15)write_eeprom();
//	  }

	  NVIC_SetPriority (SysTick_IRQn, 3);

	  while (1)
	  {
//		  controller_address = 14;

/*		  if(controller_address >15){
			  display_data = 0xEAF;
			  // Try to get controller address continuously
			  get_address();
		  }
		  else*/
		  {
			  key_states[0] = (key_states[0] << 1) | 	(!!(GPIOB->IDR & GPIO_IDR_13)); // Start
			  key_states[1] = (key_states[1] << 1) | 	(!!(GPIOA->IDR & GPIO_IDR_11)); // -
			  key_states[2] = (key_states[2] << 1) | 	(!!(GPIOB->IDR & GPIO_IDR_14)); // +
			  key_states[3] = (key_states[3] << 1) | 	(!!(GPIOB->IDR & GPIO_IDR_7)); // External start
			  if(controller_address == 15){
				  key_states[4] = (key_states[4] << 1) | 	(!!(GPIOA->IDR & GPIO_IDR_1)); // Coin switch
			  }
			  ProcessSensors(); // Execute sensors related tasks
			  // Scan buttons

			  //ping_status(); // Get current status
//			  display_data = state + ((curr_status&0x0f)<<4);
//			  display_data =ping_counter;
//			  state = 30;
			  switch (state){
			  case state_show_time:
			  case state_set_time:
				  if(curr_status == STATUS_FREE ){
					  flash_mode = 0;
					  state = state_set_time;
					  display_data = ToBCD(main_time);
				  } else {

					  state = state_show_time;
					  //				  time_to_set = 0;
					  display_data = ToBCD(main_time);
					  if(curr_status == STATUS_WAITING ){
						  flash_mode = 1; // DP flashing
					  } else  if(curr_status == STATUS_WORKING ){
						  flash_mode = 2; // DP cycling
					  } else  if(curr_status == STATUS_COOLING ){
						  flash_mode = 3; // All flashing
					  } else {
//						  controller_address = 16;
						  if((flash_counter/0x80)&1){
							  display_data = 0xEEE;
						  }

//						  display_data = ping_counter;
						 // flash_mode = 3; // All flashing
					  }

				  }

				  break;
			  case state_show_hours:

				  if( flash_mode != 3){
					  flash_mode = 3; // All flashing
					  flash_counter_prev = flash_counter = 0;
				  }
				  {
					  int index = (counter_hours)%4;
					  if(index<3){
						  display_data = 0xF00 | ToBCD(work_hours[index]);
					  }
					  else {
						  display_data = 0xFFF;
					  }
//					  if (TEST_TKEY(0)||TEST_TKEY(1)){
//						  display_data = 0xFF1;
//					  } else{
//						  display_data = 0xFF0;
//					  }

					  if(flash_counter_prev != (flash_counter & 0x40)){
						  if(flash_counter_prev) counter_hours++;
						  flash_counter_prev = (flash_counter & 0x40);
					  }
				  }
				  break;
			  case state_enter_service:
				  display_data = service_mode|0xAF0;
				  flash_mode = 0;
				  break;

			  case state_clear_hours:
				  flash_mode = 3;
				  display_data = 0xFFC;
				  break;
			  case state_address:
				  flash_mode = 0;
				  if((flash_counter/0x80)&1){
					  if(controller_address !=15){ // Address 15 reserved for external control
						  display_data = controller_address;
					  }
					  else {
						  display_data = 0xAAA;
					  }
				  } else {
					  display_data = 0xFFA;
				  }
				  break;
			  case state_pre_time:
				  flash_mode = 2;
				  display_data = 0x3F0 | preset_pre_time;;
				  break;
			  case state_cool_time:
				  flash_mode = 2;
				  display_data = 0x4F0 | preset_cool_time;
				  break;
			  case state_ext_mode:
				  flash_mode = 0;
				  display_data = 0x5F0;
				  break;
			  }
		  }
		  update_outputs();
		  SystickDelay(5);
	  }
}

void push_note(int pitch, int duration){
	end_note = (end_note + 1)&0x3F;
	pitches[end_note] = pitch;
	durations[end_note] = duration;
	TIM6->DIER |= TIM_DIER_UIE; // Enable interrupt on update event
}

void get_next_note(){

	if(start_note == end_note){
		TIM6->DIER &= ~TIM_DIER_UIE; // Disable interrupt on update event
	} else {
		start_note = (start_note + 1)&0x3F;
		TIM6->ARR = pitches[start_note];
		buzz_counter = durations[start_note]*20000/ pitches[start_note];
	}
}

void clear_notes(){
	start_note = end_note = 0;
	buzz_counter = 0;
}

void TIM6_DAC_IRQHandler() {
	if((TIM6->SR & TIM_SR_UIF) != 0) // If update flag is set
		if(buzz_counter){
			buzz_counter--;
			if(buzz_counter & 1)
				GPIOB->BSRR = GPIO_BSRR_BS_9; // Set B9 high
			else
				GPIOB->BRR = GPIO_BSRR_BS_9; // Set B9 low
		}
	TIM6->SR &= ~TIM_SR_UIF; // Interrupt has been handled }
	if(!buzz_counter )	get_next_note();
}

int ToBCD(int value){
	int digits[3];
	int result;
	digits[0] = value %10;
	digits[1] = (value/10) % 10;
	digits[2] = (value/100) % 10;
	result = digits[0] | (digits[1]<<4) | (digits[2]<<8);
	return result;
}

int FromBCD(int value){
	int digits[3];
	int result;
	digits[0] = value & 0x0F;
	digits[1] = (value>>4) & 0x0F;
	digits[2] = (value>>8) & 0x0F;
	result = digits[0] + digits[1]*10 + digits[2]*100;
	return result;
}




/**
  * @brief  Manage the activity on sensors when touched/released (example)
  * @param  None
  * @retval None
  */
void ProcessSensors(void)
{
	if(!last_key_states[0] != (!key_states[0]| !key_states[3]))
	{
		last_key_states[0] = !(!key_states[0]| !key_states[3]);
		if(!last_key_states[0]) KeyPressed_0();
	}
	if(!last_key_states[1] != !key_states[1])
	{
		last_key_states[1] = !!key_states[1];
		if(!last_key_states[1]) KeyPressed_1();
	}
	if(!last_key_states[2] != !key_states[2])
	{
		last_key_states[2] = !!key_states[2];
		if(!last_key_states[2]) KeyPressed_2();
	}
	if(!last_key_states[4] != !key_states[4])
		{
			last_key_states[4] = !!key_states[4];
			if(!last_key_states[4]) KeyPressed_3();
		}

	if ((!key_states[0]| !key_states[3]))
	{
		if((curr_status == STATUS_FREE))
		{
			if(start_counter< (START_COUNTER_TIME+ ENTER_SERVICE_DELAY + 6*SERVICE_NEXT_DELAY)) start_counter++;
			if(start_counter == START_COUNTER_TIME + ENTER_SERVICE_DELAY)
			{
				clear_notes();
				push_note(C2,4);
				push_note(E2,4);
				push_note(G2,4);
				push_note(C3,4);
				push_note(G2,4);
				push_note(C3,8);
				state = state_enter_service;
				service_mode = mode_clear_hours; // Clear Hours
			}
			else if(start_counter == START_COUNTER_TIME + ENTER_SERVICE_DELAY + 1*SERVICE_NEXT_DELAY){
				service_mode = mode_set_address; //
			}
			else if(start_counter == START_COUNTER_TIME + ENTER_SERVICE_DELAY + 2*SERVICE_NEXT_DELAY){
				service_mode = mode_set_pre_time; //
			}
			else if(start_counter == START_COUNTER_TIME + ENTER_SERVICE_DELAY + 3*SERVICE_NEXT_DELAY){
				service_mode = mode_set_cool_time; //
			}
		}
	}
	else
	{
		if(start_counter){
			if(state == state_show_hours){
				start_counter--;
				if(!start_counter){
					state = state_show_time;
				}
			}
			else if(state >= state_enter_service){
				if(state == state_enter_service){
					state = service_mode + state_enter_service;
				}
				//start_counter--;
				start_counter = 0;
			}
			else {
				start_counter--;

			}
		}
		if(prev_status != curr_status){
			if (prev_status == STATUS_WAITING && curr_status == STATUS_WORKING){
				work_hours[2]+=main_time;
				if(work_hours[2]>59){
					work_hours[2]=work_hours[2]-60;
					work_hours[1]++;
					if(work_hours[1]>99){
						work_hours[1] = 0;
						work_hours[0]++;
					}
				}
				write_eeprom();
			}
			prev_status = curr_status;

		}
		//    LED1_OFF;
	}

	// TKEY 1
	if (!key_states[2])
	{
//		LED2_ON;
	}
	else
	{
//		LED2_OFF;
	}


}


#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
//  LED1_OFF;
//  LED2_ON;
  for (;;)
  {
//    LED1_TOGGLE;
//    LED2_TOGGLE;
    SystickDelay(100);
  }
}
#endif


/**
  * @brief  Add a delay using the Systick
  * @param  nTime Delay in milliseconds.
  * @retval None
  */
void SystickDelay(__IO uint32_t nTime)
{

  Gv_SystickCounter = nTime;
  while (Gv_SystickCounter != 0)
  {
    // The Gv_SystickCounter variable is decremented every ms by the Systick interrupt routine
  }

}

void TimingDelay_Decrement(void)
{
	if (Gv_SystickCounter != 0x00)
	{
		Gv_SystickCounter--;
	}
	//TSL_tim_ProcessIT();

	if(++led_counter>6){
		led_counter = 0;
		digit_num++;
		flash_counter++;
		if(digit_num>2) digit_num = 0;
		GPIOA->BSRR = GPIO_BSRR_BR_0  | GPIO_BSRR_BR_2; // Turn off the lights while changing them
		GPIOC->BSRR = GPIO_BSRR_BR_3;
		show_digit(((display_data & 0xFFF)& (0x0F<<(digit_num*4)))>>(digit_num*4));
		if(flash_mode < 3 ||(flash_counter & 0x40)){
			switch (digit_num){
			case 2:
				GPIOA->BSRR = GPIO_BSRR_BS_2 ;
				GPIOA->BSRR = GPIO_BSRR_BR_0 ;
				GPIOC->BSRR = GPIO_BSRR_BR_3;
				break;

			case 1:
				GPIOC->BSRR = GPIO_BSRR_BS_3 ;
				GPIOA->BSRR = GPIO_BSRR_BR_0 | GPIO_BSRR_BR_2;
				break;
			case 0:
			default:
				GPIOA->BSRR = GPIO_BSRR_BS_0 ;
				GPIOA->BSRR = GPIO_BSRR_BR_2;
				GPIOC->BSRR = GPIO_BSRR_BR_3;
				break;
			}
		}
		if (((flash_mode == 1)&& digit_num == 0 && (flash_counter & 0x40)) || ((flash_mode == 2) && (digit_num == 2))){
			GPIOC->BSRR = GPIO_BSRR_BS_0 | GPIO_BSRR_BS_1;
		}
		else
		{
			GPIOC->BSRR = GPIO_BSRR_BR_0 | GPIO_BSRR_BR_1;
		}
	}
	if(start_delay)start_delay--;
	if(Gv_miliseconds++>60000L){
		Gv_miliseconds = 0;
		if (pre_time)
		{
			pre_time--;
			if (pre_time == 0 && main_time != 0)
			{
				start_delay = 2000L;
			}
		}
		else if (main_time) {
			main_time--;
			minute_counter ++;
			if(main_time == 0){
				//play_message(2);
			}
		}
		else if (cool_time) cool_time--;
		//update_status();
	}
	if  (Gv_UART_Timeout){
		Gv_UART_Timeout--;
		if(! Gv_UART_Timeout) {
			rx_state = 0;
			pre_time_sent = 0, main_time_sent = 0, cool_time_sent = 0;
		}
	}
	update_status();
}


void KeyPressed_0(void){//START Key(Left)

//	push_note(E2,2);
//	push_note(G2,2);
//	push_note(C3,2);
	if( curr_status == STATUS_WAITING ){
		clear_notes();

		push_note(C3,6);
		push_note(E3,4);
		Gv_miliseconds = 0;
		pre_time = 0;
		start_delay = 2000L;
		//send_start();
	}
	if((curr_status == STATUS_FREE || curr_status == STATUS_ERROR) ) {
		clear_notes();

		push_note(C3,6);
		{
			if (state > state_enter_service){
				// Write EEPROM
				if(state == state_clear_hours){
					work_hours[0] = 0;
					work_hours[1] = 0;
					work_hours[2] = 0;
				}
				write_eeprom();
				read_eeprom();
				start_counter = 0;
				flash_mode = 0;
				state = state_set_time;
			} else {
				start_counter = START_COUNTER_TIME;
				state = state_show_hours;
			}
		}
	}
}

void KeyPressed_2(void){ // +
	if(state == state_show_hours) {
		state = state_set_time;
		start_counter = 0;
	}
	if(state == state_set_time ){
		if(main_time < 25){
			pre_time = preset_pre_time;
			cool_time = preset_cool_time;
			main_time ++;
//			if((time_to_set & 0x0F)>9) time_to_set +=6;
		}
	}
	else if(state == state_show_time && curr_status == STATUS_WAITING)
	{
		if(main_time < 25)
		{
			main_time ++;
		}
	}
	else if(state > state_enter_service){
		start_counter = EXIT_SERVICE_TIME;
		switch (service_mode){
		case mode_set_address:
			if(controller_address<15) controller_address++;
			break;
		case mode_set_pre_time:
			if(preset_pre_time<9) preset_pre_time++;
			break;
		case mode_set_cool_time:
			if(preset_cool_time<9) preset_cool_time++;
			break;
		default:
			break;
		}
	}
	clear_notes();

	push_note(A3,8);
}
void KeyPressed_1(void){ // -
//	if(state == state_show_hours) {
//		state = state_set_time;
//		start_counter = 0;
//	}
	if(state == state_show_time && curr_status == STATUS_WAITING )
	{
		if(main_time) {
			main_time--;
		}
		if (main_time == 0)
		{
			pre_time = 0;
			cool_time = 0;
		}
	}else if(state > state_enter_service){
		start_counter = EXIT_SERVICE_TIME;
		switch (service_mode){
		case mode_set_address:
			if(controller_address) controller_address--;
			break;
		case mode_set_pre_time:
			if(preset_pre_time) preset_pre_time--;
			break;
		case mode_set_cool_time:
			if(preset_cool_time) preset_cool_time--;
			break;
		default:
			break;
		}
	}

//	if((time_to_set & 0x0F)>9) time_to_set -=6;
	clear_notes();

	push_note(A3,8);

}

void KeyPressed_3()
{
	if(main_time == 0 && controller_address)
	{
		pre_time = preset_pre_time;
		cool_time = preset_cool_time;
	}
	main_time += controller_address;
	if(main_time > 25)
	{
		main_time = 25;
	}

}

void set_relay2(unsigned char state)
{
	if (state && start_delay == 0)
	{
		 GPIOC->BSRR = GPIO_BSRR_BS_11 ;
	}
	else
	{
		 GPIOC->BSRR = GPIO_BSRR_BR_11 ;
	}
}

void set_relay1(unsigned char state)
{
	if (state )
	{
		 GPIOA->BSRR = GPIO_BSRR_BS_15;
	}
	else
	{
		 GPIOA->BSRR = GPIO_BSRR_BR_15;
	}
}

void update_status(void){
	if(pre_time) {
		curr_status = STATUS_WAITING;
		curr_time = pre_time;
	}
	else if(main_time) {
		curr_status = STATUS_WORKING;
		curr_time = main_time;
	}
	else if(cool_time) {
		curr_status = STATUS_COOLING;
		curr_time = cool_time;
		start_delay = 0;
	}
	else {
		curr_status = STATUS_FREE;
		curr_time = 0;
		start_delay = 0;
	}
}
void update_outputs(void){
	if( curr_status == STATUS_WAITING){
		set_relay1(0);
		set_relay2(0);
	}
	else if(curr_status == STATUS_WORKING){
		set_relay1(1);
		set_relay2(1);
	}
	else if(curr_status == STATUS_COOLING){
		set_relay1(0);
		set_relay2(1);
	}
	else {
		set_relay1(0);
		set_relay2(0);
	}
}


//void send_start(void){
//	// Ping solarium for status
//	if(controller_address >15){
//		curr_status = -1;
//		curr_time = 0;
//	} else {
//			while(USART_GetFlagStatus(USART1,USART_FLAG_RXNE))	USART_ReceiveData(USART1); // Flush input
//			while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET); // wAIT UNTIL TX BUFFER IS EMPTY
//
//			USART_SendData(USART1,0x80 | ((controller_address & 0x0f)<<3) | 1); //Command 1 == start
//			SystickDelay(2);
//			USART_SendData(USART1,0x55);
//	}
//}

void read_eeprom(void){
	int index = 0;
	flash_struct *flash_mem;
	uint32_t *p = (uint32_t *)eeprom_array;
	for(index = 0; index<512; index+=2){
		if(*(p + index)==0xFFFFFFFF) break;
	}
	if(index == 0){
		// Load defaults
		flash_mem = 0;
		preset_pre_time = 7;
		preset_cool_time = 3;
		controller_address = 16;
		work_hours[0] = 0;
		work_hours[1] = 0;
		work_hours[2] = 0;
		write_eeprom();
		return;
	}
	index-=2;
	flash_mem = (flash_struct*)&eeprom_array[index];
	preset_pre_time = flash_mem->settings.pre_time ;
	preset_cool_time = flash_mem->settings.cool_time;
	controller_address = flash_mem->settings.addresse & 0x0f;
	work_hours[0] = flash_mem->time.hours_h;
	work_hours[1] = flash_mem->time.hours_l;
	work_hours[2] = flash_mem->time.minutes;
}

void write_eeprom(void){
	volatile int index = 0;
	FLASH_Unlock();
	volatile flash_struct flash_mem;
	uint32_t *p = (uint32_t *)eeprom_array;
//	uint32_t *p = (uint32_t *)&flash_mem;
	for(index = 0; index<512; index+=2){
		if(*(p + index)==0xFFFFFFFF) break;
	}

//	while((eeprom_array[index]!=0xFFFFFFFFUL)&&(index<(512)))index+=2;
	if(index > 511){
		// No more room. Erase the 4 pages
		FLASH_ErasePage((uint32_t)&eeprom_array[0]);
		FLASH_ErasePage((uint32_t)&eeprom_array[128]);
		FLASH_ErasePage((uint32_t)&eeprom_array[256]);
		FLASH_ErasePage((uint32_t)&eeprom_array[384]);
		index = 0;
	}
	for(index = 0; index<512; index+=2){
		if(*(p + index)==0xFFFFFFFF) break;
	}
	if(index >511){
		display_data = 0xE01;
		for (index = 0; index<20; index++){
			clear_notes();

			push_note(E2,3);
			push_note(D4,3);
		}
	} else {
		volatile static FLASH_Status sts;
		p = (uint32_t *)&flash_mem;
		flash_mem.settings.pre_time = preset_pre_time;
		flash_mem.settings.cool_time = preset_cool_time;
		flash_mem.settings.addresse = controller_address & 0x0f;
		flash_mem.settings.unused = 0x55;
		flash_mem.time.hours_h = work_hours[0];
		flash_mem.time.hours_l = work_hours[1];
		flash_mem.time.minutes = work_hours[2];
		flash_mem.time.used_flag = 0;
		sts = FLASH_ProgramWord((uint32_t)&eeprom_array[index],p[0]);
		sts = FLASH_ProgramWord((uint32_t)&eeprom_array[index+1],p[1]);
		index = sizeof(flash_mem);
		index ++;
		sts = sts;
	}
	FLASH_Lock();
}

//-----------------------------------------------------------------------------------------------------
void usart_receive(void){
	useUart = 1;

	//	USART_ITConfig(USART1,USART_IT_RXNE,DISABLE);
	data =  USART_ReceiveData(USART1);

	//pre_time_sent = 0, main_time_sent = 0, cool_time_sent = 0;

	if ((data & 0x80)){
		// Command
		if((data & (0x0fU<<3U)) == ((controller_address & 0x0fU)<<3U)){
			Gv_UART_Timeout = 1500;
		}
		if((data == (0x80U | ((controller_address & 0x0fU)<<3U)))){
			data = (curr_status<<6)| ToBCD(curr_time);
//			data = (STATUS_WORKING<<6)|4;
			USART_SendData(USART1,data);
		}
		else if (data == ((0x80U | ((controller_address & 0x0fU)<<3U) ))+1) //Command 1 - Start
		{
			pre_time = 0;
			start_delay = 2000L;
			update_status();
		}
		else if (data == ((0x80U | ((controller_address & 0x0fU)<<3U) ))+2)  //Command 2 == Pre_time_set
		{
			rx_state = rx_state_pre_time;
		}
		else if (data == ((0x80U | ((controller_address & 0x0fU)<<3U)))+5) //Command 5 == Main_time_set
		{
			rx_state = rx_state_main_time;
		}
		else if (data == ((0x80U | ((controller_address & 0x0fU)<<3U)))+3) //Command 3 == Cool_time_set
		{
			rx_state = rx_state_cool_time;
		}

	} else if (rx_state){
		// payload
		int time_in_hex = ToBCD(main_time_sent);
		if(rx_state == rx_state_get_checksum){
			int checksum = (pre_time_sent + cool_time_sent  - time_in_hex - 5) & 0x7F;
			if(	data == checksum){
				pre_time = pre_time_sent;
				main_time = main_time_sent;
				cool_time = cool_time_sent;
				if(pre_time == 0 && main_time != 0)start_delay = 2000L;
				update_status();
				Gv_miliseconds = 0;
			}
			rx_state = 0;
		}
		if(rx_state == rx_state_pre_time){
			pre_time_sent = data;
			rx_state = 0;
		}
		if(rx_state == rx_state_main_time){
			main_time_sent = FromBCD(data);
			rx_state = 0;
		}
		if(rx_state == rx_state_cool_time){
			cool_time_sent = data;
			rx_state = rx_state_get_checksum;
			int checksum = (pre_time_sent + cool_time_sent  - time_in_hex - 5) & 0x7F;
			data = checksum;
			USART_SendData(USART1,data);
		}


	}
	//	USART_ITConfig(USART1,USART_IT_RXNE,ENABLE);
	//	USART_SendData(USART1,0x80);
}





/**
 * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/





