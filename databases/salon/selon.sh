#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

GET_SERVICE_ID(){
  # print list of services
  echo -e "\nAvailable services"
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # get service id from customer
  echo -e "\nChoose the service:"
  read SERVICE_ID_SELECTED

  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    GET_SERVICE_ID
  fi
}

SERVICE_MENU() {
  # get list of services 
  SERVICES=$($PSQL "
    SELECT service_id, name 
      FROM services
      ORDER BY service_id
  ")
  
  # get a valid service
  while [[ -z $SERVICE_SELECTED ]]
  do
    GET_SERVICE_ID

    # get the name of the service
    SERVICE_SELECTED=$($PSQL "
      SELECT name
        FROM services
        WHERE service_id = $SERVICE_ID_SELECTED
    ")
  done
  # proceed to collecting user data
  CUSTOMER_DATA
}

CUSTOMER_DATA(){
  # get phone number from customer
  while [[ -z $CUSTOMER_PHONE ]]
  do
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
  done

  # get customer's name
  CUSTOMER_NAME=$($PSQL "
    SELECT name 
      FROM customers
      WHERE phone = '$CUSTOMER_PHONE'
  ")

  # name not in database
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # new customer inserted
    CUSTOMER_INSERT=$($PSQL "
      INSERT INTO customers(name, phone)
        VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')
    ")
  fi

  # get customer id
  CUSTOMER_ID=$($PSQL "
    SELECT customer_id
      FROM customers
      WHERE phone = '$CUSTOMER_PHONE'
  ")

  echo -e "When would you like to make an appointment?"
  read SERVICE_TIME

  # insert the appointment
  APPOINTMENT_INSERTION=$($PSQL "
    INSERT INTO appointments(customer_id, service_id, time)
      VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')
  ")
  
  # appointment is successfully added
  if [[ $APPOINTMENT_INSERTION == "INSERT 0 1" ]]
  then
    echo I have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME.
  fi
}

SERVICE_MENU