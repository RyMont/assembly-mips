.data
	idade:.asciiz"\nDigite a idade: "
	votaedirige:.asciiz"\nVota e dirige."
	votaendirige:.asciiz"\nVota e não dirige."
	nvota:.asciiz"\nNão vota nem dirige."
.text
main:
	li $v0, 4
	la $a0, idade
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	blt, $t0, 16, nada
	blt $t0, 18, vnd
	bge $t0, 18, ved
nada:
	li $v0, 4
	la $a0, nvota
	syscall
	j fim
vnd:
	li $v0, 4 
	la $a0, votaendirige
	syscall
	j fim
ved:
	li $v0, 4
	la $a0, votaedirige
	syscall
fim: