#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"

#Get username
echo "Enter your username:"
read NAME

GUESSING_GAME(){

  read GUESS
  #If GUESS is not INT
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESSING_GAME
  fi

  #If GUESS > NUMBER
  if [[ $GUESS -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    TRIES+=1
    GUESSING_GAME

  #If GUESS < NUMBER
  elif [[ $GUESS -lt $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    TRIES+=1
    GUESSING_GAME
     
   #If GUESS = NUMBER
  else
    echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
  fi
}

#Check in database
echo "$($PSQL "SELECT games_played, best_score FROM players WHERE name='$NAME'")" | while IFS='|' read GAMES_PLAYED BEST_SCORE
do

  echo -e "\n~~ Number Guessing Game ~~\n"

  if [[ -z $GAMES_PLAYED ]]
  then
    #Add to database
    INSERT_USER=$($PSQL "INSERT INTO players(name) VALUES('$NAME')")
    echo "Welcome, $NAME! It looks like this is your first time here."

  else
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
  fi  

  #Prompt Guess
  echo "Guess the secret number between 1 and 1000:"

done
#Generate random number
NUMBER=$((($RANDOM%1000)+1))

declare -i TRIES=1
GUESSING_GAME

#Inserting best_score into database
if [[ $TRIES -lt $BEST_SCORE || $BEST_SCORE -eq 0 ]]
then
  UPDATE_BEST_SCORE=$($PSQL "UPDATE players SET best_score=$TRIES WHERE name='$NAME'")
fi

UPDATE_GAMES_PLAYED=$($PSQL "UPDATE players SET games_played = games_played + 1 WHERE name='$NAME'")
