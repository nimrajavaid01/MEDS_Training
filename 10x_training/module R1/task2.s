.data

newline: .asciiz "\n"     # for printing newline
.text
.globl main

# Function: sub(a, b) = a - b
sub:
    sub x10, x10, x11     # x10 = a - b
    ret

# Function: compare(a, b)
# Returns 1 if a >= b, else 0
compare:
    addi x2, x2, -16      # reserve 16 bytes on stack
    sw x1, 12(x2)         # save return address

    mv x5, x10            # save a to x5
    mv x6, x11            # save b to x6

    mv x10, x5            # set up a
    mv x11, x6            # set up b
    call sub              # call sub(a, b)

    bge x10, x0, ge       # if a - b >= 0, go to ge
    li x10, 0             # return 0
    j comp_ret

ge:
    li x10, 1             # return 1

comp_ret:
    lw x1, 12(x2)         # restore return address
    addi x2, x2, 16       # free stack
    ret

# Function: main = dataArray(num)
main:
    li x10, 5             # x10 = num
    mv x9, x10            # x9 = num (save for reuse)

    addi x2, x2, -52      # reserve space for array + 2 saved regs
    sw x1, 48(x2)         # save return address
    sw x8, 44(x2)         # save i

    li x8, 0              # x8 = i = 0
    li x7, 10             # x7 = constant 10

loop:
    bge x8, x7, print_all # if i >= 10, jump to print_all

    mv x10, x9            # x10 = num
    mv x11, x8            # x11 = i
    call compare          # call compare(num, i), result in x10

    slli x5, x8, 2        # x5 = i * 4 (byte offset)
    add x6, x2, x5        # x6 = &array[i]
    sw x10, 0(x6)         # array[i] = result

    addi x8, x8, 1        # i++
    j loop

# Print array
print_all:
    li x8, 0              # i = 0
    li x7, 10             # upper bound = 10

print_loop:
    bge x8, x7, exit      # if i >= 10, done printing

    slli x5, x8, 2        # offset = i * 4
    add x6, x2, x5        # x6 = &array[i]
    lw x11, 0(x6)         # x11 = array[i]

    li x10, 1             # syscall: print_int
    ecall

    li x10, 4             # syscall: print_string
    la x11, newline
    ecall

    addi x8, x8, 1        # i++
    j print_loop

# Exit the program
exit:
    lw x1, 48(x2)         # restore return address
    lw x8, 44(x2)         # restore i
    addi x2, x2, 52       # free stack

    li x10, 10            # syscall: exit
    ecall

