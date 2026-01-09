.data
    n1:.asciiz"\nDigite um número: "
    n2:.asciiz"\nDigite outro número: "
    res:.asciiz"\nO resto é: "
.text
main:
    #esse deu trabalho pra pensar, maldade
    #ler n1
    li $v0, 4
    la $a0, n1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0

    #ler n2
    li $v0, 4
    la $a0, n2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0

    #menor ou maior
    bgt $t0, $t1, t0maior
    j t1maior

    #resultado divisao salvo em $t2
t0maior:
    div $t2, $t0, $t1 
    add $t3, $t1, 0
    add $t5, $t0, 0
    j calculos
t1maior:
    div $t2, $t1, $t0
    add $t3, $t0, 0
    add $t5, $t1, 0
    j calculos

calculos:
    mul $t4, $t2, $t3
    sub $t5, $t5, $t4

    li $v0, 4
    la $a0, res
    syscall
    li $v0, 1
    add $a0, $t5, 0
    syscall