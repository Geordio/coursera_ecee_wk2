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

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#				compile-all: Compile all object files, but DO NOT link.
#				build: Compile all object files and link into a final executable
#				clean:  remove all compiled objects, preprocessed outputs, assembly outputs, executable files and build output files.
#
# Platform Overrides:
#      2 platofrms are supported:
# 				HOST: the host linux machin
#					MSP432: embedded TI MSP432 microcontroller
#
#------------------------------------------------------------------------------
include sources.mk
# sources.mk provides the $(SOURCES) and $INCLUDES variables

BASENAME = c1m2
TARGET = $(BASENAME).out

# Platform Overrides
#PLATFORM =

# Common Architectures Specific Flags
LINKER_FILE =
CPU =
ARCH =
SPECS =

# Common Compiler Flags and Defines
#CC =
#LD =
LDFLAGS =
CFLAGS = -Wall -Werror -g -O0 -std=c99
#CPPFLAGs =

# can use += to append to these


ifeq ($(PLATFORM),MSP432)

# Architectures Specific Flags
	LINKER_FILE = -T ../msp432p401r.lds
	CPU = -mcpu=cortex-m4
	ARCH = -mthumb -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DMSP432
	SPECS = --specs=nosys.specs

	# Compiler Flags and Defines
	CC = arm-none-eabi-gcc
	#LD =
	LDFLAGS = -Wl,-Map=$(BASENAME).map $(LINKER_FILE)
	CFLAGS += $(CPU) $(ARCH) $(SPECS)
	CPPFLAGs =

else
# Compiler Flags and Defines
	CC = gcc
	#LD =
	LDFLAGS = -Wl,-Map=$(BASENAME).map
	CFLAGS += -DHOST
	CPPFLAGs =

endif

# for every c file associate a .o
OBJS = $(SOURCES:.c=.o)

#from the pattern matching section of makefiles part2
#%.o: %.c
#	#$(CC) -c $@ -o $(CFLAGS) $(INCLUDES)

%.o : %.c
	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@

%.i : %.c
	$(CC) $(CFLAGS)  $(INCLUDES) -E -o $@ $<

%.asm : %.c
	$(CC) $(CFLAGS)  $(INCLUDES) -S -o $@ $<

%.d : %.c
	$(CC) $(CFLAGS)  $(INCLUDES) -M -o $@ $<


.PHONY: compile-all
compile-all: $(OBJS)

.PHONY: build
#build: $(TARGET): $(OBJS)
build: $(TARGET)

$(TARGET): $(OBJS)
#	$(CC) $(CFLAGS) -0 main.out $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o $(TARGET) $^


.PHONY: clean
clean:
	rm -f *.o *.i *.asm *.out *.map *.d
