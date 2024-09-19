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
if [[ -z $USERNAME_RESULT ]]
then
  # Create username in database
  RESULT=$($PSQL "INSERT INTO players(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")

  # Print welcome message
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Query database for user's stats
  USER_STATS=$($PSQL "SELECT games_played, best_game FROM players WHERE username = '$USERNAME'")
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_STATS"

  # Print welcome message
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number between 1 and 1000

# ----- Do while game isn't finished -----
# Ask user to input their guess

# If wrong, give hint

# Else, tell user number of tries, and the secret number