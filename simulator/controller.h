#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <stdint.h>
#include "common.h"
#include "simulator.h"

// --- Controller Functions ---
void memcpy_to_lane(float* src_data, int num_elements, float* dest_lane);
void launch_kernel(uint8_t* kernel_program, int num_pe,
                   float* mem_a_base, MemoryPattern mem_a_pattern, int mem_a_param,
                   float* mem_b_base, MemoryPattern mem_b_pattern, int mem_b_param,
                   float* mem_out_base, MemoryPattern mem_out_pattern, int mem_out_param);

#endif // CONTROLLER_H
