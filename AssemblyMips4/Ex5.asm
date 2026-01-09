.data
	digiten:.asciiz"\nDigite o valor 'n': "
	digite:.asciiz"\nDigite um número: "
	positivos:.asciiz"\nQuantidade de números positivos digitados: "
	negativos:.asciiz"\nQuantidade de números negativos digitados: "
.text
main:
	li $v0, 4
	la $a0, digiten
	syscall
	li $v0, 5
	syscall
	ble $v0, 0, main
	bgt $v0, 10, main
	add $t0, $v0, 0

loop:
	li $v0, 4
	la $a0, digite
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0	
	blt $t1, 0, negativo
	bgt $t1, 0, positivo
	 	

positivo:
	add $t2, $t2, 1
	j ctd
negativo:
	add $t3, $t3, 1
	j ctd
ctd:
	add $t4, $t4, 1
	beq $t4, $t0, fim
	j loop
fim:
	li $v0, 4
	la $a0, positivos
	syscall
	li $v0, 1
	add $a0, $t2, 0
	syscall
	li $v0, 4
	la $a0, negativos
	syscall
	li $v0, 1
	add $a0, $t3, 0
	syscall
