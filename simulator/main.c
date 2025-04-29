#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "common.h"
#include "assembler.h"
#include "simulator.h"
#include "controller.h"

int main() {
    // 1. Assemble the Convolution Kernel Program
    uint8_t conv_program[MAX_PROGRAM_SIZE * INSTRUCTION_SIZE];
    int program_offset = 0;

    // Kernel: R0 = Acc, R1 = MemA val, R2 = MemB val, R3 = Mul result
    assemble_SET_CONST(conv_program, &program_offset, REG_R0, 0.0f); // R0 = 0 (Accumulator)

    // Unroll 3x3 = 9 MAC operations
    for (int i = 0; i < 9; ++i) {
        assemble_LOAD(conv_program, &program_offset, MEM_A, i, REG_R1);  // R1 = MEM_A[i]
        assemble_LOAD(conv_program, &program_offset, MEM_B, i, REG_R2);  // R2 = MEM_B[i]
        assemble_ALU(conv_program, &program_offset, OP_MUL, REG_R3, REG_R1, REG_R2); // R3 = R1 * R2
        assemble_ALU(conv_program, &program_offset, OP_ADD, REG_R0, REG_R0, REG_R3); // R0 = R0 + R3
    }

    // Store result
    assemble_STORE(conv_program, &program_offset, MEM_OUT, 0, REG_R0); // MEM_OUT[0] = R0

    assemble_HALT(conv_program, &program_offset);
    int conv_program_size_bytes = program_offset; // Total size in bytes

    printf("Assembled Convolution Kernel (%d bytes):\n", conv_program_size_bytes);
    for(int i=0; i<conv_program_size_bytes; ++i) {
        printf("%02X ", conv_program[i]);
        if ((i+1) % INSTRUCTION_SIZE == 0) printf("\n");
    }
    printf("\n");


    // 2. Prepare Data (Example: 2x2 output from 4x4 image, 3x3 kernel)
    // Requires im2col externally or manually prepare flat data
    // Let's assume flat data is already prepared.
    // Image patches (4 patches, 9 elements each) -> MEMORY_LANE_0
    // Kernel weights (9 elements, repeated/looped) -> MEMORY_LANE_1
    // Output (4 elements) -> MEMORY_LANE_2

    float flat_image_patches[4 * 9] = { // Example: PE0 patch, PE1 patch, PE2 patch, PE3 patch
        1, 2, 3, 10, 11, 12, 19, 20, 21, // Patch for output (0,0)
        4, 5, 6, 13, 14, 15, 22, 23, 24, // Patch for output (0,1)
        7, 8, 9, 16, 17, 18, 25, 26, 27, // Patch for output (1,0)
        1, 1, 1, 2, 2, 2, 3, 3, 3  // Patch for output (1,1)
    };
    float flat_kernel[9] = {
        1, 0, 0,
        0, 1, 0,
        0, 0, 1
    }; // Simple identity-like kernel elements

    // 3. Load Data into Memory Lanes
    memcpy_to_lane(flat_image_patches, 4 * 9, MEMORY_LANE_0);
    memcpy_to_lane(flat_kernel, 9, MEMORY_LANE_1);

    // 4. Launch the Convolution Kernel
    int num_pe = 4; // One PE per output pixel
    int kernel_size_sq = 9;
    int output_size = 1; // Each PE produces 1 output value

    launch_kernel(conv_program, num_pe,
                  MEMORY_LANE_0, PATTERN_DISTRIBUTE, kernel_size_sq, // Image patches: offset by 9 per PE
                  MEMORY_LANE_1, PATTERN_BROADCAST, kernel_size_sq,   // Kernel weights: broadcast to all PEs
                  MEMORY_LANE_2, PATTERN_DISTRIBUTE, output_size);   // Output: offset by 1 per PE

    // 5. Check Results
    printf("Output Memory Lane (MEMORY_LANE_2):\n");
    for (int i = 0; i < num_pe * output_size; ++i) {
         // Very basic check if the output looks reasonable (sum of diagonal for this example)
         float expected = 0;
         if (i==0) expected = 1+11+21; // Patch 0 diag
         if (i==1) expected = 4+14+24; // Patch 1 diag
         if (i==2) expected = 7+17+27; // Patch 2 diag
         if (i==3) expected = 1+2+3;   // Patch 3 diag
        printf("  [%d]: %.2f (Expected: %.2f)\n", i, MEMORY_LANE_2[i], expected);
    }

    return 0;
}
