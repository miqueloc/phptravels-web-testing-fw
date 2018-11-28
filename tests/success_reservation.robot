***Settings***
Documentation     Performs success reservation flight tests
Test Setup        Open Browser Window
Test Teardown     Close Browser
Resource          ../resources/global_variables.robot
Resource          ../keywords/commons/setup_actions.robot
Resource          ../keywords/menu.robot
Resource          ../keywords/search_flights.robot
Test Template     Validate A Successful Reservation As A Guest

*** Test Cases ***
Validate An Economy Round Trip Reservation For 1 Adult, 1 Child and 1 Infant  ${BCN_CITY}  ${LCY_CITY}  ${DEPARTURE_DATE}  ${RETURN_DATE}  ${ECONOMY_TRAVEL_CLASS}  ${ADULTS}  ${CHILDREN}  ${INFANTS}  ${GUEST_NAME}  ${GUEST_LAST_NAME}  ${GUEST_EMAIL}  ${GUEST_CONTACT_NUMBER}  ${GUEST_ADDRESS}  ${GUEST_COUNTRY}

*** Keywords ***
Validate A Successful Reservation As A Guest
  [Arguments]  ${from}  ${to}  ${departure_date}  ${return_date}  ${travel_class}  ${adults}  ${children}  ${infants}  ${name}  ${lastname}  ${email}  ${contact_number}  ${address}  ${country}
  Select Flight Tab
  Fill From City Or Airport Field  ${from}
  Select From City Or Airport On Result List  ${from}
  Fill To City Or Airport Field  ${to}
  Select To City Or Airport On Result List  ${to}
  Select Departure Date  ${departure_date}
  Select Round Trip Option
  Select Return Date     ${return_date}
  Select Travel Class    ${travel_class}
  Click On Passanger Options
  Select Number Of Adults    ${adults}
  Select Number Of Children  ${children}
  Select Number Of Infants    ${infants}
  Click On Done Button
  Click On Search Button
  Select A Random Flight
  Validate Adults On Booking Summary    ${adults}
  Validate Children On Booking Summary  ${children}
  Validate Infants On Booking Summary   ${infants}
  Select Book As A Guest Tab
  Fill Guest Name Field                 ${name}
  Fill Guest Last Name Field            ${last_name}
  Fill Guest Email Field                ${email}
  Fill Guest Email Confirmation Field With The Same Value
  Fill Guest Contact Number Field       ${contact_number}
  Fill Guest Address Field              ${address}
  Select Guest Country                  ${guest_country}
  Click On Confirm Booking Button
  Validate Client Full Name On Invoice            ${GUEST_NAME}${SPACE}${GUEST_LAST_NAME}
  Validate Client Contact Number On Invoice  ${GUEST_CONTACT_NUMBER}
  Validate Client Address On Invoice         ${GUEST_ADDRESS}
  Click On Pay On Arrival Button
  Confirm Pay On Arrival
  Validate Booking Status Message As Reserved
