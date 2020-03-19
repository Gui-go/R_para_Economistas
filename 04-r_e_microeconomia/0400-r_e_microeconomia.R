# R e microeconomia

# https://www.r-bloggers.com/interactive-cobb-douglas-web-app-with-r/

# Cobb-Douglas Production Function - App
# https://stablemarkets.shinyapps.io/Rshiny/

# https://rpubs.com/hiltonmbr/55051
# https://mbounthavong.com/blog/2019/2/19/cobb-douglas-production-function-and-total-costs








# attach(dadosA)

df <- data.frame(
  
)

ggplot(dadosA)+
  geom_segment(aes(x = is_x, xend = is_xend, y = is_y, yend =is_yend), size = 1.6)+
  coord_cartesian(ylim = c(0, 1000), expand = FALSE, xlim = c(0, 1000))+
  theme_minimal()+
  labs(title = "Neutralidade da moeda",
       y = "Juros, i",
       x = "Renda, Y")+
  theme(plot.title = element_text(size = 21, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 19, face = "bold"),
        plot.caption = element_text(size = 13, face = "bold"),
        axis.text = element_blank(),
        axis.ticks = element_blank())
