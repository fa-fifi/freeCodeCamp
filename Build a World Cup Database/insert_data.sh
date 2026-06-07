#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

insert_team() {
  # insert team
  INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
  # if inserted success
  if [[ $INSERT_TEAM == "INSERT 0 1" ]]
  then
    # get new team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
    echo $TEAM_ID
  fi
}

echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # ---------------------------------------------------------------------------------------
    # insert winner
    # ---------------------------------------------------------------------------------------
    # get winner team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $WINNER_ID ]]
    then
      WINNER_ID=$(insert_team "$WINNER")
    fi

    # ---------------------------------------------------------------------------------------
    # insert opponent
    # ---------------------------------------------------------------------------------------
    # get winner team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_ID=$(insert_team "$OPPONENT")
    fi
    
    # ---------------------------------------------------------------------------------------
    # insert games
    # ---------------------------------------------------------------------------------------
    INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then
      echo $INSERT_GAMES
      echo "Insert success : $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS"
    fi

  fi 
  
done