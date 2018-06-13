library(dplyr)
data_fac=data_char %>% mutate_if(is.character, as.factor)

##Selecting columns
msleep %>%
  select(name, genus, sleep_total, awake) %>%
  glimpse()

msleep %>%
  select(name:order, sleep_total:sleep_cycle) %>%
  glimpse

##deselect columns
msleep %>% 
  select(-conservation, -(sleep_total:awake)) %>%
  glimpse
