#include <stdio.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include "simulator.h"
#include "common.h"

// --- Memory Lanes ---
float MEMORY_LANE_0[MEMORY_LANE_SIZE];
float MEMORY_LANE_1[MEMORY_LANE_SIZE];
float MEMORY_LANE_2[MEMORY_LANE_SIZE];

// --- Simulator Implementation ---
void simulate_pe(PEState *state, uint8_t *program, float *mem_a_eff, float *mem_b_eff, float *mem_out_eff)
{
    state->pc = 0;
    int cycles = 0; // Safety break
    const int max_cycles = 1000;

    while (cycles++ < max_cycles)
    {
        if (state->pc + INSTRUCTION_SIZE > MAX_PROGRAM_SIZE * INSTRUCTION_SIZE)
        {
            fprintf(stderr, "Error: PC out of bounds during simulation.\n");
            break;
        }

        uint8_t *instr_ptr = program + state->pc;
        uint8_t opcode = instr_ptr[0];
        uint8_t dest_reg = instr_ptr[1];
        uint8_t src1 = instr_ptr[2]; // Can be reg or mem lane
        uint8_t src2 = instr_ptr[3]; // Can be reg
        uint32_t imm_off = 0;
        memcpy(&imm_off, instr_ptr + 4, sizeof(uint32_t)); // Read immediate/offset

        state->pc += INSTRUCTION_SIZE; // Increment PC for next instruction

        // Decode and Execute
        FloatUnion fu;
        float val1, val2;

        switch (opcode)
        {
        case OP_NOP:
            break; // Do nothing

        case OP_SET_CONST:
            if (dest_reg < NUM_REGISTERS)
            {
                fu.u = imm_off;
                state->registers[dest_reg] = fu.f;
            }
            else
            {
                fprintf(stderr, "Sim Error: Invalid dest reg for SET_CONST\n");
                goto halt_sim;
            }
            break;

        case OP_LOAD:
            if (dest_reg < NUM_REGISTERS && src1 <= MEM_OUT)
            { // src1 is mem_lane
                uint32_t offset = imm_off;
                float *base_ptr = NULL;
                if (src1 == MEM_A)
                    base_ptr = mem_a_eff;
                else if (src1 == MEM_B)
                    base_ptr = mem_b_eff;
                else if (src1 == MEM_OUT)
                    base_ptr = mem_out_eff; // Allow loading from output

                if (base_ptr && offset < MEMORY_LANE_SIZE)
                {
                    state->registers[dest_reg] = base_ptr[offset];
                }
                else
                {
                    fprintf(stderr, "Sim Error: Invalid memory access in LOAD (lane=%d, offset=%u)\n", src1, offset);
                    goto halt_sim;
                }
            }
            else
            {
                fprintf(stderr, "Sim Error: Invalid operands for LOAD\n");
                goto halt_sim;
            }
            break;

        case OP_STORE:
            if (src2 < NUM_REGISTERS && src1 <= MEM_OUT)
            { // src1 is mem_lane, src2 is value reg
                uint32_t offset = imm_off;
                float *base_ptr = NULL;
                if (src1 == MEM_A)
                    base_ptr = mem_a_eff; // Allow storing to input lanes? Maybe restrict
                else if (src1 == MEM_B)
                    base_ptr = mem_b_eff;
                else if (src1 == MEM_OUT)
                    base_ptr = mem_out_eff;

                if (base_ptr && offset < MEMORY_LANE_SIZE)
                {
                    base_ptr[offset] = state->registers[src2];
                }
                else
                {
                    fprintf(stderr, "Sim Error: Invalid memory access in STORE (lane=%d, offset=%u)\n", src1, offset);
                    goto halt_sim;
                }
            }
            else
            {
                fprintf(stderr, "Sim Error: Invalid operands for STORE\n");
                goto halt_sim;
            }
            break;

        case OP_ADD:
        case OP_MUL:
        case OP_MAX:
            if (dest_reg < NUM_REGISTERS && src1 < NUM_REGISTERS && src2 < NUM_REGISTERS)
            {
                val1 = state->registers[src1];
                val2 = state->registers[src2];
                if (opcode == OP_ADD)
                    state->registers[dest_reg] = val1 + val2;
                else if (opcode == OP_MUL)
                    state->registers[dest_reg] = val1 * val2;
                else /* OP_MAX */
                    state->registers[dest_reg] = (val1 > val2) ? val1 : val2;
            }
            else
            {
                fprintf(stderr, "Sim Error: Invalid registers for ALU op\n");
                goto halt_sim;
            }
            break;

        case OP_HALT:
            goto halt_sim; // Exit simulation loop

        default:
            fprintf(stderr, "Sim Error: Unknown opcode 0x%02X\n", opcode);
            goto halt_sim;
        }
    }

halt_sim:
    if (cycles >= max_cycles)
    {
        fprintf(stderr, "Sim Warning: Max cycles reached.\n");
    }
    // Simulation finished or halted
    return;
}
