#include <avr/io.h>
#include <util/delay.h>

#define LED_BIT (1 << 7)

int main() {
    DDRD = LED_BIT;
    for(;;) {
        PORTD ^= LED_BIT;
        _delay_ms(300);
    }
}
