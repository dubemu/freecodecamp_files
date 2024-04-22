#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate tables before inserting data
"$($PSQL "TRUNCATE TABLE games, teams")"

# Reset primary key sequence
"$($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")"
"$($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")"

# Parse and insert data from games.csv, skipping the header
tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
  # Insert teams if they don't exist
  insert_winner_query="INSERT INTO teams (name) SELECT '$winner' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$winner')"
  insert_opponent_query="INSERT INTO teams (name) SELECT '$opponent' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$opponent')"
  "$($PSQL "$insert_winner_query")"
  "$($PSQL "$insert_opponent_query")"

  # Get team IDs
  winner_id="$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")"
  opponent_id="$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")"

  # Insert game data
  query="INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals')"
  "$($PSQL "$query")"
done