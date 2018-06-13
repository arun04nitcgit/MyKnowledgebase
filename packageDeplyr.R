library(dplyr)
data_fac=data_char %>% mutate_if(is.character, as.factor)

##Selecting columns
msleep %>%
  select(name, genus, sleep_total, awake) %>%
  glimpse()

