#ifndef COMMON_H
#define COMMON_H

#include <stdint.h>

// --- Configuration ---
#define NUM_REGISTERS 4
#define MEMORY_LANE_SIZE 1024 // Size in number of floats
#define MAX_PROGRAM_SIZE 256 // Max instructions per kernel
#define INSTRUCTION_SIZE 8 // Bytes

// --- PE State ---
typedef struct {
    float registers[NUM_REGISTERS];
    uint32_t pc; // Program Counter (byte offset)
} PEState;

// --- Memory Access Patterns ---
typedef enum {
    PATTERN_DISTRIBUTE, // Distributes data across PEs with stride (previously "offset")
    PATTERN_BROADCAST   // Same data for all PEs (previously "loop")
} MemoryPattern;

// --- Instruction Opcodes ---
typedef enum {
    OP_NOP = 0x00,
    OP_SET_CONST = 0x01, // Set register to an immediate float value
    OP_LOAD = 0x02,      // Load from memory lane with offset
    OP_STORE = 0x03,     // Store to memory lane with offset
    OP_ADD = 0x04,       // Add src1_reg, src2_reg -> dest_reg
    OP_MUL = 0x05,       // Multiply src1_reg, src2_reg -> dest_reg
    OP_MAX = 0x06,       // Max(src1_reg, src2_reg) -> dest_reg
    OP_HALT = 0xFF       // Stop execution
} Opcode;

// --- Register and Memory Lane Identifiers ---
#define REG_R0 0
#define REG_R1 1
#define REG_R2 2
#define REG_R3 3
#define NO_REG 0xFF

#define MEM_A 0 // Typically Lane 0 or 1 based on kernel
#define MEM_B 1 // Typically Lane 1 or 0 based on kernel
#define MEM_OUT 2 // Typically Lane 2
#define NO_MEM 0xFF

// Union to easily convert float to uint32_t bit pattern
typedef union {
    float f;
    uint32_t u;
} FloatUnion;

#endif // COMMON_H
