# SL Jeopardy_Project
# 191117
library(readr)
library(dplyr)
library(faraway)
library(tidyr)
#read in the data
season1 <- read_tsv("season1.tsv")
View(season1)
head(season1)
#new datafeame
season1_stat <- season1 %>% 
  group_by(category) %>% 
  count() %>% 
  arrange(desc(n))
View(season1_stat)
#basic code apply on all seasons
season_all <- read_tsv("master_season1-35.tsv")
head(season_all)
season_all_stat <- season_all %>% 
  group_by(category) %>% 
  count() %>% 
  arrange(desc(n))
View(season_all_stat)
