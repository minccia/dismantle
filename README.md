# Huh?

This repository is intended to organize assembly coding exercises during my learning process. All code written here is using 32-bit x86 [NASM](https://nasm.us) syntax and should be assembled/linked using the following:

## Instructions

1. Generate object file using NASM
   ```bash
   nasm -f elf file_name.asm -o file_name.o # GNU/Linux
   nasm -f win32 file_name.asm -o file_name.obj # Windows
   ```

2. Link the object file using a linker
   ```bash
   ld -m elf_i386 -o file_name file_name.o # GNU/Linux
   ld -m i386pe -o file_name.exe file_name.obj # Windows
   ```

Execute and ~~let bitcoin generation begin~~ enjoy.