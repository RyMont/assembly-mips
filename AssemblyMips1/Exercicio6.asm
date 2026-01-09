.data
    a:.asciiz"\nDigite o primeiro valor: "
    b:.asciiz"\nDigite o segundo valor: " 
    c:.asciiz"\nO valor C é: "
.text
main:
    #valora
    li $v0, 4
    la $a0, a
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #valorb
    li $v0, 4
    la $a0, b
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #se forem iguais, vai pra soma, senao vai continuar e dps pro fim
    beq $t0, $t1, soma
    mul $t2, $t1, $t0
    j final

soma:
    add $t2, $t0, $t1
    j final

final:
    li $v0, 4
    la $a0, c
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall