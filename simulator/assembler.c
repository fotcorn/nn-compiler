#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "assembler.h"
#include "common.h"

// Utility to write bytes to buffer and increment offset
void write_bytes(uint8_t* buffer, int* offset, uint8_t* data, int num_bytes) {
    memcpy(buffer + *offset, data, num_bytes);
    *offset += num_bytes;
}

void assemble_instruction(uint8_t* buffer, int* offset,
                          uint8_t opcode, uint8_t dest_reg, uint8_t src1, uint8_t src2, uint32_t imm_off) {
    if (*offset + INSTRUCTION_SIZE > MAX_PROGRAM_SIZE * INSTRUCTION_SIZE) {
         fprintf(stderr, "Error: Program buffer overflow during assembly.\n");
         exit(1);
    }
    buffer[(*offset)++] = opcode;
    buffer[(*offset)++] = dest_reg;
    buffer[(*offset)++] = src1;
    buffer[(*offset)++] = src2;
    // Write immediate/offset in little-endian format (adjust if needed for target)
    buffer[(*offset)++] = (imm_off >> 0) & 0xFF;
    buffer[(*offset)++] = (imm_off >> 8) & 0xFF;
    buffer[(*offset)++] = (imm_off >> 16) & 0xFF;
    buffer[(*offset)++] = (imm_off >> 24) & 0xFF;
}

void assemble_SET_CONST(uint8_t* buffer, int* offset, uint8_t dest_reg, float constant) {
    FloatUnion fu;
    fu.f = constant;
    assemble_instruction(buffer, offset, OP_SET_CONST, dest_reg, NO_REG, NO_REG, fu.u);
}

void assemble_LOAD(uint8_t* buffer, int* offset, uint8_t mem_lane, uint32_t mem_offset, uint8_t dest_reg) {
    assemble_instruction(buffer, offset, OP_LOAD, dest_reg, mem_lane, NO_REG, mem_offset);
}

void assemble_STORE(uint8_t* buffer, int* offset, uint8_t mem_lane, uint32_t mem_offset, uint8_t src_reg) {
    assemble_instruction(buffer, offset, OP_STORE, NO_REG, mem_lane, src_reg, mem_offset); // Use src2_reg for value source
}

void assemble_ALU(uint8_t* buffer, int* offset, uint8_t opcode, uint8_t dest_reg, uint8_t src1_reg, uint8_t src2_reg) {
    assemble_instruction(buffer, offset, opcode, dest_reg, src1_reg, src2_reg, 0); // Immediate/offset not used
}

void assemble_HALT(uint8_t* buffer, int* offset) {
    assemble_instruction(buffer, offset, OP_HALT, NO_REG, NO_REG, NO_REG, 0);
}
