#SAW script practice for Jeopardy
# 191117


library(readr)
library(dplyr)
library(tidyr)


season1 <- read_tsv('season1.tsv')

season1_stats <- season1 %>% 
  group_by(category) %>%
  nest(air_date) %>% 
  count() 

seasons_all <- read_tsv('master_season1-35.tsv')

seasons_all_stats <- seasons_all %>% 
  group_by(category) %>% 
  count() %>% 
  arrange((n))
