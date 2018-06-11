library(dplyr)
data_fac=data_char %>% mutate_if(is.character, as.factor)

