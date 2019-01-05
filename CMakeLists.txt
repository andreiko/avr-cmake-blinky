cmake_minimum_required(VERSION 3.12)
project(blinky C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_COMPILER "/usr/local/bin/avr-gcc")

set(ARCH_FLAGS "\
        -mmcu=atmega168p \
")

set(CMAKE_C_FLAGS "${ARCH_FLAGS} \
        -DF_CPU=1000000UL \
        -Wall \
        -Werror \
        -Os \
        -std=gnu99 \
        -fdata-sections \
        -ffunction-sections \
        -fpack-struct \
        -fshort-enums \
        -funsigned-bitfields \
        -funsigned-char \
")

set(CMAKE_EXE_LINKER_FLAGS "${ARCH_FLAGS} \
        -Wl,--gc-sections \
")

set(CMAKE_C_LINK_EXECUTABLE "${CMAKE_C_COMPILER} <LINK_FLAGS> <OBJECTS> -o <TARGET>")

add_executable(blinky main.c)
