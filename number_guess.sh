#!/bin/bash

# A simple number guessing game, where a user's game stats are stored
# in a PSQL database

# Connect to database
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

# Ask user for username
echo -e "Enter your username: "
read USERNAME

# Check if username exists
USERNAME_RESULT=$($PSQL "SELECT username FROM players WHERE username = '$USERNAME'")

# If username doesn't exist...
if [[ -z $USERNAME_RESULT ]]; then
  # Create username in database
  RESULT=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")

  # Print welcome message
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Query database for user's stats
  USER_STATS=$($PSQL "SELECT games_played, best_game FROM players WHERE username = '$USERNAME'")
  IFS="|" read GAMES_PLAYED BEST_GAME <<<"$USER_STATS"

  # Print welcome message
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the game by setting a game over flag
GAME_OVER=false

# Generate random number between 1 and 1000
RANDOM_NUMBER=$(((RANDOM % 1000) + 1))

# Set the number of guesses
NUMBER_OF_GUESSES=0

# Ask user to input their guess
echo -e "Guess the secret number between 1 and 1000: "

# ----- Do while game isn't finished -----
while [[ $GAME_OVER == false ]]; do
  # Read the user's guess
  read USER_GUESS

  # Increment the number of times the user has guessed
  ((NUMBER_OF_GUESSES++))

  # If not a valid input...
  if ! [[ $USER_GUESS =~ ^[0-9]+$ ]]; then
    # Tell the user to type in an integer
    echo "That is not an integer, guess again:"

    # Keep playing
    continue
  fi

  # If the guess is...
  # Wrong and too low:
  if (($USER_GUESS < $RANDOM_NUMBER)); then
    echo "It's higher than that, guess again:"
  # Wrong and too high:
  elif (($USER_GUESS > $RANDOM_NUMBER)); then
    echo "It's lower than that, guess again:"
  # Correct:
  else
    echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

    # Set the game over flag
    GAME_OVER=true

    # Increment the number of games played
    ((GAMES_PLAYED++))
  fi
done

# Determine if this was the best game yet
if (($BEST_GAME > $NUMBER_OF_GUESSES)); then
  # Update database with new best score
  RESULT=$($PSQL "UPDATE players SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
fi

# Increment the number of games played in the database
RESULT=$($PSQL "UPDATE players SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
