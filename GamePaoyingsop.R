## Game Rock, Paper , Scissors

## initialize variables
actions <- c("Rock", "Scissors", "Paper", "Exit")
win <- 0
loss <- 0
tie <- 0

## start playing games
while(TRUE) {
  
  ## get input from user
  cat("Rock[1], Scissors[2], Paper[3], Exit[4]")
  user_move <- as.numeric(readline("Choose your move: "))
  user_action <- actions[user_move]
  
  ## exit from the game
  if (user_action == "Exit") {
    cat("Good Bye")
    break
  }
  
  ## compare user vs. computer random
  random <- sample(1:3, size = 1)
  computer_actions <- actions[random]
  
  #print actions (user vs computer)
  cat("User: ",user_action, "\n")
  cat("Computer: ",computer_actions, "\n")
  
  if (user_action == computer_actions){
    tie <- tie + 1
  } else if (user_action == "Rock" & computer_actions == "Scissors") {
    win <- win + 1
  } else if (user_action == "Scissors" & computer_actions == "Paper") {
    win <- win + 1
  } else if (user_action == "Paper" & computer_actions == "Rock") {
    win <- win + 1
  } else {
    loss <- loss + 1
  }
  print (paste(win, loss, tie))
}


