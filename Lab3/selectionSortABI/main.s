# main.s
 .text
 main:
 .globl main
 addi sp, sp, -16 # выделение памяти в стеке
 sw ra, 12 ( sp ) # сохранение ra

 la a0, array #
 lw a1, array_length # sort ( array, array_length );
 call sort 
 li a0, 0 

 lw ra, 12 ( sp ) # восстановление ra
 addi sp, sp, 16 # освобождение памяти в стеке
 ret # return 0;
 .rodata
 array_length:
 .word 10
 .data
 array:
 .word 6, 7, 8, 9, 9, 1, 2, 3, 4, 5