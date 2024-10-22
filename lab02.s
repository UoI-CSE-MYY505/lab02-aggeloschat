
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
# Write your code here!
# Do not remove the prog label or write code above it!

findBackwards:
    beq a1,zero,ret0 # If array is size 0 returns 0
    slli s0,a1,2     # Size of array multiplied with 4. We store in s0 how many bytes to move from the start of the array to get to one word after the last word of the array
    add s0,s0,a0     
loop:                # Loop until we find the element of the array we want but backwards,if we get to the first element of the array and did not find the element we searched for returns 0
    addi s0,s0,-4
    lw t1, 0x0(s0)
    beq t1,a2,done
    beq s0,a0,ret0
    j loop

ret0:
    add s0,zero,zero # Not found

#-----------------------------
done:
    addi a7, zero, 10 
    ecall
