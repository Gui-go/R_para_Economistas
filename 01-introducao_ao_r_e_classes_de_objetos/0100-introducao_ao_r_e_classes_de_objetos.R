####   Introdução ao R e classes de objetos

###   Apresentação - Mosrtar a sintaxe do R, janelas, script, console, environment

print("Olá, mundo!!")

variavel <- "Olá, mundo!!"
variavel

var1 <- 2
var2 <- 13

var3 <- var1 * var2
var3

###   Diferentemente de nós humanos, o R, assim como qualquer outra linguagem de programação, 
###   não possui capacidade de abstração.

###   Em termos mais claros, o que deve-se deixar claro é que por vezes seu código irá retornar 
###   Resultados inesperados e dependerá da sua capacidade de abstração para perceber erros de sintaxe.

###   O R é "case sensitive" e por vezes basta uma boa revisão do código para resolver alguns obstaculos.


#   R != RStudio

#   R:   https://www.r-project.org/
#   RStudio:   https://rstudio.com/


###   Introdução ao R e classes de objetos

##   integer
1
-2
0
999999999

a <- 13
b <- 6
c <- 12
d <- -10

#   Aritmética básica
1+1
333-33
b*d
e <- c/b
d^e
f <- a/b

##   Questão
#   Pedrinho comprou um lote com 15 metros de largura e 88 de comprimento. 
#   Qual a área do lote de Pedrinho?

#   Solução: 


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
v2+v4 # ops, um objeto maior que o outro e não multiplos em tamanho.

v5 <- seq(from=1, to=20, by=1)
v2+v5 # aeee, objetos maiores, mas multiplos em tamanho


### funções
# geralmente assume forma como =>   verbo(argumento1, arg2, arg3)

ls() # Lista os objetos do ambiente (environment)

help(ls) # Função para saber mais sobre alguma função
?ls() # Prefiro assim...

v6 <- c(9,1,2,2,2,1,2,1,3,1000)
mean(v6) # Média
median(v6) # Mediana
summary(v6) # Sumario
sort(v6)



# Questão
# Maria é autônoma, e nos ... (questao com distribuição)




### Indexação
# Podemos chegar a valores específicos em vetores e outros objetos através de indexação.
v7 <- c(10,20,30,40,50,60,70)
v7
v7[1] # Primeiro elemento do vetor
v7[2] # Segundo elemento do vetor
v7[-1] # Todo o vetor com exceção do primeiro elemento
v7[-2] # Todo o vetor com exceção do segundo elemento
v7[1:3] # Os três primeiros elementos do vetor
v7[-1:3] #ops
v7[-c(1:3)] # Todo o vetor com exceção dos três primeiros elementos 

# Logicamente, podemos fazer tbm operações entre esses valores*.
v7[1]/2
v7[1]+v7[7]
v7[2]^4

# Assim como substituí-los
v7[1]
v7[1] <- -1
v7[1]
v7[2] <- c(2,2,2) #ops
v7[3:5] <- 0
v7
v7[4,5] #ops
v7[c(4,5)]
v7[c(4,5)] <- 4.5 # No R, vŕgulas servem para separar elementos e pontos para decimais
v7[-2] <- 6000
v7


length(v6)
length(v7) # Comprimento / quantidade de elementos num vetor
v7[length(v7)]

v7[length(v7)] <- median(v7) # Substitui o ultimo elemento do vetor pela mediana do vetor
v7[length(v7)-1] <- v7[length(v7)-1]^2 # Substitui o penultimo elemento por ele mesmo ao quadrado



# logic (boolean)

1>2
3<4
10==10.01
10==10.00
3.14!=3.141593
9.99<=10
13>=13.0000001

v8 <- c(10,20,30,40,50,60,70,80,90)
i=5
v8[i]==50
v8>=50
sqrt(121)==11
mean(v8)^3>=sum(v8)^2

v8[v8>=50] # Todos os elementos do vetor maiores ou iguais a 50
v8[v8>=50] <- 0

# mais boolean

#  &
#  |


T == TRUE
F == FALSE


### Algumas funcões úteis
j <- 9.4914
n1 <- rnorm(n = 100, mean = 10, sd = 2) # Uma distribuição normal aleatória com 100 elementos, média igual a 10 e desvio padrão igual a 2
n2 <- rnorm(n = 100, mean = 0, sd = 1) # Uma distribuição normal padrão
n1
n2

round(j) # Arredondamento
round(j, digits = 1)
round(j, digits = 2)

floor(j) # Chão
floor(n1)

ceiling(j) # Teto
ceiling(n2)

min(n1)
min(n2)

max(n1)
max(n2)

sd(n1) # Desvio padrão / Standard Deviation
sd(n2)

var(n1) # Variância
var(n2)

sd(n1)*sd(n1) == var(n1)                 #  var = sd^2
sd(n2)^2 == var(n2)



## Questão:
###  Se Juliana for contratada em janeiro, com um salario inicial de 1000 e com acrescimo salarial 230 reais 



## matrix
matrix(c(1,2,3,4))
matrix(data = c(1,2,3,4), nrow = 2)
matrix(data = c(1,2,3,4), nrow = 2, byrow = T)
matrix(data = c(1,2,3,4), nrow = 2, byrow = T, dimnames = list(c("r1", "r2"), c("c1", "c2")))

m1 <- matrix(data = c(1:9), nrow = 3, ncol = 3, byrow = T)
m1
colnames(m1)
colnames(m1) <- c("c1", "c2", "c3")
rownames(m1) <- c("r1", "r2", "r3")
m1

class(m1) # Portanto, segue as regras algebricas para matrizes

m2 <- matrix(c(1,1,2,2), nrow = 2, byrow = T)
m3 <- matrix(c(1,10,2,20), nrow = 2, byrow = T)

# Operações escalares
10*m2
m2*10
2/m2
m2/2
1000+m2
m2+1000

t(m2) # matriz transposta
t(t(m2)) # transposição de uma matriz transposta é ela mesma

# Operações entre matrizes (elemento a elemento)
m2+m3
m2+t(m3)
m2-m2
m2*m3 # multiplicação elemento a elemento
m2%*%m3 # multiplicação matricial
m2/m2
m2^m2

# Funções matriciais
m4 <- matrix(c(1,2,3,4,1,6,7,8,1), nrow = 3, byrow = F)
diag(m4)
diag(m3)

det(m2)
det(m3)
det(m4)

I <- diag(c(1,1,1)) # Matriz Identidade
I

A <- matrix(c(4,4,-2,2,6,2,2,8,4),3,3)
AI <- solve(A)

A%*%AI



solve(m2)

# Operções entre matrizes (Regras matriciais)


# Regra de kran



# Questão:
# Resolva esse sistema linear através de Kran





## character  (string)

c1 <- "Character"
c2 <- "String"
c3 <- "tanto faz"

c1+c2 #ops
paste(c1, c2)
paste0(c1, c2)

c4 <- paste0(c1, " ou ", c2, ", pra mim ", c3)
c4

nchar(c4) # Quantidade de characteres
nchar(c3)

toupper(c4) # Para maiúsculo
toupper(c2)

tolower(c4) # Para minúsculo
tolower(c1)

c5 <- c("Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado")

substr(x = c5, start = 1, stop = 3) # Subdividir string
substr(c5[1], 1, 3)
substr(c5[c(FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE)], 1, 3)

c6 <- 'vc pode usar aspas simples ou duplas, mas mantenha um padrão lógico'
c7 <- 'Há sempre uma "alternativa"'
c8 <- "Há sempre uma \"alternativa\""
c7==c8

str_detect(string = c7, pattern = "sem")



## data.frame

df <- data.frame(
  col1 = c(1,2,3,4,5,6,7,81,92,100),
  col2 = c("um", "dois", "tres", "quatro", "cinco", "seis", "sete", "outro", "n0ve", "Dez"),
  col3 = c(T, T, T, T, T, T, T, F, F, F),
  col4 = c(110:101),
  col5 = rep("repita"),
  col6 = seq(from = as.Date("2020/01/01"), by = "quarter", length.out = 10)
)

df
View(df) # Para ver o dataset em uma aba separata de modo mais organizado


head(df) # As 6 primeiras observações
head(df, n = 3)

tail(df) # As ultimas 6 observaçoes
tail(df, 4)


# Para selecionar um extrato de um dataframe, podemos:
df$col1
df[, "col1"]
df[,1]
df[[1]]
df[["col1"]]
df[,c(T,F,F,F,F,F,F,F,F,F)]

df[8,6]
df[9, "col1"]
df[c(1,2,3), c("col1", "col3")]                     #   Não esqueça de vetorizar com "c()"
df[c(1,2),c(1,2,3,4)]
df[df$col3==FALSE, c("col2", "col4", "col6")]
df[df$col1 >= 5, c(1,2,3,4,5)]

df[df$col3!=FALSE & df$col1 >= 5, ]                 #   & (E comercial) -> para condições simultaneas
df[df$col1 >= 90 | df$col1 <= 2,]                   #   | (pipe)(ou) -> para condições não simultaneas

df[df$col3==FALSE & df$col1 >= 90, c(1,2,3)]
df[(df$col1 >= 80 & df$col1 <= 92) | df$col2 == c("um", "dois"), c(1,2,3)]

# Bora consertar o df
df

df[c(8,9,10), 1] <- c(8,9,10)
df$col2[c(8,9,10)] <- c("oito", "nove", "dez")
df[["col3"]][c(8,9,10)] <- T



## list

ll <- list(
  item1 = 1,
  item2 = c(1,2,3),
  item3 = "string",
  item4 = c("vetor", "de", "strings"),
  item5 = c("vetor", "misto", 10, 300, 3.14, 7.322223),
  item6 = matrix(c(1,2,3,4), nrow = 2, byrow = T),
  item7 = data.frame(
    var1 = c(10,20,30),
    var2 = c("vetor", "de", "strings"),
    var3 = 11:13,
    var4 = seq.Date(from = as.Date("2020/01/01"), by = "month", length.out = 3)
  )
)

ll

str(ll) # Para detalhes sobre o objeto

ll[["item4"]]
ll[["item7"]][["var1"]]
ll[["item7"]]["var1"]      #   Retorna a coluna
ll[["item7"]][,"var1"]     #   Retorna o vetor
ll[["item7"]][,"var1"][2]





# Gráficos R-base
library(stats)         # Provavelmente o pacote {stats} já está instalado
stats

?cars
stats::cars

?plot                  # Para mais info sobre o função mais básica para se plotar gráficos em R

plot(cars)


# Pacotes em R
library(utils)
read.csv(file = "", header = T, sep = ";", dec = ",", stringsAsFactors = F, encoding = "UTF-8")




# ggplt2, o principal pacote para grafos em r
install.packages("ggplot2")
library("ggplot2")









### Recomendações:


# 1. Linguagem R - Wikipedia = https://pt.wikipedia.org/wiki/R_(linguagem_de_programa%C3%A7%C3%A3o)

# 2. Livro - R for datascience = https://r4ds.had.co.nz/
#            R for datascience = Melhor livro introdutório de programação em R e data science


# 2. r-base - Curso R = https://www.curso-r.com/material/r-base/

# 2. Vocabulary - Advanced R = http://adv-r.had.co.nz/Vocabulary.html
#                 Advanced R = É um livro por Hadley Wickham de programação avançada em R

# 3. Trends - Stack overflow = https://insights.stackoverflow.com/trends?tags=r%2Cpython
#             Stack overflow = Fórum de programação mt útil pra troca de conhecimento e soluções para problemas e bugs

# 4. App - Datacamp = AppStore



