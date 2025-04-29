CC=gcc
CFLAGS=-Wall -Wextra -g
SOURCES=main.c assembler.c simulator.c controller.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=npu_simulator

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ -lm

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)

.PHONY: all clean
