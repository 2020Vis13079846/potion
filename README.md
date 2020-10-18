# Potion Payload

*Linux method of executing system commands*

Potion Payload is a method of executing system commands through shellcodes and nasm executables on Linux.

## Explaining

Potion Payload uses Linux `execve()` system call that allows you to execute filename.

```c
int execve(const char *filename, char *const argv[], char *const envp[]);
```

Potion Payload fills this function like this, it uses file `/bin/sh` with option `-c` to execute system commands.

```c
int execve("/////bin/sh", ["/////bin/sh", "-c", cmd], NULL);
```

Linux `execve()` registers:

| Register | Value |
|----------|-------|
| `rbx`    | `const char *filename` |
| `rcx`    | `char *const argv[]`   |
| `rdx`    | `char *const envp[]`   |

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

**Get debug:**

```
make debug
```
