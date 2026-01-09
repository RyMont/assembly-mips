.data
    coefa:.asciiz"\nDigite o coeficiente A: "
    coefb:.asciiz"\nDigite o coeficiente B: "
    coefc:.asciiz"\nDigite o coeficiente C: "
    menorqzero:.asciiz"\nNão existem raízes reais"
    zerin:.asciiz"\nExiste uma raíz real"
    maiorqzero:.asciiz"\nExistem duas raízes reais"
    ponto:.asciiz"."
.text
main:
    #coletandos os coeficientes
    li $v0, 4
    la $a0, coefa
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    li $v0, 4
    la $a0, coefb
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0
    li $v0, 4
    la $a0, coefc
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, 0

    #calculando o delta
    mul $t1, $t1, $t1
    mul $t3, $t0, $t2
    mul $t3, $t3, -4
    add $t3, $t1, $t3

    #vendo as endless possibilities
    beq $t3, 0, zero
    blt $t3, 0, menor
    bgt $t3, 0, maior

zero:
    li $v0, 4
    la $a0, zerin
    syscall
    j fim

menor:
    li $v0, 4
    la $a0, menorqzero
    syscall
    j fim

maior:
    li $v0, 4
    la $a0, maiorqzero
    syscall
    j fim

fim:
    la $a0, ponto
    syscall