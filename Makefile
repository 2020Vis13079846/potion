ASM      = as
ASMFLAGS =

LD       = ld
LDFLAGS  =

TARGET   = payload
FORMAT   =

SRCS     = payload.asm
OBJS     = a.out

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
