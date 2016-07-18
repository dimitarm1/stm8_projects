# ST Visual Debugger Generated MAKE File, based on kontroler.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=C:\PROGRA~2\COSMIC\CXSTM8~1
ToolsetBin=C:\PROGRA~2\COSMIC\CXSTM8_EVAL
ToolsetInc=C:\PROGRA~2\COSMIC\CXSTM8_EVAL\Hstm8
ToolsetLib=C:\PROGRA~2\COSMIC\CXSTM8_EVAL\Lib
ToolsetIncOpts=-i"C:\PROGRA~2\COSMIC\CXSTM8_EVAL\Hstm8" 
ToolsetLibOpts=-l"C:\PROGRA~2\COSMIC\CXSTM8_EVAL\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))

Device=STM8S003F3
FlashTool=C:\PROGRA~2\STMicroelectronics\st_toolset\stvp\STVP_CmdLine.exe



# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=kontroler
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 +debug -pxp -no -gge -pge -pp -l -dSTM8S003 -istm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)
		
flash :
    $(FlashTool) -BoardName=ST-LINK -Device=$(Device) -Port=USB -ProgMode=SWIM -no_loop -no_log -no_verif -FileProg=$(OutputPath)\$(TargetSName).s19	
	

Debug\stm8s_adc1.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_awu.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_awu.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_beep.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_beep.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_exti.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_flash.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_i2c.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_itc.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_itc.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_iwdg.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_iwdg.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_rst.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_rst.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_spi.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart1.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_uart1.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_wwdg.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_wwdg.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : stm8s_it.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h ports_definition.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h uart.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : main.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ports_definition.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\spi.$(ObjectExt) : spi.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h ports_definition.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h spi.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\uart.$(ObjectExt) : uart.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h ports_definition.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h uart.h stm8s_it.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\stm8s_it.o $(OutputPath)\main.o $(OutputPath)\spi.o $(OutputPath)\uart.o $(OutputPath)\kontroler.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\spi.o
	-@erase $(OutputPath)\uart.o
	-@erase $(OutputPath)\kontroler.elf
	-@erase $(OutputPath)\kontroler.elf
	-@erase $(OutputPath)\kontroler.map
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\spi.ls
	-@erase $(OutputPath)\uart.ls

endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=kontroler
TargetSName=kontroler
TargetFName=kontroler.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -istm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc +mods0 -gge -pge -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $< 
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) kontroler.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\stm8s_adc1.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_awu.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_awu.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_beep.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_beep.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_exti.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_flash.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_i2c.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_itc.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_itc.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_iwdg.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_iwdg.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_rst.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_rst.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart1.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_uart1.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_wwdg.$(ObjectExt) : stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\src\stm8s_wwdg.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : stm8s_it.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h ports_definition.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h uart.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : main.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ports_definition.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\spi.$(ObjectExt) : spi.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h ports_definition.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h spi.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\uart.$(ObjectExt) : uart.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h ports_definition.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s.h stm8s_conf.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h stm8s_stdperiph_lib\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h uart.h stm8s_it.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

kontroler.elf :  $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\stm8s_it.o $(OutputPath)\main.o $(OutputPath)\spi.o $(OutputPath)\uart.o $(OutputPath)\kontroler.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\spi.o
	-@erase $(OutputPath)\uart.o
	-@erase $(OutputPath)\kontroler.elf
	-@erase $(OutputPath)\kontroler.map
	-@erase $(OutputPath)\kontroler.st7
	-@erase $(OutputPath)\kontroler.s19
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\spi.ls
	-@erase $(OutputPath)\uart.ls
	
endif
