#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c "

echo -e "\n~~~ Salon Appointment Menu ~~~\n"

MAIN_MENU(){

  SERVICES=$(echo "$($PSQL "SELECT * FROM services")" | wc -l)

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #List the services
  echo "$($PSQL "SELECT * FROM services")" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ (! $SERVICE_ID_SELECTED =~ ^[0-9]$) || $SERVICE_ID_SELECTED -gt $SERVICES ]]
  then
    MAIN_MENU "Invalid Service, pick again"
  else

    #Ask for phone number
    echo -e "\nEnter your phone number:"
    read CUSTOMER_PHONE

    #Get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    #If not in database
    if [[ -z $CUSTOMER_ID ]] 
    then
      #Ask for name
      echo -e "\nEnter your name:"
      read CUSTOMER_NAME_TO_INSERT
      #Add To Database
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME_TO_INSERT', '$CUSTOMER_PHONE')")
      #Get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi
    
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
    #Ask for time
    echo -e "\nEnter your preferred timeslot:"
    read SERVICE_TIME
    #Add appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  fi

}


MAIN_MENU