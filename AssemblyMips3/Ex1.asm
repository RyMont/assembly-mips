.data
    digitecomp:.asciiz"\nDigite o comprimento: "
    digitelarg:.asciiz"\nDigite a largura: "
    digitealtu:.asciiz"\nDigite a altura: "
    volume:.asciiz"\nO volume é: "
.text
main:
    #comprimento em $t0
    li $v0, 4
    la $a0, digitecomp
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    #largura em $t1
    li $v0, 4
    la $a0, digitelarg
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0
    #altura em $t2
    li $v0, 4
    la $a0, digitealtu
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, 0

    #calculando o volume
    mul $t3, $t0, $t1
    mul $t3, $t3, $t2

    #mostrar na tela
    li $v0, 4
    la $a0, volume
    syscall
    li $v0, 1
    add $a0, $t3, 0
    syscall