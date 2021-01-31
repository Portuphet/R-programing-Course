# load libraly
library(tidyverse)
library(glue)
library(plotly)
library(lubridate) ## work with date
library(patchwork)
library(corrplot)

#review mtcars
mtcars
rownames(mtcars)
colnames(mtcars)

mtcars <- rownames_to_column(mtcars)
head(mtcars)

#dplyr - data wrangling
mtcars <- mtcars %>%
  rename(model = rowname)%>%
  as_tibble()
## Change column as to factor
mtcars <- mtcars %>%
  mutate(am = factor(am, levels = c(0,1), labels = c("Auto", "Manual")))

mtcars <- mtcars %>%
  mutate(vs = factor(vs, levels = c(0,1), labels = c("V-Shaped", "Straight")))

mtcars %>%
  select(vs, am) %>%
  head(10)

## review dataframe
glimpse(mtcars)

## select only character columns
mtcars %>%
  select_if(is.character)

## select only nummeric/double
mtcars %>%
  select_if(is.numeric)
## select only factor
mtcars %>%
  select_if(is.factor)

## count to create frequency table
mtcars %>%
  count(am, vs)%>%
  mutate(pct = n/ sum(n))

## if_else to create conditional column
mtcars <- mtcars %>%
  select(model, hp) %>%
  mutate(hp_flag = if_else(hp <100 , T, F)) %>%
  mutate(hp_group = case_when(
    hp >= 200 ~ "high",
    hp >= 100 ~ "medium",
    T ~ "low" ## other condition i.e. hp < 100
  ))

## lubridate => package to work with date
my_date <- c(
  "2020-01-15", "2021-01-23", "2021-09-09"
)

class(my_date)

my_date <- ymd(my_date)
class(my_date)
my_date

ymd("2020 January 31")
ymd("2020 JAN 31")
ymd("2020-01-31")
ymd("2020/01/01")
ymd("20200131")

## USA = mm/dd/yyyy
mdy("Feb 25 2021")
mdy("September 30 2025")
mdy("September-30-2025")

dmy("31jan1988")

## extract information mydate object
my_date
year(my_date)
month(my_date, label = T, abbr = F)
day(my_date)
wday(my_date, label = T, abbr = F)
