.data
    cat1: .asciiz"\nDigite o primeiro cateto: "
    cat2: .asciiz"\nDigite o segundo cateto: "
    hip: .asciiz"\nO valor da hipotenusa é: "
.text
main:
    #cat1
    li $v0, 4
    la $a0, cat1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #cat2
    li $v0, 4
    la $a0, cat2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #calculando hipotenusa
    mul $t0, $t0, $t0
    mul $t1, $t1, $t1
    add $t2, $t0, $t1
    bgt $t2, 0, raiz

    li $t3, 0
raiz:
    sub $t2, $t2, $t3
    add $t3, $t3, 2
    add $t4, $t4, 1
    bge $t2, $t3, raiz
    
    li $v0, 4
    la $a0, hip
    syscall
    li $v0, 1
    add $a0, $t4, 0
    syscall