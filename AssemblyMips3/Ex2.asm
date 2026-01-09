.data
    digite:.asciiz"\nDigite o raio: "
    comprimento:.asciiz"\nO comprimento da circunferência é: "
.text
main:
    #receber o valor do raio e salvar em $t0
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #calcular o comprimento
    mul $t0, $t0, 6 #2*pi(3)*r = 6r

    #mostrar na tela
    li $v0, 4
    la $a0, comprimento
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall