#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <stdint.h>


int key;
int button[] = {0,0,0};


int main() {
	int edge, edge1, edge2, edge3, toggle1 = 0, toggle2 = 0, toggle3 = 0, state = 0;
	int original = 0; //Flag for the sound to not be doubled by the DP_DAC. original = 1 for original. Original = 0 for going through the component
	while (1) {
		key = ~IORD_ALTERA_AVALON_PIO_DATA(KEY_BASE);
		//printf("State num %d\n", state);
		if ((key & 0b01) && !edge) {
			if (state > 4) {
				state = 4;
			} else {
				state = 9;
			}
		} else if ((key & 0b10) && !edge1) {
			IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x01);
			toggle2 = !toggle2;
			if (toggle2 == 1) {
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1000000);
			} else {
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1020000);
			}
		} else if ((key & 0b100) && !edge2) {
			IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE,0x01);
			toggle1 = !toggle1;
			if (toggle1 == 1) {
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1010000);
			} else {
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1030000);
			}
//		} else if ((key & 0b1000) && !edge3) {
//			IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
//			toggle3 = !toggle3;
//			original = 1;
//			if (toggle3 == 1) {
//				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0120000);
//				if (original == 1) {
//					IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
//					IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0130000);
//					original = 0;
//				}
//			} else {
//				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0320000);
//				if (original == 0) {
//					IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
//					IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0330000);
//				}
//			}
		} else {
			switch (state) {
			case 9:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x01);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1020000);
				state = 8;
				break;
			case 8:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x01);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1030000);
				state = 7;
				break;
			case 7:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0320000);
				state = 6;
				break;
			case 6:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0330000);
				state = 5;
				break;
			case 4:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0000000);
				state = 3;
				break;
			case 3:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x00);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xa0010000);
				state = 2;
				break;
			case 2:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x01);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1000000);
				state = 1;
				break;
			case 1:
				IOWR_ALTERA_AVALON_PIO_DATA(ADDR_BASE, 0x01);
				IOWR_ALTERA_AVALON_PIO_DATA(SEND_BASE, 0xb1010000);
				state = 0;
				break;
			}
		}
		edge = (key & 0b01);
		edge1 = (key & 0b10);
		edge2 = (key & 0b100);
		edge3 = (key & 0b1000);
	}
}