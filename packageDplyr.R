library(tidyverse)
#built-in R dataset 
glimpse(msleep)

data_fac=data_char %>% mutate_if(is.character, as.factor)

##Selecting columns
msleep %>%
  select(name, genus, sleep_total, awake) %>%
  glimpse()

msleep %>%
  select(name:order, sleep_total:sleep_cycle) %>%
  glimpse

##Deselect columns
msleep %>% 
  select(-conservation, -(sleep_total:awake)) %>%
  glimpse

msleep %>%
  select(-(name:awake), conservation) %>%
  glimpse

major_cols <- c("name", "order", "sleep_total")
msleep %>%
  select(one_of(major_cols))

msleep %>%
  select(name, starts_with("sleep")) %>%
  glimpse


#selecting based on regex
msleep %>%
  select(matches("o.+er")) %>%
  glimpse

## Selecting columns by their data type
msleep %>%
  select_if(is.numeric) %>%
  glimpse

msleep %>%
  select_if(~!is.numeric(.)) %>%
  glimpse

msleep %>%
  select_if(is.numeric) %>%
  select_if(~mean(., na.rm=TRUE) > 10)

msleep %>%
  select_if(~is.numeric(.) & mean(., na.rm=TRUE) > 10)

msleep %>%
  select_if(~n_distinct(.) < 10)

##Re-ordering columns
msleep %>%
  select(conservation, sleep_total, name) %>%
  glimpse

msleep %>%
  select(conservation, sleep_total, everything()) %>%
  glimpse

##Renaming columns
msleep %>%
  select(animal = name, sleep_total, extinction_threat = conservation) %>%
  glimpse

msleep %>% 
  rename(animal = name, extinction_threat = conservation) %>%
  glimpse

msleep %>%
  select_all(toupper)

#making an unclean database:
msleep2 <- select(msleep, name, sleep_total, brainwt)
colnames(msleep2) <- c("name", "sleep total", "brain weight")

msleep2 %>%
  select_all(~str_replace(., " ", "_"))


#making an unclean database:
msleep2 <- select(msleep, name, sleep_total, brainwt)
colnames(msleep2) <- c("Q1 name", "Q2 sleep total", "Q3 brain weight")
msleep2[1:3,]

msleep2 %>%
  select_all(~str_replace(., "Q[0-9]+", "")) %>% 
  select_all(~str_replace(., " ", "_"))  

 mtcars %>%
   head

 mtcars %>%
   tibble::rownames_to_column("car_model") %>%
   head




