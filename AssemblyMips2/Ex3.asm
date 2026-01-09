.data
    mesnasc: .asciiz "\nDigite o mes de nascimento (1 a 12): "
    anonasc: .asciiz "\nDigite o ano de nascimento: "
    mesatual: .asciiz "\nDigite o mes atual (1 a 12): "
    anoatual: .asciiz "\nDigite o ano atual: "
    resultado: .asciiz "\nIdade em meses: "

.text
main:
    #mes nascimento
    li $v0, 4
    la $a0, mesnasc
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #ano nascimento
    li $v0, 4
    la $a0, anonasc
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #mes atual
    li $v0, 4
    la $a0, mesatual
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, 0

    #ano atual
    li $v0, 4
    la $a0, anoatual
    syscall
    li $v0, 5
    syscall
    add $t3, $v0, 0

    #anos para meses
    sub $t4, $t3, $t1
    mul $t4, $t4, 12

    #meses 
    sub $t6, $t2, $t0
    #meses total
    add $t7, $t4, $t6

    #exibir resultado
    li $v0, 4
    la $a0, resultado
    syscall
    li $v0, 1
    add $a0, $t7, 0
    syscall