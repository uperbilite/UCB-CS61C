#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
	uint16_t reg0 = (*reg >> 0) & 0x1;
	uint16_t reg2 = (*reg >> 2) & 0x1;
	uint16_t reg3 = (*reg >> 3) & 0x1;
	uint16_t reg5 = (*reg >> 5) & 0x1;
	uint16_t t = (reg5 ^ (reg3 ^ (reg0 ^ reg2)));
	*reg >>= 1;
	*reg = (*reg & ~(1 << 15)) | (t << 15);
}

