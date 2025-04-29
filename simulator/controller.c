#include <stdio.h>
#include <string.h>
#include "controller.h"
#include "simulator.h"
#include "common.h"

// Simple memcpy wrapper
void memcpy_to_lane(float* src_data, int num_elements, float* dest_lane) {
    if (num_elements > MEMORY_LANE_SIZE) {
        fprintf(stderr, "Error: memcpy_to_lane exceeds memory lane size (%d > %d).\n", num_elements, MEMORY_LANE_SIZE);
        return;
    }
    memcpy(dest_lane, src_data, num_elements * sizeof(float));
}

// Launch Kernel on PEs
void launch_kernel(uint8_t* kernel_program, int num_pe,
                   float* mem_a_base, MemoryPattern mem_a_pattern, int mem_a_param,
                   float* mem_b_base, MemoryPattern mem_b_pattern, int mem_b_param,
                   float* mem_out_base, MemoryPattern mem_out_pattern, int mem_out_param)
{
    printf("Launching kernel on %d PEs...\n", num_pe);

    for (int pe_id = 0; pe_id < num_pe; ++pe_id) {
        // Calculate effective base addresses for this PE
        float* eff_mem_a = mem_a_base;
        if (mem_a_pattern == PATTERN_DISTRIBUTE) {
            eff_mem_a += (long long)pe_id * mem_a_param; // Use long long for intermediate multiplication
        } else if (mem_a_pattern == PATTERN_BROADCAST) {
            // Base address remains the same for all PEs
        } // Add other patterns if needed

        float* eff_mem_b = mem_b_base;
        if (mem_b_pattern == PATTERN_DISTRIBUTE) {
            eff_mem_b += (long long)pe_id * mem_b_param;
        } else if (mem_b_pattern == PATTERN_BROADCAST) {
            // Base address remains the same
        }

        float* eff_mem_out = mem_out_base;
        if (mem_out_pattern == PATTERN_DISTRIBUTE) {
            eff_mem_out += (long long)pe_id * mem_out_param;
        } else if (mem_out_pattern == PATTERN_BROADCAST) {
             // Base address remains the same - unusual for output, but possible
        }

        // Check calculated bounds (basic check)
        if ((eff_mem_a < MEMORY_LANE_0 || eff_mem_a >= MEMORY_LANE_0 + MEMORY_LANE_SIZE) &&
            (eff_mem_a < MEMORY_LANE_1 || eff_mem_a >= MEMORY_LANE_1 + MEMORY_LANE_SIZE) &&
            (eff_mem_a < MEMORY_LANE_2 || eff_mem_a >= MEMORY_LANE_2 + MEMORY_LANE_SIZE)) {
             // This check is tricky because we don't know which original lane it points to
             // A more robust check would involve knowing the original base lane ptr.
             // Skipping detailed bounds check for simplicity here.
             // printf("PE %d: MEM_A potentially out of bounds\n", pe_id);
        }
         // Similar checks for eff_mem_b, eff_mem_out...

        // Initialize PE state
        PEState current_pe_state = {0}; // Zero initialize registers and PC

        // Simulate this PE
        // printf("  Simulating PE %d: A @ %p, B @ %p, OUT @ %p\n",
        //        pe_id, (void*)eff_mem_a, (void*)eff_mem_b, (void*)eff_mem_out);
        simulate_pe(&current_pe_state, kernel_program, eff_mem_a, eff_mem_b, eff_mem_out);
    }
    printf("Kernel launch complete.\n");
}
