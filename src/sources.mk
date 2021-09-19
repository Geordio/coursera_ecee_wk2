#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material.
#
#*****************************************************************************

# configured to allow the seletcion of the sources based on the PLATFORM keyword

# not sure if this will work, but attempt to set common attributes here, then
# the MSP432 using ifeq
SOURCES = main.c \
					memory.c

INCLUDES = -I ../include/common

# add the MSP432 specifics
ifeq ($(PLATFORM),MSP432)
	SOURCES += interrupts_msp432p401r_gcc.c \
								startup_msp432p401r_gcc.c \
								system_msp432p401r.c

	INCLUDES += -I ../include/msp432 \
						-I ../include/CMSIS \
						-I ../include/common

endif
