.data
    peq: .asciiz"\nDigite o número de camisetas pequenas: "
    med: .asciiz"\nDigite o número de camisetas médias: "
    big: .asciiz"\nDigite o número de camisetas grandes: "
    total: .asciiz"\nO total arrecadado foi: R$"
.text
main:
    #Escrevendo a mensagem peq
    li $v0, 4
    la $a0, peq
    syscall
    #salvando o valor inserido no peq
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #escrevendo a mensagem med
    li $v0, 4
    la $a0, med
    syscall
    #salvando o valor inserido no med
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #escrevendo a mensagem big
    li $v0, 4
    la $a0, big
    syscall
    #salvando o valor inserido no big
    li $v0, 5
    syscall
    add $t2, $v0, 0

    #gerando os valores de cada camiseta e o total arrecadado
    mul $t0, $t0, 10
    mul $t1, $t1, 12
    mul $t2, $t2, 15
    add $t4, $t0, $t1
    add $t4, $t4, $t2

    #escrevendo o total arrecadado
    li $v0, 4
    la $a0, total
    syscall
    li $v0, 1
    add $a0, $t4, 0
    syscall