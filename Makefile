SHELL = /bin/sh

generate:
	@$(SHELL) -c "nasm -f elf -o lib/object_files/${file_name}.o lib/asm_source/${file_name}.asm && \
	  ld -m elf_i386 -o bin/${file_name} lib/object_files/${file_name}.o"