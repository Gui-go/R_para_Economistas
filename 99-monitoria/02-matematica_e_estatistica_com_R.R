# CONTINUANDO AS ATIVIDADES NO SISTEMA R
# R e estatística
# Faremos diversos procedimentos para nos familiarizarmos com o Sistema R.
# Prof. Arlei Fachinello e Guilherme Viegas


# Dataset para nossa análise
?datasets                                # Pacote com vários datasets
?datasets::mtcars                        # {Motor Trend Car Road Tests} Perfermance de 32 modelos de carro dos anos 70
datasets::mtcars                         # Do pacote dataset, chame mtcars
mtcars                       
View(mtcars)
str(mtcars)
summary(mtcars)

# Funções estatísticas que valem a pena decorar
min(mtcars$mpg)
max(mtcars$cyl)
mean(mtcars$disp)
median(mtcars$hp)
sd(mtcars$drat)                           # Standard Deviation - Desvio Padrão
quantile(mtcars$wt)                       # Quartil
quantile(mtcars$qsec, probs = 0.13)       # Percentil



# A medida de correlação, r, é uma das mais importantes para a analise estatística.
# [-1, 1]
# Em R, podemos calcular a correlação com a função    cor()
?cor()

cor(mtcars$mpg, mtcars$hp)      # Milhas por galao x horse power
cor(mtcars$mpg, mtcars$cyl)     # Milhas por galao x Número cilindros


## No R tbm podemos criar nossas própras funções
# Por exemplo, a função para calcular a área de um circulo  /   A = pi * r ^ 2
A <- function(r){
  area = pi * r ^ 2
  return(area)
}
A(2)
# Perceba que criamos uma função com apenas um parametro, o raio

# O argumento da função pode ser tbm um vetor, assim como na seguinte função, onde normalizaremos um séries de valores (vetor)
noramlize <- function(x){
  (x - min(x)) / (max(x) - min(x))
}
noramlize(cars$speed)

# Perceba a semelhança entre as duas séries:
data.frame(
  "Serie_original" = cars$speed,
  "Serie_normalizada" = noramlize(cars$speed)
)

# Vale notar que a correlação entre o vetor original e ele mesmo normalizado é 1, perfeita correlação:
cor(cars$speed, noramlize(cars$speed))


# Gráficos   :)
# Talvez o mais popular pacote para visualização de gráficos em R seja o {ggplot2}
library(ggplot2)

ggplot2::ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  ggplot2::geom_point()

# Perceba que os paraametros não precisam estar explicitos, contando que as funções e argumentos estejam na ordem correta.
ggplot(mtcars, aes(mtcars$hp, mtcars$mpg)) +
  geom_point()

# Podemos adicionar novas camadas ao gráfico
ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red")

# Os dados podem ser explicitados de modo geral em ggplot() ou de maneira específica em geom_...()
ggplot2::ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  ggplot2::geom_point()+
  ggplot2::geom_smooth(se = FALSE) # Como o método não foi definido, o método padrão (loess) foi utilizado

# É sempre uma boa prática deixar todos os argumentos bem definidos
ggplot(data = mtcars) +
  geom_point(mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_smooth(mapping = aes(x = mtcars$hp, y = mtcars$mpg), method = "loess", se = FALSE, color = "red")

# Tbm podemos fazer diversos outros tipos de gráficos com ggplot2, como o gráfico de barras, por exemplo:
ggplot(mtcars, aes(cyl))+ 
  geom_bar()

# Podemos tbm customizá-lo a gosto:
ggplot(mtcars, aes(cyl))+ 
  geom_bar()+
  labs(title = "Gráfico de barras", subtitle = "Quantidade de carros para cada tipo de cilindro")+
  theme_minimal()


# ...e diferente maneiras de produzí-los
ggplot(mtcars, aes(x=factor(cyl), fill=cyl))+
  geom_bar(width=0.7, fill="steelblue")+
  theme_minimal()+
  labs(title = "Gráfico de barras", subtitle = "Quantidade de carros para cada tipo de cilindro")

ggplot(mtcars, aes(x=factor(cyl), fill=cyl))+
  geom_bar(width=0.7)+
  coord_flip()+
  theme_minimal()+
  labs(
    title = "Gráfico de barras", 
    subtitle = "Quantidade de carros para cada tipo de cilindro",
    x = "Número de cilindros",
    y = "Contagem"
  )

# Para mais...
# procure no google "How to..."





# Regressão linear simples
?lm()

simple_model <- lm(mtcars$hp ~ mtcars$mpg, mtcars)
simple_model # horse power ~ miles per gallon

simple_model[]

simple_model[1]
simple_model[[1]]
simple_model["coefficients"]
simple_model[["coefficients"]]
simple_model[["coefficients"]][1]
simple_model[["coefficients"]][2]
simple_model$coefficients
simple_model$coefficients[1]
simple_model$coefficients[2]

simple_model[2]
simple_model[[2]]
simple_model["residuals"]
simple_model[["residuals"]]

coef_lsm <- simple_model[[1]][[1]] # Coeficiente linear (intercepto) do modelo linear simples de (mtcars$hp ~ mtcars$mpg)
coef_asm <- simple_model[[1]][[2]] # Coeficiente angular () do modelo linear simples de (mtcars$hp ~ mtcars$mpg)

summary(simple_model)          #   Sumário estatístico de simple_model

ggplot(data = mtcars, aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "green")+
  annotate("text", x = 260, y = 30, label = paste0("Cor(mpg, hp)\n", round(cor(mtcars$mpg, mtcars$hp), 3)))+
  labs(title = "Gráfico da correlação",
       subtitle = "Milhas por galão e horse power", 
       x = "Horse Power",
       y = "Milhas Por Galão",
       caption = "R_para_Economistas")+
  theme_minimal()

# \n  para uma nova linha


## Recomendações

# Pacote {esquisse}
# https://medium.com/data-hackers/gerando-gr%C3%A1ficos-com-o-mouse-os-melhores-links-da-semana-7-bf4151996e75
# https://www.linkedin.com/pulse/interface-drag-drop-para-constru%C3%A7%C3%A3o-de-gr%C3%A1ficos-r-da-silva-j%C3%BAnior/?trk=related_artice_Interface%20%26amp%3Bamp%3Bquot%3Bdrag%20and%20drop%26amp%3Bamp%3Bquot%3B%E2%80%8B%20para%20constru%C3%A7%C3%A3o%20de%20gr%C3%A1ficos%20no%20R_article-card_title

# Pacote {radiant}
# https://cran.r-project.org/web/packages/radiant.data/readme/README.html







# Hora de praticar:

#1 Qual a média e mediana da inflação nos ultimos 12 meses



#2 Qual a máxima do IPCA nos meses de janeiro dos ultimos 10 anos



#3 Correlacione o IPCA e INPC nos ultimos 24 meses



#4 Crie um gráfico de linhas para o IPCA



#5 Crie um gráfico de linhas comparando o IPCA e INPC e indique a correlação entre as séries no canto direito do gráfico 



#6 Qual a taxa de inflação (IPCA) acumulada nos ultimos 12 meses?



#7 Considerando 1000 reais guardados em baixo do colchão, quanto dinehiro foi perdido nesses ultimos 12 meses?



#8 Demonstre graficamente o acumulo da inflação e a depreciação do dinheiro guardado:



#9 Separe entre classes a quantidade de meses que a inflação foi menor que -1, entre -1 e 0, entre 0 e +1 e maior que 1:
# (-Inf-1], (-1, 0], (0, +1] e (+1, Inf)



#10 Construa um gráfico de barras para o resultado do desafio 9




# Help:
# https://www3.bcb.gov.br/sgspub/localizarseries/localizarSeries.do?method=prepararTelaLocalizarSeries

#Obs.: Para melhor se adequar aos gráficos, as séries terão de ser transformadas para melhor se adequar as análises

#Boa Sorte!