ASM      = nasm
ASMFLAGS =

LD       = ld
LDFLAGS  =

TARGET   = payload
FORMAT   = elf64

all: payload shellcode

payload:
	$(Q) $(ASM) -f $(FORMAT) payload.S $(ASMFLAGS)
	$(Q) $(LD) payload.o -o $(TARGET) $(LDFLAGS)

shellcode:
