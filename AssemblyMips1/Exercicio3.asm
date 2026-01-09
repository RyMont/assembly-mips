.data
    htrab: .asciiz"\nDigite o número de horas trabalhadas: "
    hextr: .asciiz"\nDigite o número de horas extras: "
    desct: .asciiz"\nDigite o percentual de desconto (sem o simbolo de %, somente o numero em si, ex 5% digite 5): "
    bruto: .asciiz"\nO salário bruto é: R$"
    liqui: .asciiz"\nO salário liquido é: R$"
.text
main:
    #mostrar a mensagem htrab
    li $v0, 4
    la $a0, htrab
    syscall
    #salvar o numero de hrs no reg t0
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #mostrar a mensagem hextr
    li $v0, 4
    la $a0, hextr
    syscall
    #salvar o numero de hrs no reg t1
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #mostrar a mensagem desct
    li $v0, 4
    la $a0, desct
    syscall
    #salvar o desconto no reg t2
    li $v0, 5
    syscall
    add $t2, $v0, 0

    #calcular o salário bruto e salvar no reg t3
    mul $t0, $t0, 10
    mul $t1, $t1, 15
    add $t3, $t0, $t1

    #calculo desconto
    mul $t4, $t3, $t2
    div $t4, $t4, 100

    #calculo salario liquido
    sub $t4, $t3, $t4

    #mostrar o salario bruto
    li $v0, 4
    la $a0, bruto
    syscall
    li $v0, 1
    add $a0, $t3, 0
    syscall

    #mostrar o salario liquido
    li $v0, 4
    la $a0, liqui
    syscall
    li $v0, 1
    add $a0, $t4, 0
    syscall