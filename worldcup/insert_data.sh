#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# ---------------------------------------------------------------------------------------

# create tables
$PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY, name VARCHAR(60) UNIQUE NOT NULL)"

$PSQL "CREATE TABLE games(
  game_id SERIAL PRIMARY KEY, 
  year INT NOT NULL,
  winner_id INT NOT NULL REFERENCES teams(team_id), 
  opponent_id INT NOT NULL REFERENCES teams(team_id), 
  winner_goals INT NOT NULL, 
  opponent_goals INT NOT NULL, 
  round VARCHAR(60) NOT NULL )"

#                                             id     id
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR == year ]] # skip the header line
  then
    continue
  fi

  # get winner.id via winner.name
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # if no id at teams.name for winner
  if [[ -z $WINNER_ID ]]
  then
    # create teams.id for winner 
    # WINNER_ID_RES=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
    $PSQL "INSERT INTO teams (name) VALUES ('$WINNER')"
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi

  
  # get opponent.id via opponent.name
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # if no id at teams.name for opponent
  if [[ -z $OPPONENT_ID ]]
  then
    # create teams.id for opponent 
    # OPPONENT_ID_RES=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
    $PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')"
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  fi


  # create games.id using teams.ids and etc

  $PSQL "INSERT INTO games 
    (year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES
    ($YEAR, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS, '$ROUND')
  "

  echo -e "created game ($YEAR, $ROUND, $WINNER $WINNER_GOALS-G TEAM #$WINNER_ID, $OPPONENT $OPPONENT_GOALS-G TEAM #$OPPONENT_ID) \n"

  # break

done


