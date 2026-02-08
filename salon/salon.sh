#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -A -q -c"


#
# tables
# 

# $PSQL "CREATE TABLE customers(
#   customer_id SERIAL PRIMARY KEY,
#   name VARCHAR(40),
#   phone VARCHAR(20) UNIQUE NOT NULL
# );"

# $PSQL "CREATE TABLE services(
# 	service_id SERIAL PRIMARY KEY,
# 	name VARCHAR(40)
# 	)"

# $PSQL "CREATE TABLE appointments(
# 	appointment_id SERIAL PRIMARY KEY,
# 	service_id INT NOT NULL REFERENCES services(service_id),
# 	customer_id INT NOT NULL REFERENCES customers(customer_id),
# 	time VARCHAR(8)
# 	)"

# $PSQL "INSERT INTO services (name) VALUES
# 	('Buzz Cut'),
# 	('Bowl Cut'),
# 	('Original Cut'),
# 	('The Great Canadian')
# 	"


#
# functions
#

IS_SERVICE_ID_NUMERIC() {
	[[ "$1" =~ ^[0-9]+$ ]]
}

IS_SERVICE_ID_EXISTANT() {
	[[ -n $($PSQL "SELECT 1 FROM services WHERE service_id = $1") ]]
}

IS_CUSTOMER_PHONE_EXISTANT() {
	[[ -n $($PSQL "SELECT 1 FROM customers WHERE phone = '$1'") ]]
}

CREATE_CUSTOMER() {
	$PSQL "INSERT INTO customers (name, phone) VALUES ('$1', '$2') RETURNING customer_id;"
}

CREATE_APPOINTMENT() {
	$PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($1, $2, '$3')"
}

LIST_SERVICES() {
	local SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

	echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
	do
		echo "$SERVICE_ID) $SERVICE_NAME"
	done
}


#
# interface
#

MAIN_MENU() {

	# validate service

	while true
	do
		echo "Choose your weapon:"

		LIST_SERVICES

		read SERVICE_ID_SELECTED

		if ! IS_SERVICE_ID_NUMERIC "$SERVICE_ID_SELECTED"
		then
			echo "Please, enter a valid integer."
			continue
		fi

		if ! IS_SERVICE_ID_EXISTANT "$SERVICE_ID_SELECTED"
		then
			echo "We stopped offering that. Please choose something else."
			continue
		fi

		break
	done


	# validate phone

	while [[ -z "$CUSTOMER_PHONE" ]]
	do
		echo "What's your phone number?"
		read CUSTOMER_PHONE
	done


	# validate name

	if IS_CUSTOMER_PHONE_EXISTANT "$CUSTOMER_PHONE"
	then
		CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
		CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
		#
	else

		while [[ -z "$CUSTOMER_NAME" ]]
		do
			echo "I don't have a record for that phone number, what's your name?"
			read CUSTOMER_NAME
		done

		CUSTOMER_ID=$(CREATE_CUSTOMER "$CUSTOMER_NAME" "$CUSTOMER_PHONE")
	fi

	SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

	while [[ -z "$SERVICE_TIME" ]]
	do
		echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
		read SERVICE_TIME
	done

	echo  "$CUSTOMER_ID" "$SERVICE_ID_SELECTED" "$SERVICE_TIME"

	CREATE_APPOINTMENT "$CUSTOMER_ID" "$SERVICE_ID_SELECTED" "$SERVICE_TIME"

	echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

	# end
	exit 0
}


echo -e "\n~ Welcome to Hair-Zone ~\n"

MAIN_MENU
