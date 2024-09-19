#!/bin/bash

# A simple number guessing game, where a user's game stats are stored
# in a PSQL database

# Connect to database
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

# Ask user for username
echo -e "Enter your username: "
read USERNAME

# Check if usernamne exists

# If username doesn't exist, create user in database

# Generate random number between 1 and 1000

# ----- Do while game isn't finished -----
# Ask user to input their guess

# If wrong, give hint

# Else, tell user number of tries, and the secret number