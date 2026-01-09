.data
    digite:.asciiz"\nDigite um número: "
    invalido:.asciiz"\nDigite um número valido entre 0 e 100: "
    lim1:.asciiz"\nTotal de números entre 0 e 25: "
    lim2:.asciiz"\nTotal de números entre 26 e 50: "
    lim3:.asciiz"\nTotal de números entre 51 e 75: "
    lim4:.asciiz"\nTotal de números entre 76 e 100: "
.text
main:
    #ler numero
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    blt $t0, 0, fim
    bgt $t0, 100, invalid
    j verificações
    
invalid:
    li $v0, 4
    la $a0, invalido
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    bgt $t0, 100, invalid
    
    #verificações
verificações:
    ble $t0, 25, entre0e25
    ble $t0, 50, entre26e50
    ble $t0, 75, entre51e75
    ble $t0, 100, entre76e100

entre0e25:
    add $t1, $t1, 1
    j main
entre26e50:
    add $t2, $t2, 1
    j main
entre51e75:
    add $t3, $t3, 1
    j main
entre76e100:
    add $t4, $t4, 1
    j main


    blt $t0, 0, fim


fim:
    #0a25
    li $v0, 4
    la $a0, lim1
    syscall
    li $v0, 1
    add $a0, $t1, 0
    syscall

    #26a50
    li $v0, 4
    la $a0, lim2
    syscall
    li $v0, 1
    add $a0, $t2, 0
    syscall

    #51a75
    li $v0, 4
    la $a0, lim3
    syscall
    li $v0, 1
    add $a0, $t3, 0
    syscall

    #76a100
    li $v0, 4
    la $a0, lim4
    syscall
    li $v0, 1
    add $a0, $t4, 0
    syscall