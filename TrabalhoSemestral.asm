.data
    digite:.asciiz"\nDigite um número: "
    saida1:.asciiz"\nO número digitado é um palíndromo."
    saida2:.asciiz"\nO número digitado não é um palíndromo, e o palíndromo anterior mais proximo dele é: "
.text
#comentario após terminar, parece mto com o ex 7 da lista 2
#só tive q comparar os coiso de milhar, centena, dezena e unidade pra ver se é palindromo
#se n for, só fui tirando 1 do numero e verificando até ele ser um palindromo :)
main:
    #receber numero
    li $v0, 4
    la $a0, digite
    syscall
    li $v0, 5
    syscall
    #verificar se é maior que 1 e menor que 10000
    ble $v0, 1, main
    bge $v0, 10000, main
    add $t0, $v0, 0 #se for maior q 1 e menor q 10000, o numero é validado, yay...

loop: #voltando no comeco pra botar esse loop aq pra funcionar a verificacao do palindromo
    #ver os digitos significativos(é assim q se chama?) do numero
    div $t1, $t0, 1000  #$t1 milhar
    mul $t5, $t1, 1000  #numero de milhares por extenso 
    sub $t5, $t0, $t5   #$t5 resto sem milhar
    div $t2, $t5, 100   #$t2 centena
    mul $t6, $t2, 100   #numero de centenas por extenso 
    sub $t5, $t5, $t6   #$t5 resto sem centena
    div $t3, $t5, 10    #$t3 dezena
    mul $t6, $t3, 10    #numero de dezenas por extenso 
    sub $t4, $t5, $t6   #$t4 unidade

    #dependendo do tamanho do numero as comparacao vai ser diferente, se a logica funcionar kk
    bge $t0, 1000, milhar
    bge $t0, 100, centena
    bge $t0, 10, dezena
    j verdadeiropalindromo

milhar:
    beq $t1, $t4, milharpt2
    j naoepalindromo

milharpt2:
    beq $t2, $t3, verdadeiropalindromo
    j naoepalindromo

centena:
    beq $t2, $t4, verdadeiropalindromo
    j naoepalindromo

dezena:
    beq $t3, $t4, verdadeiropalindromo
    j naoepalindromo

naoepalindromo:
    sub $t0, $t0, 1 #subtrair 1 do numero digitado pra ver se ele vai ser um palindromo
    add $t7, $t7, 1 #contadorzinho pra saber se o numero original era um palindromo ou n
    j loop #voltar pra verificar se o novo numero é um palindromo ou n

verdadeiropalindromo:
    bgt $t7, 0, numerodigitadonpalindromo
    li $v0, 4
    la $a0, saida1
    syscall
    j fim

numerodigitadonpalindromo:
    li $v0, 4
    la $a0, saida2
    syscall
    li $v0, 1
    add $a0, $t0, 0
    syscall

fim: