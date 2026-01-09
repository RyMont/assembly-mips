.data
    valor1:.asciiz"\nDigite o primeiro valor($t0): "
    valor2:.asciiz"\nDigite o primeiro valor($t1): "
    valorf1:.asciiz"\nO valor no $t0, é;"
    valorf2:.asciiz". e o valor em $t1 é:"
.text
main:
    #ler valor1
    li $v0, 4
    la $a0, valor1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #ler valor2
    li $v0, 4
    la $a0, valor2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #trocando os valores
    add $t2, $t0, 0 #intermediario pq sim
    add $t0, $t1, 0
    add $t1, $t2, 0

    #mostrando na tela
    li $v0, 4
    la $a0 valorf1
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall
    li $v0, 4
    la $a0 valorf2
    syscall
    li $v0, 1
    add $a0, $t1, 0
    syscall