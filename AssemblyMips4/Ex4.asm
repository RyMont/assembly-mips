.data
	digite:.asciiz"\nDigite um número maior que zero e até 50: "
	soma:.asciiz"\nA soma dos números de 1 até o numero digitado é: "
.text
main:
	li $v0, 4
	la $a0, digite
	syscall
	li $v0, 5
	syscall
	ble $v0, 0, main
	bgt $v0, 50, main
	add $t0, $v0, 0
	
	li $t1, 1
loop:
	add $t2, $t2, $t1
	add $t1, $t1, 1
	add $t4, $t4, 1
	beq $t4, $t0, fim
	j loop
fim:
	li $v0, 4
	la $a0, soma
	syscall
	li $v0, 1
	add $a0, $t2,0
	syscall