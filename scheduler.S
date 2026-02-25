# systick configuration registers
.equ systick_csr,   0xE000E010
.equ systick_rvr,   0xE000E014
.equ systick_cvr,   0xE000E018
.equ systick_calib, 0xE000E01C
.equ timeout,       0x00FFFFFF

.section .vectors
vector_table:
    .word 0x20001000
    .word reset_handler
.org 0x3C
    .word systick_handler
    .zero 400

    .section .text
    .align 1
    .type reset_handler, %function
reset_handler:
    mov r4, #0x01     @dummy values to test context switching
    mov r5, #0x02     @dummy values to test context switching
    mov r6, #0x03     @dummy values to test context switching
    mov r7, #0x04     @dummy values to test context switching

    mov r8, r4     @dummy values to test context switching
    mov r9, r5     @dummy values to test context switching
    mov r10, r6    @dummy values to test context switching
    mov r11, r7    @dummy values to test context switching

    ldr r0, =systick_csr
    ldr r1, =systick_rvr
    ldr r2, =systick_cvr
    ldr r3, =timeout

    str r3, [r1]      @ set reload value

    mov r3, #0x0
    str r3, [r2]      @ clear current value

    mov r3, #0x7
    str r3, [r0]      @ enable systick with interrupt

    b .

    .section .text
    .align 1
    .type systick_handler, %function
systick_handler:

    push {r0-r7}
    
    mov r0, r8
    mov r1, r9
    mov r2, r10
    mov r3, r11

    push {r0-r3}

reset_all_registers:

    mov r0, #0x00
    mov r1, #0x00
    mov r2, #0x00
    mov r3, #0x00
    mov r4, #0x00
    mov r5, #0x00
    mov r6, #0x00
    mov r7, #0x00
    mov r8, r0
    mov r9, r1
    mov r10, r2
    mov r11, r3

switch_context:

    pop {r0-r3}

    mov r8, r0
    mov r9, r1
    mov r10, r2
    mov r11, r3

    pop {r0-r7}

branch_return:

    bx lr
