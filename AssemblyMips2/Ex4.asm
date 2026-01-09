.data
    digite:.asciiz"\nDigite o valor do salario: "
    reajuste:.asciiz"\nO novo salario será de: R$"
.text
main:

    #ler numero
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #calculando reajuste
    mul $t0, $t0, 125
    div $t0, $t0, 100


    #mostrando na tela
    li $v0, 4
    la $a0 reajuste
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall