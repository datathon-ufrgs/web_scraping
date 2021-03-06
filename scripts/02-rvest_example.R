library(rvest)

#---- Wikipedia ----

html <- read_html(x = "https://pt.wikipedia.org/wiki/Lista_de_munic%C3%ADpios_do_Brasil_por_IDH", 
                  encoding = "UTF-8")

tabela <- html %>%
  html_nodes(x = ., 
             xpath = '//*[@id="mw-content-text"]/div/table[1]') %>% 
  html_table(x = ., dec = ',') %>% 
  `[[`(1)

saveRDS(object = tabela, file = 'data/tab_rvest.rds')
