.data
    digite:.asciiz"\nDigite um número: "
    maiornum:.asciiz"\nO maior número é: "
    menornum:.asciiz"\nO menor número é: "
.text
main:
    #receber valor primeiro valor pra usar de comparacao pros outros dps
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    blt $t0, 0, main
    add $t1, $t0, 0
    add $t2, $t0, 0
    j contador

loop:
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    blt $t0, 0, loop
    bgt $t0, $t1, maior
    blt $t0, $t2, menor

contador:
    add $t3, $t3, 1
    beq $t3, 10, fim
    j loop

maior:
    add $t1, $t0, 0
    j contador

menor:
    add $t2, $t0, 0
    j contador

fim:
    #printar na tela
    li $v0, 4
    la $a0, maiornum
    syscall
    li $v0, 1
    add $a0, $t1, 0
    syscall
    li $v0, 4
    la $a0, menornum
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall