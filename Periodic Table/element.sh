#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  EXISTS=TRUE
fi

#If argument is atomic_number
if [[ $1 =~ ^[0-9]+$ && $1 -le 10 ]]
then
  ATOMIC_NUMBER=$1
  echo "$($PSQL "SELECT name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius 
                FROM properties INNER JOIN types ON properties.type_id=types.type_id INNER JOIN elements ON properties.atomic_number=elements.atomic_number 
                WHERE elements.atomic_number=$ATOMIC_NUMBER")" |
                while IFS='|' read NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
  EXISTS=TRUE
fi

#If argument is symbol
if [[ $1 =~ ^[A-Z][a-z]?$ ]]
then
  SYMBOL=$1
  echo "$($PSQL "SELECT properties.atomic_number,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius 
                FROM properties INNER JOIN types ON properties.type_id=types.type_id INNER JOIN elements ON properties.atomic_number=elements.atomic_number 
                WHERE elements.symbol='$SYMBOL'")" |
                while IFS='|' read ATOMIC_NUMBER NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
  EXISTS=TRUE
fi

#If argument is name
if [[ $1 =~ ^[A-Z][a-z][a-z]+$ ]]
then
  NAME=$1
  echo "$($PSQL "SELECT properties.atomic_number,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius 
                FROM properties INNER JOIN types ON properties.type_id=types.type_id INNER JOIN elements ON properties.atomic_number=elements.atomic_number 
                WHERE elements.name='$NAME'")" |
                while IFS='|' read ATOMIC_NUMBER SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
  EXISTS=true
fi

if [[ -z $EXISTS ]]
then
  echo "I could not find that element in the database."
fi
