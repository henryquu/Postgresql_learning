#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]] # no argument provided
then 
  echo "Please provide an element as an argument."
else
  # argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$1
  else
    # argument is a symbol
    ATOMIC_NUMBER=$($PSQL "
      SELECT atomic_number
        FROM elements
        WHERE symbol = '$1'
    ")

    # argument is a name
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$($PSQL "
      SELECT atomic_number
        FROM elements
        WHERE name = '$1'
    ")
    fi
  fi

  # atomic number not found
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    # get parameters of the element
    SYMBOL=$($PSQL "
        SELECT symbol 
          FROM elements
          WHERE atomic_number = $ATOMIC_NUMBER
      ") 

    NAME=$($PSQL "
        SELECT name 
          FROM elements
          WHERE atomic_number = $ATOMIC_NUMBER
      ") 

    TYPE=$($PSQL "
      SELECT type
        FROM types
        INNER JOIN properties
          USING (type_id)
        INNER JOIN elements
          USING (atomic_number)
        WHERE atomic_number = $ATOMIC_NUMBER
    ")

    MASS=$($PSQL "
      SELECT atomic_mass
        FROM properties
        WHERE atomic_number = $ATOMIC_NUMBER
    ")

    MELTING_POINT=$($PSQL "
      SELECT melting_point_celsius
        FROM properties
        WHERE atomic_number = $ATOMIC_NUMBER
    ")

    BOILING_POINT=$($PSQL "
      SELECT boiling_point_celsius
        FROM properties
        WHERE atomic_number = $ATOMIC_NUMBER
    ")

    echo "The element with atomic number $ATOMIC_NUMBER"\
          "is $NAME ($SYMBOL). It's a $TYPE,"\
          "with a mass of $MASS amu."\
          "$NAME has a melting point of"\
          "$MELTING_POINT celsius and a"\
          "boiling point of $BOILING_POINT celsius."
  fi
fi
