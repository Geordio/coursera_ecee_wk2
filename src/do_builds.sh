#!/bin/bash
echo "running builds"
make memory.o PLATFORM=MSP432
make clean
make memory.o PLATFORM=HOST
make clean
make main.o PLATFORM=MSP432
make clean
make main.o PLATFORM=HOST
make clean
make main.asm PLATFORM=MSP432
make clean
make main.asm PLATFORM=HOST
make clean
make memory.asm PLATFORM=MSP432
make clean
make memory.asm PLATFORM=HOST
make clean
make memory.i PLATFORM=MSP432
make clean
make memory.i PLATFORM=HOST
make clean
make main.i PLATFORM=MSP432
make clean
make main.i PLATFORM=HOST
make clean
make build PLATFORM=MSP432
make clean
make build PLATFORM=HOST
make clean
make compile-all PLATFORM=HOST
make clean
make compile-all PLATFORM=MSP432
make clean

