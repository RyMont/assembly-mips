.data
    var:.asciiz"\nDigite um numero: "
    res:.asciiz"\nO resultado é: "
.text
main:
    #ler var
    li $v0, 4
    la $a0, var
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    add $t1, $t0, 0

    #pra ver pra qual branch vai
    beq $t0, 0, par
    blt $t0, 0, negativo
    bgt $t0, 0, positivo

negativo:
    add $t1, $t1, 2
    blt $t1, 0, negativo
    j parimpar

positivo:
    sub $t1, $t1, 2
    bgt $t1, 0, positivo
    j parimpar

parimpar:
    beq $t1, 0, par
    j impar

par:
    add $t0, $t0, 5
    j fim

impar:
    add $t0, $t0, 8
    j fim

fim:
    li $v0, 4
    la $a0, res
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall