#ifndef ASSEMBLER_H
#define ASSEMBLER_H

#include <stdint.h>
#include "common.h"

// --- Assembler Functions ---
void write_bytes(uint8_t* buffer, int* offset, uint8_t* data, int num_bytes);
void assemble_instruction(uint8_t* buffer, int* offset,
                          uint8_t opcode, uint8_t dest_reg, uint8_t src1, uint8_t src2, uint32_t imm_off);
void assemble_SET_CONST(uint8_t* buffer, int* offset, uint8_t dest_reg, float constant);
void assemble_LOAD(uint8_t* buffer, int* offset, uint8_t mem_lane, uint32_t mem_offset, uint8_t dest_reg);
void assemble_STORE(uint8_t* buffer, int* offset, uint8_t mem_lane, uint32_t mem_offset, uint8_t src_reg);
void assemble_ALU(uint8_t* buffer, int* offset, uint8_t opcode, uint8_t dest_reg, uint8_t src1_reg, uint8_t src2_reg);
void assemble_HALT(uint8_t* buffer, int* offset);

#endif // ASSEMBLER_H
