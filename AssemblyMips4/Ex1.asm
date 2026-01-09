.data
	digite:.asciiz"\nDigite o valor em m²: "
	resul:.asciiz"\nO resultado em cm² é: "
.text
main:
	#ler num
	li $v0, 4
	la $a0, digite
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#transformar
	mul $t0, $t0, 10000
	
	#mostrar
	li $v0, 4
	la $a0, resul
	syscall
	li $v0, 1
	add $a0, $t0, 0
	syscall
