# R e estatística

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
# Em R, podemos calcular tal a correlação com a função    cor()
?cor()

cor(mtcars$mpg, mtcars$hp)      # Milhas por galao x horse power
cor(mtcars$mpg, mtcars$cyl)     # Milhas por galao x # cilindros


## Questao 1
# Assim como podemos calcular a area de um circulo com a formula   A = pi * r ^ 2
A <- function(r){
  area = pi * r ^ 2
  return(area)
}
A(2)
# Defina uma função de correlação e a compare com a função    stats::cor()


# Talvez o mais popular pacote para visualização de gráficos em R seja o {ggplot2}
library(ggplot2)

ggplot2::ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  ggplot2::geom_point()

# Perceba que os paraametros não precisam estar explicitos, contando que as funções e argumentos estejam na ordem correta.
ggplot(mtcars, aes(mtcars$hp, mtcars$mpg)) +
  geom_point()


ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red")

ggplot2::ggplot(data = mtcars) +
  ggplot2::geom_point(mapping = aes(x = mtcars$hp, y = mtcars$mpg))

ggplot(data = mtcars) +
  geom_point(mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_smooth(mapping = aes(x = mtcars$hp, y = mtcars$mpg), method = "lm", se = FALSE, color = "red")


# Regressão linear simples
?lm()

simple_model <- lm(mtcars$hp ~ mtcars$mpg, mtcars)
simple_model

simple_model[]

simple_model[1]
simple_model[[1]]
simple_model["coefficients"]
simple_model[["coefficients"]]

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
       caption = "R_para_Economistas")


# \n  para uma nova linha

# correlation graph w\ error distances

# Estatística descritiva
# Oq é

# install.packages("Quandl")
library("Quandl")
?Quandl

# API = Contrato
# BCB/433 = IPCA
# api_key = Esta chave é pessoal, deve ser utilizada somente para esse curso.
# Para obter sua própria api_key, acesse:
sq1 <- Quandl::Quandl(paste0("BCB/433"), type = "raw", collapse = "monthly", api_key = "gGdvN9gXsx9hxHMTWPNL")
sq2 <- sq1[seq(dim(sq)[1],1),]     # Podemos inverter a sequencia, se nos parecer masi conveniente

tm = c(as.numeric(substring(sq2[1,1],1,4)), as.numeric(substring(sq2[1,1],6,7)))

sqts <- ts(sq2[,2], start = tm, frequency = 12)

# install.packages("ggfortify")
library("ggfortify")              # ts em ggplot

autoplot(sqts)

autoplot(sqts)+
  geom_line(aes(y = mean(sqts)), color = "red", linetype = "dotted") +
  geom_line(aes(y = median(sqts)), color = "blue", linetype = "dotted") +
  annotate(geom = "text", x = Sys.Date(), y = 60, label = "hoje") +
  annotate(geom = "text", x = as.Date("1994-02-27"), y = 60, label = "Plano\nReal", color = "darkgreen")+
  geom_rect(aes(xmin = as.Date('2003-01-01'), ymin = -Inf, 
                xmax = as.Date('2011-01-01'), ymax = Inf),
            fill = "steelblue", alpha = 0.01) + # Pediodo lula
  labs(title = "autoplot...",subtitle = "Série...", y = "ICAP::::")+
  theme_minimal()

  
# Questao
# Demonstre, em um gráfico de linhas, as principais estatísticas relacionadas a série temporal BCB... tecidos




# Boxplot graf inflation
library(dplyr)
sq3 <- sq2 %>% filter(between(Date, as.Date("2005-01-01"), as.Date("2020-01-01")))
sp <- data.frame(mes = substr(sq3[seq(1:nrow(sq3)),1], 6 , 7),
                 ano = substr(sq3[seq(1:nrow(sq3)),1], 1 , 4),
                 dados = sq3[1:nrow(sq3), 2])
str(sp)
# SP <- SP[input$SLDAD[1]:input$SLDAD[2],]

ggplot(sp , aes(x = factor(sp$mes, levels = c("01","02","03","04","05","06","07","08","09","10","11","12"), ordered = T),
                y = sp$dados, group = sp$mes))+
  geom_boxplot()+
  stat_summary(fun.y = mean, geom = "point", shape = 18, size = 1, color = "red", alpha = 0.8)+
  labs(title = "Box Plot dividido entre os meses do ano",
       x = "Meses do ano",
       y = "IPCA.....")+ 
  geom_hline(yintercept = median(sp$dados), color = "blue")+
  theme_minimal()

# Nice inflation history plotly graph




# Estatístca indutiva

sq3   # df from = as.date("2005-01-01")
sqts <- ts(sq3[,2], start = c(as.numeric(substring(sq3[1,1],1,4)), as.numeric(substring(sq3[1,1],6,7))), frequency = 12)
library(forecast)
tsa <- auto.arima(sqts, seasonal = T, trace = F, ic = "aic")
ff <- forecast(tsa, h=12)

# nn <- arima_data()[["arma"]]
# ff <- forecast(arima_data(), h = input$hor)
library(ggplot2)
autoplot(ff)+
  autolayer(ff$mean, color = "blue")+
  labs(y = "IPCA...", 
       x = "Observações")+
  theme(legend.position = "none")+
  theme_minimal()


# Questão 23
# Projete os proximos 6 valores para a série 1518, a partir de uma amostra de as.Date("2010-01-01") e as.Date("2020-01-01"), através de um auto.arima() que minimize "bic"









## Recomendações
# Pacote Esquisse
# Radiant

