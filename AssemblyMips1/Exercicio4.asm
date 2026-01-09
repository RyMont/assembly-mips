.data
    bmaior: .asciiz"\nDigite a base maior: "
    bmenor: .asciiz"\nDigite a base menor: "
    alt: .asciiz"\nDigite a altura: "
    area: .asciiz"A area deste trapezio é "
.text
main:
    #bmaior
    li $v0, 4
    la $a0, bmaior
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #bmenor
    li $v0, 4
    la $a0, bmenor
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #alt
    li $v0, 4
    la $a0, alt
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, 0

    #calculo area
    add $t3, $t0, $t1
    mul $t3, $t3, $t2
    div $t3, $t3, 2

    #mostrar na tela o resultado
    li $v0, 4
    la $a0, area
    syscall
    li $v0, 1
    add $a0, $t3, 0
    syscall