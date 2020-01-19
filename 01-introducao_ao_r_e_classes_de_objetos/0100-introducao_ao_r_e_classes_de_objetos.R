# Introdução ao R e classes de objetos




# R != RStudio


### Introdução ao R e classes de objetos

## integer
1
-2
0
999999999
a <- 13
b <- 6
c <- 12
d <- -10

# Aritmética básica
1+1
333-33
b*d
e <- c/b
d^e
f <- a/b

## Questão
# Pedrinho comprou um lote com 15 metros de largura e 88 de comprimento. 
# Qual a área do lote de Pedrinho?

# Solução: 


## numeric
# numerics usam pontos (.) para representar decimais
1.2
f
pi
e

# Aritimética intermediaria
(2*(1+3)+3^2*(1+1))
aa <- (4/(5-1)+5*(10/2))/3
aa
(88*17)/(4/2)
bb <- (88*17)/(4/2)



## vector
c(1,2,3)
v2 <- c(1:10)
v3 <- c(10:1)
v4 <-c(pi:10)
seq(1,100)
seq(from=2, to=20)
seq(from=2, to=20, by=2)
seq(from=1, to=2, length = 11)
length(v2)
4:length(v2)
rep(c(1,2,3), times=5)

# Operações entre vetores
v2
v3
v2+v3
v2-v3
v2*v3
v2/v3
v2^v3
v2^(-v3)
v2^-(v3)

v4 <- seq(from=1, to=13, by=1)
v2+v4 # ops, um objeto maior que o outro e não multiplos em tamanho

v5 <- seq(from=1, to=20, by=1)
v2+v5 # aeee, objetos maiores, mas multiplos em tamanho


### funções

ls() # Lista os objetos do ambiente (environment)

help(ls) # Função para saber mais sobre alguma função
?ls() # Prefiro assim...

v6 <- c(1,1,2,2,2,1,2,1,3,1000)
mean(v6)
median(v6)
summary(v6)


# Questão
# Maria é autônoma, e nos ... (questao com distribuição)




### Indexação
# Podemos chegar a valores específicos em vetores e outros objetos através de indexação.
v7 <- c(10,20,30,40,50,60,70)
v7
v7[1]
v7[2]
v7[-1]
v7[-2]
v7[1:3]
v7[-1:3] #ops
v7[-c(1:3)]

# Logicamente, podemos fazer operações entre esses valores*.
v7[1]/2
v7[1]+v7[7]
v7[2]^4

# Assim como ser substituídos
v7[1] <- -1
v7[1]



# logic (boolean)


## matrix


## character  (string)




## data.frame




## list











### Recomendações:


# 1. Linguagem R - Wikipedia = https://pt.wikipedia.org/wiki/R_(linguagem_de_programa%C3%A7%C3%A3o)

# 2. r-base - Curso R = https://www.curso-r.com/material/r-base/

# 2. Vocabulary - Advanced R = http://adv-r.had.co.nz/Vocabulary.html

# 3. Trends - Stack overflow = https://insights.stackoverflow.com/trends?tags=r%2Cpython

# 4. App - Datacamp = AppStore



