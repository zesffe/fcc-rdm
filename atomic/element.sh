#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."
	exit 0
fi


IS_NUMBER() {
	[[ "$1" =~ ^[0-9]+$ ]]
}

IS_SYMBOL() {
	[[ "$1" =~ ^[A-Za-z]{1,2}$ ]]
}

IS_NAME() {
  [[ "$1" =~ ^[A-Za-z]+$ ]]
}

QUERY="
	SELECT 
		elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
	FROM elements 
	FULL JOIN properties ON properties.atomic_number = elements.atomic_number
	FULL JOIN types ON properties.type_id = types.type_id
"

IS_RECORD() {
	if [[ -z $1 ]]
	then
		echo "I could not find that element in the database.";
		exit 0;
	fi
}

GET_TEXT() {
	echo "$1" | while IFS="|" read ATNUM NAME SYMBOL TYPE MASS MELTING BOILING
	do
		echo "The element with atomic number $ATNUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
		break
	done
}


if IS_NUMBER "$1"
then
	RECORD=$($PSQL "$QUERY WHERE elements.atomic_number = $1")
	IS_RECORD "$RECORD"
	GET_TEXT "$RECORD"
	exit 0
fi

if IS_SYMBOL "$1"
then
	RECORD=$($PSQL "$QUERY WHERE elements.symbol ILIKE '$1'")
	IS_RECORD "$RECORD"
	GET_TEXT "$RECORD"
	exit 0
fi

if IS_NAME "$1"
then
	RECORD=$($PSQL "$QUERY WHERE elements.name ILIKE '$1'")
	IS_RECORD "$RECORD"
	GET_TEXT "$RECORD"
	exit 0
else
	echo "Please check Wikipedia about '$1'."
fi
