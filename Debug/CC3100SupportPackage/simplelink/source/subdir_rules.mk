################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
CC3100SupportPackage/simplelink/source/device.obj: ../CC3100SupportPackage/simplelink/source/device.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/device.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/driver.obj: ../CC3100SupportPackage/simplelink/source/driver.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/driver.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/flowcont.obj: ../CC3100SupportPackage/simplelink/source/flowcont.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/flowcont.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/fs.obj: ../CC3100SupportPackage/simplelink/source/fs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/fs.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/netapp.obj: ../CC3100SupportPackage/simplelink/source/netapp.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/netapp.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/netcfg.obj: ../CC3100SupportPackage/simplelink/source/netcfg.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/netcfg.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/nonos.obj: ../CC3100SupportPackage/simplelink/source/nonos.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/nonos.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/socket.obj: ../CC3100SupportPackage/simplelink/source/socket.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/socket.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/spawn.obj: ../CC3100SupportPackage/simplelink/source/spawn.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/spawn.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

CC3100SupportPackage/simplelink/source/wlan.obj: ../CC3100SupportPackage/simplelink/source/wlan.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="C:/ti/ccsv7/ccs_base/arm/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/board" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/include" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/simplelink/source" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/SL_Common" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/spi_cc3100" --include_path="C:/Users/samue/workspace_v7/Lab5.2/CC3100SupportPackage/cc3100_usage" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/inc" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/DriverLib" --include_path="C:/Users/samue/workspace_v7/Lab5.2/BoardSupportPackage/src" --include_path="C:/Users/samue/workspace_v7/Lab5.2/G8RTOS_Empty_Lab2" --include_path="C:/ti/ccsv7/ccs_base/arm/include/CMSIS" --include_path="C:/Users/samue/workspace_v7/Lab5.2" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_19.6.0.STS/include" --advice:power=all --define=__MSP432P401R__ --define=ccs -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="CC3100SupportPackage/simplelink/source/wlan.d_raw" --obj_directory="CC3100SupportPackage/simplelink/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

