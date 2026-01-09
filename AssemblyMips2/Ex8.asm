.data
    valor:    .asciiz "\nDigite o valor da compra (1000 a 9999): "
    parc:     .asciiz "\nDigite o valor da parcela (100 a 500): "
    result:   .asciiz "\nQuantidade de parcelas: "

.text
main:
    #ler valor da compra
    li $v0, 4
    la $a0, valor
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0         # $t0 = valor da compra
    blt $t0, 1000, main
    bgt $t0, 9999, main

    #ler valor da parcela
ler_parcela:
    li $v0, 4
    la $a0, parc
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0         # $t1 = valor da parcela
    blt $t1, 100, ler_parcela
    bgt $t1, 500, ler_parcela

loop:
    sub $t0, $t0, $t1       #total-parcela
    add $t3, $t3, 1        #parcela+1
    bge $t0, $t1, loop      #enquanto couber uma parcela no valor total, continua
    bgt $t0, 0, ultima      #se existir uma ultima parcela menor vai pra esse lugar calcular ela
    j fim

ultima:
    add $t3, $t3, 1        # parcela+1

fim:
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    add $a0, $t3, 0     # printa total de parcelas
    syscall