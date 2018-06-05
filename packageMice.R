##Handling missing data with MICE package a simple approach
dat <- read.csv(url("https://goo.gl/4DYzru"), header=TRUE, sep=",")

head(dat)

sapply(dat, function(x) sum(is.na(x)))

original <- dat

set.seed(10)
dat[sample(1:nrow(dat), 20), "Cholesterol"] <- NA
dat[sample(1:nrow(dat), 20), "Smoking"] <- NA
dat[sample(1:nrow(dat), 20), "Education"] <- NA
dat[sample(1:nrow(dat), 5), "Age"] <- NA
dat[sample(1:nrow(dat), 5), "BMI"] <- NA

sapply(dat, function(x) sum(is.na(x)))

library(dplyr) 
dat <- dat %>%
  mutate(
    Smoking = as.factor(Smoking),
    Education = as.factor(Education),
    Cholesterol = as.numeric(Cholesterol)
  )
str(dat)

library(mice)
init = mice(dat, maxit=0) 
meth = init$method
predM = init$predictorMatrix

predM[, c("BMI")]=0

meth[c("Age")]=""

meth[c("Cholesterol")]="norm" 
meth[c("Smoking")]="logreg" 
meth[c("Education")]="polyreg"


set.seed(103)
imputed = mice(dat, method=meth, predictorMatrix=predM, m=5)

imputed <- complete(imputed)

sapply(imputed, function(x) sum(is.na(x)))

# Cholesterol
actual <- original$Cholesterol[is.na(dat$Cholesterol)]
predicted <- imputed$Cholesterol[is.na(dat$Cholesterol)]
mean(actual)
mean(predicted)
# Smoking
actual <- original$Smoking[is.na(dat$Smoking)] 
predicted <- imputed$Smoking[is.na(dat$Smoking)] 
table(actual)
table(predicted)



