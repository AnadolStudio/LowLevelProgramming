 .text
__start:
.globl __start

 lw a3, array_length # a3 — длина<массива>
 la a4, array # ad = anpecc 0гo— элемент массива>
 slli a6, a3, 2 # a6 = a3*4
 add a6, a4, a6 # a6 = ad+a3ed
 addi a6, a6, -4 #last el

loop:
 bgeu zero, a3, loop_exit # if( 0 >= a3 ) goto loop_exit

 li a2, 1 # ad=1
 addi a7, a4, 0 #max place
 lw t2, 0(a7) #max = 1 element
 add a5, a4, zero #a5 — first element

  loop2:
  bgeu a2, a3, loop2_exit # if( a2 > a3 ) goto loop_exit
  addi a5, a5, 4 # a5 = a5 + 4
  addi a2, a2, 1 # a2 4-1
  lw t3, 0(a5)
  bgeu t2, t3, loop2 # if( t2 >= t3 ) goto loop_exit
  addi a7, a5, 0 #max place
  lw t2, 0(a7) #max
  jal zero, loop2
  loop2_exit:

  addi a3, a3, -1 # ab = ad - 4 len -1

  lw t1, 0(a6) # tl = array[last]
  lw t0, 0(a7) # tO = array[i]
  sw t1, 0(a7) # array[i] — tl
  sw t0, 0(a6) # array[last] — t0

  addi a6, a6, -4 # a6 ~ a6 + (4) a6—4 last element -1
  
  jal zero, loop # goto loop

loop_exit:
finish:
 li a0, 10
 li a1, 0
 ecall
 .rodata
array_length:
 .word 10
.data
array:
 .word 1, 5, 3, 6, 9, 2, 4, 7, 10, 8