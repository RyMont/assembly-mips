.data
    digite1:.asciiz"\nDigite o valor 1: "
    digite2:.asciiz"\nDigite o valor 2: "
    resultado:.asciiz"\no resultado da diferença do maior pelo menor é: "
.text
main:
    #receber valor1
    li $v0, 4
    la $a0, digite1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    #receber valor2
    li $v0, 4
    la $a0, digite2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #verificar qual é o maior e menor, $t0 sempre será o maior
    bgt $t0, $t1, fim
    add $t2, $t0, 0
    add $t0, $t1, 0
    add $t1, $t2, 0
    j fim

fim:
    sub $t2, $t0, $t1
    
    #printar na tela
    li $v0, 4
    la $a0, resultado
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall