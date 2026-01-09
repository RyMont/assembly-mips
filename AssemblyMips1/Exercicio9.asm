.data
    n1:.asciiz"\nDigite um número: "
    n2:.asciiz"\nDigite outro número: "
    res:.asciiz"\nO resultado da divisão é: "
.text
main:
    #ler n1
    li $v0, 4
    la $a0, n1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #n2
numero2:
    li $v0, 4
    la $a0, n2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0
    beq $t1, 0, numero2

    #div
    div $t2, $t0, $t1

    #mostrar resultado
    li $v0, 4
    la $a0, res
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall