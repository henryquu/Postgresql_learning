#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"


SERVICE_MENU() {
  # print list of services
  SERVICES=$($PSQL "
    SELECT service_id, name 
      FROM services;
  ")
  echo "$SERVICES" | sed 's/|/) /'

  # get service id from customer 
  echo -e "\nChoose the service:"
  read SERVICE_ID

  # if input is not a number
  if [[ ! $SERVICE_ID =~ ^[0-9]+$ ]]
  then
    echo -e "\nInput a number!"
    SERVICE_MENU
  fi
  
  #get the name of the service
  SERVICE_NAME=$($PSQL "
    SELECT name
      FROM services
      WHERE service_id = $SERVICE_ID
  ")

  # if service doesn't exist
  if [[ -z $SERVICE_NAME ]]
  then
    echo -e "\nInput a number from the avaible group!"
    SERVICE_MENU
  fi
}

CUSTOMER_DATA(){
  # get phone number from customer
  while [[ -z $PHONE_NUMBER ]]
  do
    echo -e "\n What's your phone number?"
    read PHONE_NUMBER
  done

  # get customer's name
  NAME=$($PSQL "
    SELECT name 
      FROM customers
      WHERE phone = '$PHONE_NUMBER'
  ")

  # name not in database
  if [[ -z $NAME ]]
  then
    echo -e "\nWhat's your name?"
    read NAME

    # new customer inserted
    CUSTOMER_INSERT=$($PSQL "
      INSERT INTO customers(phone, name)
        VALUES ('$PHONE_NUMBER', '$NAME')
    ")
  fi
}

SERVICE_MENU
CUSTOMER_DATA