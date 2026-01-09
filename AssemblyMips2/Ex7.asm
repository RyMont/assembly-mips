.data
    digite:.asciiz"\nDigite um número entre 100 e 999: "
    centena:.asciiz"\nCentena = "
    dezena:.asciiz"\nDezena = "
    unidade:.asciiz"\nUnidade = "
.text
main:
    #ler num q vai ficar no $t1
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0
    blt $t1, 100, main
    bgt $t1, 999, main
    li $t3, 100

    #calcular centena e salvar em $t2
    div $t2, $t1, 100

    #calcular o numero de dezenas
    mul $t3, $t2, 100
    sub $t3, $t1, $t3
    div $t4, $t3, 10

    #calcular o numero de unidades
    mul $t5, $t4, 10
    sub $t5, $t3, $t5

    li $v0, 4
    la $a0, centena
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall
    li $v0, 4
    la $a0, dezena
    syscall
    li $v0, 1
    add $a0, $t4, 0
    syscall
    li $v0, 4
    la $a0, unidade
    syscall
    li $v0, 1
    add $a0, $t5, 0
    syscall