#ifndef SIMULATOR_H
#define SIMULATOR_H

#include <stdint.h>
#include "common.h"

// External declarations for memory lanes
extern float MEMORY_LANE_0[MEMORY_LANE_SIZE];
extern float MEMORY_LANE_1[MEMORY_LANE_SIZE];
extern float MEMORY_LANE_2[MEMORY_LANE_SIZE];

// --- Simulator Functions ---
void simulate_pe(PEState *state, uint8_t *program, float *mem_a_eff, float *mem_b_eff, float *mem_out_eff);

#endif // SIMULATOR_H
