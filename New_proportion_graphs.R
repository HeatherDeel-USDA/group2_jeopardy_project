#Additional resources
#https://stackoverflow.com/questions/24576515/relative-frequencies-proportions-with-dplyr


library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)
library(readr)
library(lubridate)
library(forcats)
library(DT)
detach(package:plyr)
jeo <- read_tsv("C:/Users/khumbdr/Desktop/master_season1-35.tsv.txt")

seasons_all <- read_tsv("master_season1-35.tsv")
seasons_all_clean <- jeo %>% 
  separate(air_date, sep="-", into = c("year", "month", "day")) %>% 
  select(-comments, -notes) %>% 
  mutate(category = str_to_lower(string = category),
         answer = str_to_lower(string = answer),
         question = str_to_lower(string = question)) %>% 
  filter(year != "2019")
  mutate(category1 = fct_lump(category, n=5))

### Top five categories of 
  
cat_pro <- seasons_all_clean %>%
  mutate(category = fct_lump(category, n=5)) %>% # Making lumpsum
  group_by(year, category) %>%
  summarise(count = n())%>%
  mutate(freq= count/sum(count)) %>%
  filter(category!="Other") %>% #removed Other because of large proportion
  ggplot()+
  geom_bar(aes(x = year, y= freq, fill= category), stat="identity")+
  theme(axis.text.x = element_text(angle = 45))+
  scale_x_discrete(breaks = c(1984,1988,1992,1996,2000,2004,2008,2012,2016,2018))

cat_pro
