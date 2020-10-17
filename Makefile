ASM      = nasm
ASMFLAGS =

LD       = ld
LDFLAGS  = -m elf_i386

TARGET   = payload
FORMAT   = elf32

SRCS     = payload.nasm
OBJS     = payload.o

Q        = @

all: payload shellcode

payload:
	$(Q) $(ASM) -f $(FORMAT) $(SRCS) $(ASMFLAGS)
	$(Q) $(LD) $(OBJS) -o $(TARGET) $(LDFLAGS)

shellcode: $(TARGET)
	$(Q) objdump -d ./$(TARGET) | gxtractor

debug: $(TARGET)
	$(Q) strace ./$(TARGET)

clean:
	$(Q) rm -rf $(TARGET) $(OBJS)
