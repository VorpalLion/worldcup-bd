#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#populate teams table
#cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
#do
#  if [[ $YEAR != year ]]
#  then
#    #get winner team_id
#    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
#    #if not found
#    if [[ -z $TEAM_ID ]]
#    then
#      #insert winner
#      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
#      #better readability
#      if [[ $INSERT_TEAM_ID == "INSERT O 1" ]]
#      then
#        echo "Inserted into teams, $WINNER"
#      fi
#     #get new winner team_id
#      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
#    fi
#    #get opponent team_id
#    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
#    #if not found
#    if [[ -z $TEAM_ID ]]
#    then
#      #insert opponent
#      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
#      #better readability
#      if [[ $INSERT_TEAM_ID == "INSERT O 1" ]]
#     then
#        echo "Inserted into teams, $OPPONENT"
#      fi
#      #get new opponent team_id
#      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
#    fi
#  fi
#done

#populate games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #get winner team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #if not found
    if [[ -z $TEAM_ID ]]
    then
      #insert winner
      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      #better readability
      if [[ $INSERT_TEAM_ID == "INSERT O 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
      #get new winner team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
    #get opponent team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #if not found
    if [[ -z $TEAM_ID ]]
    then
      #insert opponent
      INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      #better readability
      if [[ $INSERT_TEAM_ID == "INSERT O 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
      #get new opponent team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    #get winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #get opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #insert games
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    #better readability
    if [[ $INSERT_GAMES == "INSERT O 1" ]]
      then
        echo "Inserted into games, $YEAR $ROUND"
      fi
  fi
done

