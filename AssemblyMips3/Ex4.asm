.data
    digite1:.asciiz"\nDigite a nota 1: "
    digite2:.asciiz"\nDigite a nota 2: "
    digite3:.asciiz"\nDigite a nota 3: "
    digite4:.asciiz"\nDigite a nota 4: "
    aprovado:.asciiz"\nAPROVADO"
    exame:.asciiz"\nEXAME"
    reprovado:.asciiz"\nREPROVADO"
    ponto:.asciiz"." #esse aq é so pra facilitar minha vida no codigo msm :)
.text
main:
    #receber nota1
    li $v0, 4
    la $a0, digite1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, 0
    #receber nota2
    li $v0, 4
    la $a0, digite2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, 0
    #receber nota3
    li $v0, 4
    la $a0, digite3
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, 0
    #receber nota4
    li $v0, 4
    la $a0, digite4
    syscall
    li $v0, 5
    syscall
    add $t3, $v0, 0

    #calculando a media
    add $t4, $t0, $t1
    add $t4, $t4, $t2
    add $t4, $t4, $t3
    div $t4, $t4, 4

    #vendo qual mensagem vai printar
    bge $t4, 6, maiorq6
    blt $t4, 3, menorq3

    #printando 3<=media<6
    li $v0, 4
    la $a0, exame
    syscall
    j fim

maiorq6:
    li $v0, 4
    la $a0, aprovado
    syscall
    j fim

menorq3:
    li $v0, 4
    la $a0, reprovado
    syscall

fim:
    la $a0, ponto
    syscall