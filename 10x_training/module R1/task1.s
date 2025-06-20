.data
b:      .space 12              # Reserve space for 3 integers (3 * 4 bytes)

.text
.globl main
main:
    li s0, 7                   # s0 = a = 7
    li s1, 0                   # s1 = i = 0
    li s2, 3                   # s2 = loop limit
    la s3, b                   # s3 = base address of b

# ==== Fill b[i] = a + i * a ====
fill_loop:
    bge s1, s2, print_loop     # if i >= 3, go to print

    mul s4, s1, s0             # s4 = i * a
    add s5, s0, s4             # s5 = a + (i * a)

    slli s6, s1, 2             # s6 = i * 4 (offset)
    add s7, s3, s6             # s7 = b + offset
    sw s5, 0(s7)               # b[i] = result

    addi s1, s1, 1             # i++
    j fill_loop

# ==== Print b[i] ====
print_loop:
    li s1, 0                   # reset i = 0

print_next:
    bge s1, s2, exit           # if i >= 3, exit

    slli s6, s1, 2             # offset = i * 4
    add s7, s3, s6             # address = b + offset
    lw a1, 0(s7)               # load b[i]

    li a0, 1                   # syscall: print integer
    ecall

    li a0, 11                  # syscall: print char
    li a1, 10                  # newline
    ecall

    addi s1, s1, 1             # i++
    j print_next

exit:
    li a0, 10                  # syscall: exit
    ecall

