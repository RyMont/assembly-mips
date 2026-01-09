.data
    num1:.asciiz"\nDigite o primeiro número: "
    num2:.asciiz"\nDigite o segundo número: "
    numiguais:.asciiz"\nOs números são iguais"
    maior:.asciiz"\nO maior número é: "
    menor:.asciiz"\nE o menor número é: "
    ponto:.asciiz"."
.text
main:
    #lendo os valores
    li $v0, 4
    la $a0, num1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    li $v0, 4
    la $a0, num2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #vendo se sao iguais ou n
    beq $t0, $t1, iguais
    j qualmenoroumaior

iguais:
    li $v0, 4
    la $a0, numiguais
    syscall
    j fim

qualmenoroumaior: #t0 sempre será o maior, e t1 o menor
    bgt $t0, $t1, escrevernatela
    add $t2, $t0, 0
    add $t0, $t1, 0
    add $t1, $t2, 0

escrevernatela:
    li $v0, 4
    la $a0, maior
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall
    li $v0, 4
    la $a0, ponto
    syscall

    li $v0, 4
    la $a0, menor
    syscall
    li $v0, 1
    add $a0, $t1, 0
    syscall

fim:
    li $v0, 4
    la $a0, ponto
    syscall