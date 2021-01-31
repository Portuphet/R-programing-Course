numbers <- c(100, 120, 150, 200, 290, 300)
dim(numbers) <- c(2, 3)

m1 <- matrix(1:6, ncol=2, byrow = T)
length(numbers)

(ages <- c(David = 25, 
           John = 30, 
           Anna = 28, 
           Mary = 32, 
           Joe = 33)
  )

(ages <- unname(ages))

rep("Hello", 15)
seq(1, 100, 5)

m2 <- 1:25
dim(m2) <- c(5, 5) # row, column

#list similar as Dictionary in python

customer_01 <- list(
    fname = "David",
    lname = "Beckham",
    age = 42,
    movies = c("The Dark Knight", "Avengers", "Soul"),
    random_matrix = m2
)

customer_02 <- list(
  fname = "Phet",
  lname = "Thepvongsa",
  age = 32,
  movies = c("it ok not be ok", "Doctor Romantic", "Playlist Doctor")
)

all_customers <- list(
  customer_01,
  customer_02
)

# get access information in list

all_customers[1]
all_customers[2]

all_customers[2][[1]][1]
all_customers[1][[1]][[4]][1]

#create data frame from scratch

id <- 1:5
cust_names <- c("David", "Mary", "Anna", "John", "Reed")
ages <- c(32, 25, 18, 31, 35)
action_lover <- c(T, F, F, T, T)

customers <- data.frame(id, cust_names, ages, action_lover)
View(customers)
# read csv file into R studio

penguins <- read.csv("penguins.csv")
View(penguins)

#drop NA (not available)
clean_penguins <- na.omit(penguins)
View(clean_penguins)

#Write csv file
write.csv(clean_penguins, "clean_penguins.csv", row.names = F)

#Working with data frame
#common function to work with df
head(penguins, 10)
tail(penguins)

str(penguins)

#check missing value in dataframe
sum(!complete.cases(penguins)) ## 11
#! mean change TRUE to FALSE, when use SUM function will sum only TRUE value

mean(!complete.cases(penguins)) ##3.19%

#Summary
summary(penguins)


#Subset in R
# Subset by position
penguins[1:10, 1:3]
penguins[1:5, ] ## row 1-5, all columns
penguins[ ,1:2] ## all row, columns 1-2


# Subset by names
penguins[1:10, "species"]
penguins[1:10, c("species", "island", "sex", "year")]

# Subset by condition
penguins[penguins$body_mass_g >= 6000, 
         c("species", "body_mass_g") ]

penguins[penguins$body_mass_g >= 5000 & penguins$sex == "male", 
         c("species", "body_mass_g", "sex")]

# if else block

score <- 67

if (score >= 80) {
  print ("passed")
} else {
  print ("failed")
}

if (score >= 80) {
  print ("Grade A")
} else if (score >= 70) {
  print ("Grade B")
} else if (score >= 60) {
  print ("Grade C")
} else {
  print ("Grade D")
}


## for loop control flow

friends <- c("David", "John", "Mary")

for (friend in friends){
  print ( paste("Hello!", friend))
}

paste("Hello!", friends)
## vectorization
x<- c(100, 150, 300)

## while loop 
counter <- 0
while(counter <= 10){
  print ("hello")
  counter <- counter + 1
}

## get input from user
user_name <- readline("What is your name?: ")
cat("Hello!",user_name)

user_age <- as.numeric(readline("How old are you?: "))
user_age * 2

## define your own function

add_two_nums <- function(a, b) {
  a+b
}

add_two_nums(10, 20)
add_two_nums(10, 25)
add_two_nums(100, 300)


## define your own chatbot
simple_chatbot <- function() {
  # First question
  user_name <- readline("What is your name?: ")
  cat("Hello", user_name, "!",sep = "")
  
  # Second question
  user_age <- readline("How old are you?: ")
  cat("You are", user_age, "year old", sep = "")
}

## get multiple names
simple_chatbot_v2 <- function() {
  user_names <- vector(length = 3, mode = "character")
  user_names[1] <- readline("What is your name?: ")
  user_names[2] <- readline("What is your name?: ")
  user_names[3] <- readline("What is your name?: ")
  print(paste("Hello",user_names))
}
