rm(list = ls())

# Libraries ---------------------------------------------------------------
# install.packages(c("openssl", "httr", "rvest", "tidyverse", "ggfortify", "zoo", "sidrar"))
library(openssl)
library(httr)
library(rvest)
library(tidyverse) # Conjunto de pacotes {ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, forcats}
library(ggfortify)
library(zoo)
library(sidrar)


# dados -------------------------------------------------------------------
# Introdução ao sidrar
# https://cran.r-project.org/web/packages/sidrar/vignettes/Introduction_to_sidrar.html

# Artigo sobre o pacote sidrar no blog análise macro
#   https://analisemacro.com.br/economia/dados-macroeconomicos/baixando-dados-do-sidra-com-o-r-o-pacote-sidrar/

dados_sidra <- get_sidra(
  api = "/t/1846/n1/all/v/all/p/all/c11255/90707,93404,93405,93406,102880/d/v585%200")

# ---------------------------------------------------------------------
view(dados_sidra)
names(dados_sidra)
sapply(dados_sidra, unique)


library(dplyr)
# Aprenda a realizar manipulação de dados com dplyr
# https://dplyr.tidyverse.org/
# http://leg.ufpr.br/~walmes/cursoR/data-vis/slides/05-dplyr.pdf
# https://rpubs.com/Kassio_Ferreira/tutorialdplyr

head(cnt)
cnt <- dados_sidra %>%
  select(`Setores e subsetores`, Trimestre, Valor) %>%
  rename(
    "setores" = `Setores e subsetores`, 
    "trimestre" = Trimestre,
    "valor" = Valor
  ) %>% 
  mutate(var = str_replace_all(
    setores, c("PIB a preços de mercado" = "PIB",
                              "Despesa de consumo das famílias" = "C",
                              "Despesa de consumo da administração pública" = "G",
                              "Formação bruta de capital fixo" = "FBKF",
                              "Variação de estoque" = "VE"))) %>%
  mutate(ano = as.integer(str_sub(trimestre, start = -4))) %>%
  mutate(tri = as.integer(str_sub(trimestre, end = 1))) %>%
  filter(ano >= 2000) %>%
  select(var, ano, tri, valor)

view(cnt)
names(cnt)
sapply(cnt, unique)

l_cnt <- split(cnt, cnt$var)
str(l_cnt)
summary(l_cnt)

# i_macro <- l_cnt %>% 
#   mutate()

i_macro <- cbind(
  l_cnt$PIB["ano"],
  l_cnt$PIB["tri"],
  l_cnt$PIB["valor"],
  l_cnt$C["valor"],
  c(l_cnt$FBKF["valor"] + l_cnt$VE["valor"]),
  l_cnt$G["valor"]
)

names(i_macro) <- c("ano", "tri", "PIB", "C", "I", "G")

str(i_macro)
dim(i_macro)
nrow(i_macro)

# Poderiamos representar o n de linhas hardcoded como a seguir
chained <- data.frame(PIB = rep(0, 80), C = rep(0, 80), I = rep(0, 80), G = rep(0, 80))
# mas seria mais interessante dinamizarmos o script para que futuras análises possam ser reproduzidas automaticamente
chained <- data.frame(PIB = rep(0, nrow(i_macro)), C = rep(0, nrow(i_macro)), I = rep(0, nrow(i_macro)), G = rep(0, nrow(i_macro)))

str(chained)

# Índice encadeado
for (i in 1:(nrow(i_macro)-4)) {
  chained$PIB[i+4] <- ((i_macro[i+4, "PIB"]-i_macro[i, "PIB"])/i_macro[i+4, "PIB"])*100
  chained$C[i+4] <- ((i_macro[i+4, "C"]-i_macro[i, "C"])/i_macro[i+4, "C"])*100
  # 2
  chained$I[i+4] <- ((i_macro[i+4, "I"]-i_macro[i, "I"])/i_macro[i+4, "I"])*100
  chained$G[i+4] <- ((i_macro[i+4, "G"]-i_macro[i, "G"])/i_macro[i+4, "G"])*100
}

?ts()       # Função para criar um objeto ts (time-serie)(série temporal)
dados_tsp <- ts(chained, start = c(i_macro$ano[1], i_macro$tri[1]), freq = 4)
view(dados_tsp)
dados_ts <- window(dados_tsp, start = c(2001, 1))    # Devido ao método encadeado, o ano de 2000 acaba sendo == 0

dim(dados_tsp)
dados_ts
dados_ts
view(dados_ts)
class(dados_ts)           # Por vezes, um objeto pode ter mais de uma classe. 
str(dados_ts)             # Deve-se sempre ter atençao na estrutura do seu objeto
dim(dados_ts)
summary(dados_ts)

sd_pcig <- data.frame(
  round(sd(dados_ts[, 1]), 2),
  round(sd(dados_ts[, 2]), 2),
  round(sd(dados_ts[, 3]), 2),
  round(sd(dados_ts[, 4]), 2)
)


# Visualização -----------------------------------------------------------
ggplot(dados_ts, aes(seq(as.Date("2000/1/1"), by = "quarter", length.out = nrow(dados_ts))))+
  geom_line(aes(y = dados_ts[, "PIB"]), size = 1.1, color = "darkblue")+
  geom_line(aes(y = dados_ts[, "C"]), size = 1.1, color = "darkgreen")+
  geom_line(aes(y = dados_ts[, "I"]), size = 1.1, color = "cadetblue3")+
  geom_line(aes(y = dados_ts[, "G"]), size = 1.1, color = "red")+
  geom_hline(yintercept = mean(chained$I[5:length(chained$I)], na.rm = T), color = "cadetblue3", size = 1.05)+
  geom_hline(yintercept = 0, lty = "dashed")+
  labs(title = "Indicadores Macroeconomicos Brasileiros Encadeados",
       subtitle = paste0("Variáveis encadeadas com o mesmo trimestre do ano anterior de ",
                         i_macro$ano[1],
                         " à ",
                         i_macro$ano[nrow(i_macro)]),
       y = "% de variação encadeada com o trimestre do ano anterior",
       x = "",
       caption = "R_para_Economistas")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))



# IS LM



library(markdown)
library(tinytex)
# tinytex::install_tinytex()
