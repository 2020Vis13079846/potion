.section .data
cmd: .string "/bin/sh"

.section .text
.globl _start
_start:
        pushq   $0              ; empty stack
        pushq   cmd             ; save cmd to rsp
        
        movq    $59,    %rax    ; call execve system call
        movq    %rsp,   %rdi    ; save rsp to rdi
        
        pushq   $0              ; empty stack
        movq    %rsp,   %rsi    ; save rsp to rsi
        movq    %rsp,   %rdx    ; save rsp to rdx
        
        syscall                 ; make system call
