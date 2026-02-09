#! /bin/bash

PSQL="psql -q --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo "Enter your username:"
read USERNAME


USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]
then
	echo "Welcome, $USERNAME! It looks like this is your first time here."

	USER_ID=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME') RETURNING user_id")
	USER_GAMES_PLAYED=0
	USER_BEST_GAME=0

else
	USER_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
	USER_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")

	echo "Welcome back, $USERNAME! You have played $USER_GAMES_PLAYED games, and your best game took $USER_BEST_GAME guesses."
fi


NUMBER=$(( RANDOM % 1000 + 1 ))
# NUMBER=5
ATTEMPTS=0

echo "Guess the secret number between 1 and 1000:"

while true
do
	read NUMBER_GUESS
	(( ATTEMPTS++ ))

	if [[ ! "$NUMBER_GUESS" =~ ^[0-9]+$ ]]
	then
		echo "That is not an integer, guess again:"

	elif [[ $NUMBER_GUESS -lt $NUMBER ]]
	then
		echo "It's higher than that, guess again:"

	elif [[ $NUMBER_GUESS -gt $NUMBER ]]
	then
		echo "It's lower than that, guess again:"

	else
		echo "You guessed it in $ATTEMPTS tries. The secret number was $NUMBER. Nice job!"
		break
	fi
done


(( USER_GAMES_PLAYED++ ))

if [[ $USER_BEST_GAME -eq 0 || $ATTEMPTS -lt $USER_BEST_GAME ]]
then
	USER_BEST_GAME=$ATTEMPTS
fi

$PSQL "UPDATE users SET games_played=$USER_GAMES_PLAYED, best_game=$USER_BEST_GAME WHERE user_id=$USER_ID"
