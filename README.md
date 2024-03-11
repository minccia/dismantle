# Huh?

This repository is intended to organize assembly coding exercises during my learning process. All code written here is using 32-bit x86 [NASM](https://nasm.us) syntax and should be assembled/linked on *Linux* using the following:

## Dependencies

- nasm >= **v2.15.05**
- gcc => **11.4.0**
- gcc-multilib

## Instructions

#### Folder Structure

- Executables are intended to be at `bin` folder
- Inside `lib`folder:
  - `asm_source`contains *assembly* source code
  - `c_source` contains *C* source code
  - `object_files` is intended to have object files generated by NASM. *This folder is ignored by git*
  - `support` contains text files and other files that can be used on assembly source code to perform operations.

#### Assembling and Executing

Run on your terminal:
   ```bash
   make generate file_name=FILE_NAME
   ```

Which **FILE_NAME** being the name of a file located at `lib/asm_source` without the *.asm* extension.

Example:

  ```bash
  make generate file_name=multiply_list
  ```

Should generate an executable for *multiply_list.asm* on bin/ folder.

*Disclaimer: This project is using ELF file format and specifying elf_i386 for GNU ld to generate a 32-bits executable. If you're not running on Linux, you may need to adapt the Makefile to your liking.*

Finally, run the executable:

```bash
bin/FILE_NAME
```