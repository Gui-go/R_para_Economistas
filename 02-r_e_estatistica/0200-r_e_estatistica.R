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
# R:





# De modo semelhante, podemos normalizar um vetor
noramlize <- function(x){
  (x - min(x)) / (max(x) - min(x))
}
noramlize(cars$speed)



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
  geom_smooth(se = FALSE)

ggplot(data = mtcars) +
  geom_point(mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_smooth(mapping = aes(x = mtcars$hp, y = mtcars$mpg), method = "loess", se = FALSE, color = "red")


# Regressão linear simples
?lm()

simple_model <- lm(mtcars$hp ~ mtcars$mpg, mtcars)
simple_model # horse power ~ miles per gallon

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
       caption = "R_para_Economistas")+
  theme_minimal()

# \n  para uma nova linha

# correlation graph w\ error distances#############################


# install.packages("Quandl")
library("Quandl")
?Quandl

# API == Contrato
# BCB/433 == IPCA >> BACEN
# api_key = Esta chave é pessoal, deve ser utilizada somente para esse curso.
# Para obter sua própria api_key, acesse:
sq1 <- Quandl::Quandl(code = "BCB/433", type = "raw", collapse = "monthly", api_key = "gGdvN9gXsx9hxHMTWPNL")
ser_ipca <- sq1[seq(dim(sq1)[1],1),]     # Podemos inverter a sequencia, se nos parecer mais conveniente

tm = c(as.numeric(substring(ser_ipca[1,1],1,4)), as.numeric(substring(ser_ipca[1,1],6,7)))

sqts <- ts(ser_ipca[,2], start = tm, frequency = 12)

# install.packages("ggfortify")
library("ggfortify")              # possibilita ts em ggplot

autoplot(sqts)

autoplot(sqts)+
  geom_rect(aes(xmin = as.Date('1995-01-01'), ymin = -Inf,
                xmax = as.Date('2003-01-01'), ymax = Inf),
            fill = "blue", alpha = 0.01) + # Periodo FHC
  geom_rect(aes(xmin = as.Date('2003-01-01'), ymin = -Inf,
                xmax = as.Date('2011-01-01'), ymax = Inf),
            fill = "tomato3", alpha = 0.01) + # Periodo lula
  geom_rect(aes(xmin = as.Date('2011-01-01'), ymin = -Inf,
                xmax = as.Date('2016-08-31'), ymax = Inf),
            fill = "red", alpha = 0.01) + # Periodo Dilma
  geom_rect(aes(xmin = as.Date('2016-08-31'), ymin = -Inf,
                xmax = as.Date('2018-12-31'), ymax = Inf),
            fill = "violetred", alpha = 0.01) + # Periodo Temer
  annotate(geom = "text", x = as.Date("1994-02-27"), y = 60, label = "Plano\nReal", color = "darkgreen")+
  annotate(geom = "text", x = as.Date(Sys.Date()), y = 60, label = "Hoje") +
  geom_line(aes(y = mean(sqts)), color = "red", linetype = "dotted", size = 1.1) +
  geom_line(aes(y = median(sqts)), color = "blue", linetype = "dotted", size = 1.1) +
  labs(
    title = "Gráfico da perspectiva político-inflacionária no Brasil",
    subtitle = "IPCA entre 1980 e 2020", 
    y = "IPCA"
  )+
  theme_minimal()

# Algumas cores possiveis
colours()
  
# Questao
# Demonstre, em um gráfico de linhas, as principais estatísticas relacionadas a série temporal 
# "Índice de volume de vendas no varejo - Tecidos, vestuário e calçados - Santa Catarina" do BACEN





# Boxplot graf inflation
library(dplyr)
ser_ipca_f <- ser_ipca %>% filter(between(Date, as.Date("2005-01-01"), as.Date("2020-01-01")))
df_ipca <- data.frame(mes = substr(ser_ipca_f[seq(1:nrow(ser_ipca_f)),1], 6 , 7),
                      ano = substr(ser_ipca_f[seq(1:nrow(ser_ipca_f)),1], 1 , 4),
                      dados = ser_ipca_f[1:nrow(ser_ipca_f), 2])

str(df_ipca)

ggplot(df_ipca , aes(x = factor(df_ipca$mes, levels = c("01","02","03","04","05","06","07","08","09","10","11","12"), ordered = T),
                     y = df_ipca$dados, group = df_ipca$mes))+
  geom_boxplot()+
  stat_summary(fun.y = mean, geom = "point", shape = 18, size = 1, color = "red", alpha = 0.8)+
  labs(title = "Box-Plot da inflação dividido entre os meses do ano",
       subtitle = "de 2005 a 2019",
       x = "Meses do ano",
       y = "IPCA",
       caption = "R_para_Economistas")+ 
  geom_hline(yintercept = mean(sp$dados), color = "red")+
  geom_hline(yintercept = median(sp$dados), color = "blue")+
  theme_minimal()

##

# Outras séries

# 
sq3 <- Quandl::Quandl(code = "BCB/1518", type = "raw", collapse = "monthly", api_key = "gGdvN9gXsx9hxHMTWPNL")
ser_tecidoevestuario <- sq3[seq(dim(sq3)[1],1),]     # Podemos inverter a sequencia, se nos parecer mais conveniente
tm3 = c(as.numeric(substring(ser_tecidoevestuario[1,1],1,4)), as.numeric(substring(ser_tecidoevestuario[1,1],6,7)))
ser_tecidoevestuario_ts <- ts(ser_tecidoevestuario[,2], start = tm3, frequency = 12)
plot(decompose(ser_tecidoevestuario_ts))
autoplot(decompose(ser_tecidoevestuario_ts))

#
sq4 <- Quandl::Quandl(code = "BCB/1531", type = "raw", collapse = "monthly", api_key = "gGdvN9gXsx9hxHMTWPNL")
ser_meveiseeletro <- sq4[seq(dim(sq4)[1],1),]     # Podemos inverter a sequencia, se nos parecer mais conveniente
tm4 = c(as.numeric(substring(ser_meveiseeletro[1,1],1,4)), as.numeric(substring(ser_meveiseeletro[1,1],6,7)))
ser_meveiseeletro_ts <- ts(ser_tecidoevestuario[,2], start = tm4, frequency = 12)
autoplot(decompose(ser_meveiseeletro_ts))

#
sq5 <- Quandl::Quandl(code = "BCB/1557", type = "raw", collapse = "monthly", api_key = "gGdvN9gXsx9hxHMTWPNL")
ser_auto <- sq5[seq(dim(sq5)[1],1),]     # Podemos inverter a sequencia, se nos parecer mais conveniente
tm5 = c(as.numeric(substring(ser_auto[1,1],1,4)), as.numeric(substring(ser_auto[1,1],6,7)))
ser_auto_ts <- ts(ser_auto[,2], start = tm5, frequency = 12)
autoplot(decompose(ser_auto_ts))

#
sq6 <- Quandl::Quandl(code = "BCB/1570", type = "raw", collapse = "monthly", api_key = "gGdvN9gXsx9hxHMTWPNL")
ser_supermercado <- sq6[seq(dim(sq6)[1],1),]     # Podemos inverter a sequencia, se nos parecer mais conveniente
tm6 = c(as.numeric(substring(ser_supermercado[1,1],1,4)), as.numeric(substring(ser_supermercado[1,1],6,7)))
ser_supermercado_ts <- ts(ser_supermercado[,2], start = tm6, frequency = 12)
autoplot(decompose(ser_supermercado_ts))

### LM Múltiplo





### ARIMA
ser_auto
ser_auto_ts <- ts(ser_auto[,2], start = c(as.numeric(substring(ser_auto[1,1],1,4)), as.numeric(substring(ser_auto[1,1],6,7))), frequency = 12)

library(forecast) # Pacote que possibilita a utilização de modelos de previsão estatística, como o modelo arima
ser_auto_tsa <- auto.arima(ser_auto_ts, seasonal = T, trace = F, ic = "aic")
ser_auto_tsaf <- forecast(ser_auto_tsa, h=18)

library(ggplot2)
autoplot(ser_auto_tsaf)+
  autolayer(ser_auto_tsaf$mean, color = "blue")+
  labs(y = "Índice de volume de vendas de Automóveis em Santa Catarina", 
       x = "Observações")+
  theme(legend.position = "none")+
  theme_minimal()


# Questão 23
# Projete os proximos 6 valores para a série 1518, a partir de uma amostra 
# de as.Date("2010-01-01") à as.Date("2020-01-01"), através de um auto.arima() que minimize "bic"





# Suavização Exponencial
# install.packages("smooth")
library(smooth)
# https://johannesmehlem.com/blog/exponential-smoothing-time-series-forecasting-r/

HoltWinters()   # Disponível no R-base
ses()           # {forecast}

es(ser_supermercado_ts, h=18, holdout=TRUE, silent=FALSE)
es(ser_supermercado_ts, h=36, holdout=TRUE, silent=FALSE)

ets1 <- ets(ser_supermercado_ts)
summary(ets1)
forecast(ets1,h=36,level=0.95)
accuracy(ets1)
residuals(forecast(ets1,h=36,level=0.95))
mean(residuals(forecast(ets1,h=36,level=0.95)))
hist(residuals(forecast(ets1,h=36,level=0.95)))
Box.test(residuals(forecast(ets1,h=36,level=0.95)), lag=20, type="Ljung-Box")
diff(ser_supermercado_ts, differences = 1)
acf(diff(ser_supermercado_ts, differences = 1), lag.max = 20)
pacf(diff(ser_supermercado_ts, differences = 1), lag.max = 20)


ses1 <- ses(ser_supermercado_ts)
summary(ses1)
forecast(ses1,h=36,level=0.95)
plot(ses1)
accuracy(ses1)
residuals(forecast(ses1,h=36,level=0.95))
mean(residuals(ses1))
hist(residuals(ses1))
diff(ser_supermercado_ts, differences = 1)
acf(diff(ser_supermercado_ts, differences = 1), lag.max = 20)


hw1 <- hw(ser_supermercado_ts)
summary(hw1)
forecast(hw1, h=18)
plot(hw1)
accuracy(hw1)
residuals(forecast(hw1, h=18))
mean(residuals(forecast(hw1, h=18)))
hist(residuals(forecast(hw1, h=18)))
Box.test(residuals(forecast(hw1, h=18)), lag=20, type="Ljung-Box")
diff(ser_supermercado_ts, differences = 1)





train <- window(ser_supermercado_ts, end = c(2018, 3))
test <- window(ser_supermercado_ts, start = c(2018, 4))
fit_hw_train <- hw(train)
fit_auto_train <- forecast(train)
accuracy(forecast(fit_hw_train), test)
accuracy(forecast(fit_auto_train), test) ["Test set", "RMSE"]





## Recomendações

# Pacote {esquisse}
# https://medium.com/data-hackers/gerando-gr%C3%A1ficos-com-o-mouse-os-melhores-links-da-semana-7-bf4151996e75
# https://www.linkedin.com/pulse/interface-drag-drop-para-constru%C3%A7%C3%A3o-de-gr%C3%A1ficos-r-da-silva-j%C3%BAnior/?trk=related_artice_Interface%20%26amp%3Bamp%3Bquot%3Bdrag%20and%20drop%26amp%3Bamp%3Bquot%3B%E2%80%8B%20para%20constru%C3%A7%C3%A3o%20de%20gr%C3%A1ficos%20no%20R_article-card_title

# Pacote {radiant}
# https://cran.r-project.org/web/packages/radiant.data/readme/README.html
