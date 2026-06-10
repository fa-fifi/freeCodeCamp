#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
INPUT=$(echo $1 | sed 's/ //g')

if [[ -z $INPUT ]]; then
  echo "Please provide an element as an argument."
else
  if [[ ! $INPUT =~ ^[0-9]+$ ]]; then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT' OR name='$INPUT';")
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$INPUT;")
  fi
  
  if [[ -z $ATOMIC_NUMBER ]]; then
    echo "I could not find that element in the database."
  else
    QUERY_RESULT=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$ATOMIC_NUMBER;")
    IFS='|' read -r NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS <<< $QUERY_RESULT
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  fi
fi
