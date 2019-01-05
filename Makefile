BUILD=cmake-build-release
DEVICE=m168p

.PHONY: all flash erase

all: $(BUILD)/blinky

$(BUILD)/blinky:
	make -C $(BUILD) blinky

$(BUILD)/blinky.hex: $(BUILD)/blinky
	avr-objcopy -j .text -j .data -O ihex -O ihex $^ $@

flash: $(BUILD)/blinky.hex
	avrdude -c avrisp -p $(DEVICE) -P /dev/tty.usbmodem* -b 19200 -U flash:w:$^

erase:
	avrdude -c avrisp -p $(DEVICE) -P /dev/tty.usbmodem* -b 19200 -e
