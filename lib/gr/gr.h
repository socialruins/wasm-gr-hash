#ifndef GR_H
#define GR_H

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "uint256.h"

void gr_hash(const char* input, char* output, uint256 prevBlockHash);

#endif
