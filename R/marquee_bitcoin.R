library(imola)
library(tidyverse)
library(highcharter)
library(shinyWidgets)

first_var <- c("","13.8%","-18%","5.8","23.6%","-2.38%","9.1%","2.1%","18.3%","0.6%","16.1%","-10%","11.7%")
second_var <- c("","13.8%","-18%","5.8","23.6%","-2.38%","9.1%","2.1%","18.3%","0.6%","16.1%","-10%","11.7%")

all_vars <- c(first_var,second_var)

stock_market <- c("New York Stock Exchange","Nasdaq","Shanghai Stock Exchange",
                  "Euronext","Shenzhen Stock Exchange","Japan Exchange Group",
                  "Hong Kong Stock Exchange","Bombay Stock Exchange","National Stock Exchange",
                  "London Stock Exchange","Saudi Stock Exchange (Tadawul)","Toronto Stock Exchange",
                  "SIX Swiss Exchange","Deutsche Börse AG","Korea Exchange",
                  "B3 Brasil Bolsa Balcão",
                  "New York Stock Exchange","Nasdaq","Shanghai Stock Exchange",
                  "Euronext","Shenzhen Stock Exchange","Japan Exchange Group",
                  "Hong Kong Stock Exchange","Bombay Stock Exchange","National Stock Exchange",
                  "London Stock Exchange")


marquee_df <- tibble(names = stock_market, values = all_vars)%>% mutate(names = stock_market)
marquee_df <- marquee_df
# marque_p <- marque_p %>% str_to_upper()

white <- "white"

marquee_df <- marquee_df %>%
  mutate(cor_var = case_when(values < 0 ~ "#fe3c30", values >= 0 ~ "#30c759"),
         up_down = case_when(cor_var == '#fe3c30' ~ 'down', TRUE ~ 'up'))

lista_marquee <- list()

for (i in 1:nrow(marquee_df)) {
  lista_marquee[[i]]  <- p(
    p(
      class = 'bolsa_name',
      style = 'color: black;
  font-size: 1.5em;

    font-weight: 600;',
      str_to_upper(paste0(marquee_df$names[i]))
    ),

    span(
      style = glue::glue("color: {marquee_df$cor_var[i]};
                         font-weight: 600;
  font-size: 1.5em;
  margin: 0 1em !important;"),
      str_to_upper(paste0(marquee_df$values[i])),
      tags$img(
        src = glue::glue(
          'img/{marquee_df$up_down[i]}.png',
          style = ' height: 1em;',
          width = '16px',
          height = '16px'
        )
      )
    )
  )

}


