.data
    num:.asciiz"\nDigite um número: "
    res:.asciiz"\nO resultado é: "
.text
main:
    #ler num
    li $v0, 4
    la $a0, num
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #pra ver pra qual branch vai
    bgt $t0, 0, positivo
    blt $t0, 0, negativo

negativo:
    mul $t0, $t0, 3
    j fim

positivo:
    mul $t0, $t0, 2
    j fim

fim:
    li $v0, 4
    la $a0, res
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall