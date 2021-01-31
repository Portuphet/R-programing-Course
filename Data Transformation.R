## Data Transformation / Data wrangling

## read data files
friend <- read_csv("friends.csv")

df1 <- read_delim("text_file_01.txt", delim = ";")

df2 <- read_delim("text_file_02.txt", delim = "\t")

## tibble == enhanced dataframe
mtcars <- tibble(mtcars)
class(mtcars)

## dplyr - data transformation
## 1.Select()
## 2.filter()
## 3.mutate()
## 4.arrange()
## 5.summarise()

## selcet columns
select(mtcars, mpg, hp, wt)
select(mtcars, 1, 2, 4, 6)
select(mtcars, 1:3, 8:10)

select(mtcars, starts_with("h"))
select(mtcars, contains("a"))
select(mtcars, ends_with("p"))

select(mtcars, carb, everything())
select(mtcars, horsePower = hp,
               milePerGallon = mpg,
               weight = wt)

## filter rows with conditions
filter(mtcars, mpg < 20)
filter(mtcars, mpg < 20 ,
               hp > 200 ,
               am == 1)
filter(mtcars, mpg< 18 | am == 1)

## combine select + filter
mtcars %>%
  select(mpg, hp, wt) %>%
  filter(mpg < 20, 
         hp > 200) %>%
  mutate(double_hp = hp*2,
         log_hp = log(hp),
         exp_log_hp = exp(log_hp))
## arrange data
mtcars %>%
  select(mpg, hp, wt) %>%
  arrange(hp)

mtcars %>%
  select(mpg, hp, wt, am) %>%
  mutate(am = factor(am, 
                     labels = c("Auto", "Manual"), 
                     levels = c(0,1))) %>%
  arrange(am) 

## summarise
mtcars %>%
  mutate(am = factor(am, 
                     levels = c(0,1),
                     labels = c("Auto", "Manual")))%>%
  group_by(am) %>%
  summarise(avg_hp = mean(hp),
            avg_mpg = mean(mpg),
            sum_hp = sum(hp),
            sd_hp = sd(hp),
            n = n())%>%
  ungroup()






