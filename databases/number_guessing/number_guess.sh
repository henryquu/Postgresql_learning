#!/bin/bash

PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

while [[ $n -gt 22 ]] || [[  -z $NAME ]]
do
  echo "Enter your username:"
  read NAME
  n=${#NAME}
done

USER_INSERTION=$($PSQL "
  INSERT INTO users 
    VALUES ('$NAME')
    ON CONFLICT DO NOTHING
")

if [[ $USER_INSERTION ==  "INSERT 0 1" ]]
then
  echo -e "\nWelcome, $NAME! It looks like"\
          "this is your first time here."
else
  USER_DATA=$($PSQL "
    SELECT games_played, best_game
      FROM users
      WHERE name = '$NAME'
  ")
  
  dIFS=$IFS
  IFS='|'
  read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  IFS=$dIFS

  echo -e "\nWelcome back, $NAME! You have played"\
          "$GAMES_PLAYED games, and your best game"\
          "took $BEST_GAME guesses."
fi

#generate a random number
RANDOM_NUMBER=$((RANDOM%1000+1))

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

TRIES_COUNT=1


while [[ ! $GUESS =~ ^[0-9]+$ || $GUESS -ne $RANDOM_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  else
    echo -e "\nIt's higher than that, guess again:"
  fi

  read GUESS
  ((++TRIES_COUNT))
done


echo -e "\nYou guessed it in $TRIES_COUNT tries."\
     "The secret number was $GUESS. Nice job!"

UPDATE_GAME_COUNT=$($PSQL "
  UPDATE users 
    SET games_played = $GAMES_PLAYED + 1
    WHERE name = '$NAME'
")


if [[ $TRIES_COUNT -lt $BEST_GAME || $BEST_GAME -eq 0 ]]
then
  UPDATE_BEST=$($PSQL "
    UPDATE users
      SET best_game = $TRIES_COUNT
      WHERE name = '$NAME'
  ")
fi
