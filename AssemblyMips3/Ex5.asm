.data
    digite1:.asciiz"\nDigite o primeiro número: "
    digite2:.asciiz"\nDigite o segundo número: "
    somatoria:.asciiz"\nA somatória dos números ímpares entre os números digitados é: "
.text
main:
    #ler num1
    li $v0, 4
    la $a0, digite1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    #ler num2
    li $v0, 4
    la $a0, digite2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #comparacoes
    bgt $t1, $t0, t1maior
    j loop
    
t1maior:
    #muda o maior valor para $t0
    add $t2, $t0, 0
    add $t0, $t1, 0
    add $t1, $t2, 0

loop:
    add $t1, $t1, 1
    add $t2, $t1, 0
    beq $t1, $t0, fim
    #vendo se é par ou impar
    beq $t2, 0, par
    blt $t2, 0, negativo
    bgt $t2, 0, positivo

negativo:
    add $t2, $t2, 2
    blt $t2, 0, negativo
    j parimpar

positivo:
    sub $t2, $t2, 2
    bgt $t2, 0, positivo
    j parimpar

parimpar:
    beq $t2, 0, par
    j impar

par:
    j loop

impar:
    add $t3, $t3, $t1
    j loop

fim:
    li $v0, 4
    la $a0, somatoria
    syscall
    li $v0, 1
    add $a0, $t3, 0
    syscall