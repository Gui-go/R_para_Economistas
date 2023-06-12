####   Introdução ao R e classes de objetos

###   Apresentação - Mosrtar a sintaxe do R, janelas, script, console, environment

print("Olá, mundo!!")

variavel <- "Olá, mundo!!"
variavel

var1 <- 2
var2 <- 13

var3 <- var1 * var2
var3

###   Diferentemente de nós humanos, o R, não possui boa capacidade de abstração.

###   Em termos mais claros, deve-se ter claro que por vezes seu código irá retornar resultados inesperados e dependerá da sua capacidade de abstração para perceber erros de sintaxe.

###   O R é "case sensitive" e por vezes basta uma boa revisão do código para resolver alguns obstaculos.

#   R != RStudio

#   R:              https://www.r-project.org/
#   RStudio:        https://rstudio.com/         ->        https://posit.co/
#   R Cloud:        https://posit.cloud/

#   Introdução ao R e classes de objetos

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
pi     # variável pré definida


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
seq(from=2, to=20)
seq(1,100)
seq(from=2, to=20, by=2)
seq(from=1, to=2, length = 11)
length(v2)
4:length(v2)
rep(c(1,2,3,4), times=5)

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
# Maria é autônoma e seu faturamento por dia de trabalho pode ser representado pelo seguinte vetor:
ganhos_de_maria <- c(123,131,121,122,133,111,115,117,123,144,120,119,186,171,122,
                     100,121,134,110,110,121,145,167,111,151,186,198,178,177,131)
# 1) Determine quantos dias de trabalho estao sendo representados pelo vetor ganhos_de_maria
# 2) Qual o ganho médio de Maria
# 3) Qual o ganho mediano de Maria
# 4) Quanto foi o maior ganho de Maria durante esse período

# R:




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

# mais booleans:
#  &     (and)
#  |     (or)


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

sd(n1) # Desvio padrão = Standard Deviation
sd(n2)

var(n1) # Variância
var(n2)

var(n1) == sd(n1)*sd(n1)                 #  var = sd^2
var(n2) == sd(n2)^2


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
m2 + m3
m2 + t(m3)
m2 - m2
m2 * m3 # multiplicação elemento a elemento
m2 %*% m3 # multiplicação matricial
m2 / m2
m2 ^ m2

# Funções matriciais
m4 <- matrix(c(1,2,3,4,1,6,7,8,1), nrow = 3, byrow = F)
diag(m4)
diag(m3)

det(m2)
det(m3)
det(m4)

I <- diag(c(1, 1, 1, 1)) # Matriz Identidade
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


# str_detect(string = c7, pattern = "sem")


## Factor

quali <- factor(c("Bom", "Bom", "Bom", "Muito bom", "Ruim", "Muito bom", "Regular", "Bom"), levels = c("Muito bom", "Bom", "Regular", "Ruim"))
quali

transporte <- factor(
  c("Skate", "Skate", "Carro", "moto", "Bicicleta", "Bicicleta", "Skate", "Skate"), 
  levels = c("Carro", "moto", "Bicicleta", "Skate")
)
transporte



## data.frame

df <- data.frame(
  col1 = c(1,2,3,4,5,6,7,81,92,100),
  col2 = c("um", "dois", "tres", "quatro", "cinco", "seis", "sete", "outro", "n0ve", "Dez"),
  col3 = c(T, T, T, T, T, T, T, F, F, F),
  col4 = c(110:101),
  col5 = rep("repita"),
  col6 = seq(from = as.Date("2020/01/01"), by = "quarter", length.out = 10),
  stringsAsFactors = FALSE
)

df
View(df) # Para ver o dataset em uma aba separata de modo mais organizado

str(df) # Structure

summary(df) # Sumário

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

# df[linha, coluna]
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

df[c(8,9,10), "col1"] <- c(8,9,10)
df[c(8,9,10), 2] <- c("oito", "nove", "dez")
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

## Outros classes de ojetos
array()
array(data = c(1:4), dim = c(2, 2), dimnames = list(c("r1", "r2"), c("c1", "c2")))
array(data = 1:100, dim = c(5, 10), dimnames = list(paste0("row", 1:5), paste0("col", 1:10)))
array(1:9, c(3, 3))
array(1:9, 30)

date()
Sys.Date()
Sys.time()
as.Date("2005-10-21")
as.Date("2020-12-25")
as.Date('1/15/2001',format='%m/%d/%Y')
as.Date('April 26, 2001',format='%B %d, %Y')
as.Date('22JUN01',format='%d%b%y')

seq(as.Date('2020-12-25'),by='days',length=10)
seq(as.Date('2020-01-01'),by='quarter',length=12)
seq(as.Date('2020-01-01'),by='week',length=52); paste0("Há ", round(365/7, 3), " semanas em 1 ano")
seq.Date(from = Sys.Date(), by = "day", length.out = 100)


# Functions
f1 <- function(par1 = arg1){
  resultado = paste0("Olá, ", par1, "..")
  return(resultado)
}
f1("Guilherme")






### Pacotes em R
library(datasets)
datasets::cars
datasets::mtcars
datasets::airmiles
datasets::faithful
datasets::iris
datasets::Titanic
datasets::swiss


## Gráficos em R-base
library(graphics)
graphics::plot()
?plot                  # Função mais básica para se plotar gráficos em R
plot(cars)
plot(cars, col="red", main="Título do gráfico", type="o", lwd=5)

# Pacote para gráficos avançados
library(ggplot2)                 # Pacote para se plotar gráficos avançados em R
install.packages("ggplot2")      # Para instalar o pacote {ggplot2}, caso não esteja instalado

# Pacote para funções utilitárias
library(utils)                   # Pacote com funções utilitárias
utils::read.csv()                # Função para ler arquivos .csv
read.csv(file = "Endereço_do_arquivo", header = T, sep = ";", dec = ",", stringsAsFactors = F, encoding = "UTF-8")
utils::write.csv()               # Função para salvar arquivos em .csv
utils::citation("ggplot2")       # Função para informações para citação de pacotes R
utils::.romans                   # Função que mostra exemplos dos numeros Romanos

# Pacote para funções estatíticas
library(stats)                   # Pacote para funções estatísticas
stats::anova()                   # Função computa uma analise de variância - ANOVA
stats::approx()                  # Função que retorna o mesmo vetor interpolado
stats::cor()                     # Função que retorna a correlação entre dois vetores



# MAIS

# %in% --------------------------------------------------------------------
%in% 
mtcars
mtcars$cyl %in% 4
mtcars[mtcars$cyl %in% 4, ]
v1 <- c("a1","b2","c1","d2")
v2 <- c("g1","x2","d2","e2","f1","a1","c2","b2","a2")
v1 %in% v2
v1[v1 %in% v2]


# %>% ---------------------------------------------------------------------
library(magrittr)
# %>% (pipe) ctrl + shift + m
?magrittr::`%>%`()
iris %>% head(2)

# Funções extra -----------------------------------------------------------
?split
?order()
?rank()
?unique()



### Recomendações:


# 1. Linguagem R - Wikipedia 
# https://pt.wikipedia.org/wiki/R_(linguagem_de_programa%C3%A7%C3%A3o)

# 2. Livro - R for datascience - Melhor livro introdutório de programação em R e data science
# https://r4ds.had.co.nz/

# 2. r-base - Curso R 
# https://www.curso-r.com/material/r-base/

# 2. Vocabulary - Advanced R - Livro por Hadley Wickham de programação avançada em R
# http://adv-r.had.co.nz/Vocabulary.html

# 3. Trends - Stack overflow - Fórum de programação mt útil pra troca de conhecimento e soluções para problemas e bugs
# https://insights.stackoverflow.com/trends?tags=r%2Cpython

# 4. App - Datacamp - AppStore

# 5. Cheatsheet - Folha de dicas
# https://rstudio.com/resources/cheatsheets/

