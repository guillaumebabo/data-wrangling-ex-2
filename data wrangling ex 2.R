# load my library
library(tidyverse)
# load data : read csv titanic_original file
titanic <- read_csv("titanic_original.csv")
# replace all missing values in the embarked variable by "S"
embarked_clean <- titanic %>%
  mutate(embarked = replace(embarked, is.na(embarked), "S")) %>%
  mutate(embarked = replace(embarked, embarked == "", "S")) %>%
  mutate(embarked = replace(embarked, embarked == " ", "S"))
# replace NA values in age variable with mean value
# the mean value would give you an average variable and would be a good way to replace missing values
age_clean <- embarked_clean %>%
  mutate (age = replace(age, is.na(age), mean(age,na.rm =TRUE)))
# replace NA values for boat with None string
boat_clean <- age_clean %>%
  mutate (boat = replace(boat, is.na(boat), "None"))
# create a new column for whether a passenger has a cabin number or not
cabin_clean <- boat_clean %>%
  mutate(has_cabin_number = as.integer(!is.na(cabin)))
# output to csv
titanic_clean <- cabin_clean
write.csv(titanic_clean, "titanic_clean.csv", row.names = FALSE)
View (titanic_clean)