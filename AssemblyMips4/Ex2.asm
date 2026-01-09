.data
	n1:.asciiz"\nDigite o valor da n1: "
	n2:.asciiz"\nDigite o valor da n2: "
	n3:.asciiz"\nDigite o valor da n3: "
	reprov:.asciiz"\nReprovado."
	aprov:.asciiz"\nAprovado"
.text
main:
	li $v0, 4
	la $a0, n1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	blt $t0, 0, main
	bgt $t0, 100, main
	mul $t0, $t0, 30
	div $t0, $t0, 100
nota2:
	li $v0, 4
	la $a0, n2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	blt $t1, 0, nota2
	bgt $t1, 100, nota2
	mul $t1, $t1, 50
	div $t1, $t1, 100
nota3:
	li $v0, 4
	la $a0, n3
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0
	blt $t2, 0, nota2
	bgt $t2, 100, nota2
	mul $t2, $t2, 20
	div $t2, $t2, 100
	
	add $t4, $t0, $t1
	add $t4, $t4, $t2
	
	blt $t4, 60, reprovado
	li $v0, 4
	la $a0, aprov
	syscall
	j fim
reprovado:
	li $v0, 4
	la $a0, reprov
	syscall
fim: