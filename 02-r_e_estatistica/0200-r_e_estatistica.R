# R e estatística


# Dataset para nossa análise
?datasets::mtcars            # {Motor Trend Car Road Tests} Perfermance de 32 modelos de carro dos anos 70
datasets::mtcars
View(mtcars)


# Pacote que utilizaremos para visualizações gráficas
library(ggplot2)

ggplot2::ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  ggplot2::geom_point()

ggplot(data = mtcars, mapping = aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red")

# Regressão linear simples
?lm()

simple_model <- lm(mtcars$hp ~ mtcars$mpg, mtcars)
simple_model

coef_lsm <- simple_model[[1]][[1]] # Coeficiente linear (intercepto) do modelo linear simples de (mtcars$hp ~ mtcars$mpg)
coef_asm <- simple_model[[1]][[2]] # Coeficiente angular () do modelo linear simples de (mtcars$hp ~ mtcars$mpg)

summary(simple_model)          #   Sumário estatístico de simple_model

ggplot(data = mtcars, aes(x = mtcars$hp, y = mtcars$mpg)) +
  geom_point() +
  geom_abline(intercept = -3)



# Estatística descritiva
# Oq é

# install.packages("Quandl")
library("Quandl")
?Quandl

inflacao ex








# Estatístca indutiva