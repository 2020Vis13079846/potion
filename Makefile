ASM      = nasm
ASMFLAGS =

LD       = ld
LDFLAGS  =

TARGET   = payload
FORMAT   = elf64

SRCS     = payload.S
Q        = @

all: payload shellcode

payload:
	$(Q) $(ASM) -f $(FORMAT) $(SRCS) $(ASMFLAGS)
	$(Q) $(LD) payload.o -o $(TARGET) $(LDFLAGS)

shellcode: $(TARGET)
	objdump -d ./$(TARGET)|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
