.data
    digite:    .asciiz "\nDigite a altura em centímetros: "
    menoralt:  .asciiz "\nA menor altura é: "
    maioralt:  .asciiz "\nA maior altura é: "
    cm:        .asciiz " centímetros."

.text
main:
    #ler altura
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    add $t1, $t0, 0
    add $t2, $t0, 0
    j contador
loop:
    #ler altura
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #comparações
    bgt $t0, $t1, maior
    blt $t0, $t2, menor
    j contador

maior:
    add $t1, $t0, 0
    j contador

menor:
    add $t2, $t0, 0
    j contador

contador:
    add $t3, $t3, 1
    beq $t3, 15, fim
    j loop

fim:
    #printar maior altura
    li $v0, 4
    la $a0, maioralt
    syscall
    li $v0, 1
    add $a0, $t1, 0
    syscall
    li $v0, 4
    la $a0, cm
    syscall

    #printar menor altura
    li $v0, 4
    la $a0, menoralt
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall
    li $v0, 4
    la $a0, cm
    syscall