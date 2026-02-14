# scheduler-on-assembly
This repo demonstrates implementation of scheduler using assembly code for ARM-M class

---
---
## Environment setup (one time) 

### Install packages
Installing compiler, QEMU and GDB

> `sudo apt update`

> `sudo apt install -y gcc-arm-none-eabi binutils-arm-none-eabi gdb-multiarch qemu-system-arm make`

### Confirm all installations went through (optional)
> `arm-none-eabi-as --version`

> `arm-none-eabi-ld --version`

> `arm-none-eabi-objdump --version`

> `arm-none-eabi-readelf --version`

> `qemu-system-arm --version`

> `gdb-multiarch --version`

### Install GDB dashboard
(This step is optional, doesn't make any functional difference)

The dashboard gives a better visualization of all registers, threads, assembly code while running on QEMU and debugging through GDB. 

Get the .gdbinit file from the repo https://github.com/cyrus-and/gdb-dashboard, 
place it in home directory

Run the below cmd on terminal to add this file path in the environment's .config

> `mkdir -p /home/codespace/.config/gdb`

> `echo 'add-auto-load-safe-path /workspaces/scheduler-on-assembly/.gdbinit' >> /home/codespace/.config/gdb/gdbinit`

### Writing the Makefile

__build:__ creates the object from asmmebly, then the executable and linkable format. Also, `.lst` and .`debug` from the `.elf` for debugging through QEMU and GDB

__qemu:__ starts emulation of ARM cpu on the QEMU on given port

__gdb:__ attaches the GNU debugger to the QEMU execution

__clean:__ removes all the `.elf` `.o` `.debug` `.lst` `.out` etc, basically the files generated during compilation and NOT wrote by us. 