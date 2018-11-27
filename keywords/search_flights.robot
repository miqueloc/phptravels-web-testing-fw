*** Settings ***
Documentation     Search flights keywords
Resource          commons/basic_actions.robot
Resource          ../resources/locators/search_flights.robot

*** Keywords ***
Fill From City Or Airport Field
  [Arguments]  ${from}
  Click On Element  ${loc_search_flights_from_field_element}
  Fill Text Input  ${loc_search_flights_from_field}  ${from}

Select From City Or Airport On Result List
  [Arguments]  ${from}
  @{results} =  Get Elements  ${loc_search_flights_from_items}
  Click On Element List If Contain Text  ${results}  ${from}

Fill To City Or Airport Field
  [Arguments]  ${to}
  Click On Element  ${loc_search_flights_to_field_element}
  Fill Text Input  ${loc_search_flights_to_field}  ${to}

Select To City Or Airport On Result List
  [Arguments]  ${to}
  @{results} =  Get Elements  ${loc_search_flights_to_items}
  Click On Element List If Contain Text  ${results}  ${to}

Select Round Trip Option
  Click On Element  ${loc_search_flights_round_trip_option}

Select Departure Date
  [Arguments]  ${days_to_add}
  Click On Element  ${loc_search_flights_departure_date_field}
  Move On Calendar  ${loc_search_flights_departure_calendar_forward}  ${days_to_add}
  Select Day On Calendar  ${loc_search_flights_departure_calendar_days}  ${days_to_add}

Select Return Date
  [Arguments]  ${days_to_add}
  Click On Element  ${loc_search_flights_return_date_field}
  Move On Calendar  ${loc_search_flights_return_calendar_forward}  ${days_to_add}
  Select Day On Calendar  ${loc_search_flights_return_calendar_days}  ${days_to_add}

Move On Calendar
  [Arguments]  ${locator}  ${days_to_add}
  ${calculated_date} =  Get Date Adding Days From Today  ${days_to_add}
  ${moves} =  Moves To Go To Calculated Date  ${calculated_date}
  Navigate On Calendar  ${moves}  ${locator}

Navigate On Calendar
  [Arguments]  ${moves}  ${locator}
  Repeat Keyword  ${moves}  Click On Element  ${locator}

Select Day On Calendar
  [Arguments]  ${locator}  ${days_to_add}
  ${calculated_date} =  Get Date Adding Days From Today  ${days_to_add}
  ${day_to_select} =  Get Day From Date  ${calculated_date}
  ${day_to_select} =  Convert to Integer  ${day_to_select}
  @{avail_days} =  Get Elements  ${locator}
  Click On Element List By Text  ${avail_days}  ${day_to_select}

Select Travel Class
  [Arguments]  ${travel_class}
  Click On Element  ${loc_search_flights_travel_class}
  @{travel_class_list} =  Get Elements  ${loc_search_flights_travel_class_items}
  Click On Element List By Text  ${travel_class_list}  ${travel_class}

Click On Passanger Options
  Click On Element  ${loc_search_flights_select_passengers}

Select Number Of Adults
  [Arguments]  ${adults}
  Click On Element  ${loc_search_flights_adults}
  @{adults_list} =  Get Elements  ${loc_search_flights_adults_items}
  Click On Element List By Text  ${adults_list}  ${adults}

Select Number Of Children
  [Arguments]  ${children}
  Click On Element  ${loc_search_flights_children}
  @{children_list} =  Get Elements  ${loc_search_flights_children_items}
  Click On Element List By Text  ${children_list}  ${children}

Select Number Of Infants
  [Arguments]  ${infants}
  Click On Element  ${loc_search_flights_infants}
  @{infants_list} =  Get Elements  ${loc_search_flights_infants_items}
  Click On Element List By Text  ${infants_list}  ${infants}

Click On Done Button
  Click On Element  ${loc_search_flights_select_passengers_done_button}

Click On Search Button
  Click On Element  ${loc_search_flights_button}

Select A Random Flight
  @{flights} =  Get Elements  ${loc_result_flights_book_buttons}
  Click On Random Element From List  ${flights}

Validate Adults On Booking Summary
  [Arguments]  ${adults}
  Element Text Value Should Be Equal  ${loc_booking_summary_adults}  ${adults}

Validate Children On Booking Summary
  [Arguments]  ${adults}
  Element Text Value Should Be Equal  ${loc_booking_summary_children}  ${children}

Validate Infants On Booking Summary
  [Arguments]  ${infants}
  Element Text Value Should Be Equal  ${loc_booking_summary_infants}  ${infants}

Select Book As A Guest Tab
  Click On Element  ${loc_personal_details_guest_tab}

Fill Guest Name Field
  [Arguments]  ${name}
  Fill Text Input  ${loc_personal_details_guest_first_name}  ${name}

Fill Guest Last Name Field
  [Arguments]  ${last_name}
  Fill Text Input  ${loc_personal_details_guest_last_name}  ${last_name}

Fill Guest Email Field
  [Arguments]  ${email}
  Fill Text Input  ${loc_personal_details_guest_email}  ${email}

Fill Guest Email Confirmation Field
  [Arguments]  ${email}
  Fill Text Input  ${loc_personal_details_guest_confirm_email}  ${email}

Fill Guest Contact Number Field
  [Arguments]  ${contact_number}
  Fill Text Input  ${loc_personal_details_guest_phone}  ${contact_number}

Fill Guest Address Field
  [Arguments]  ${address}
  Fill Text Input  ${loc_personal_details_guest_address}  ${address}

Select Guest Country
  [Arguments]  ${country}
  Click On Element  ${loc_personal_details_guest_country_field}
  @{countries} =  Get Elements  ${loc_personal_details_guest_country_items}
  Click On Element List By Text  ${countries}  ${country}

Click On Confirm Booking Button
   Click On Element  ${loc_booking_summary_confirm_button}

Validate Client Full Name On Invoice
  [Arguments]  ${full_name}
  Element Text Value Should Be Equal  ${loc_invoice_client_full_name}  ${full_name}

Validate Client Contact Number On Invoice
  [Arguments]  ${contact_number}
  Element Text Value Should Be Equal  ${loc_invoice_client_phone}  ${contact_number}

Validate Client Address On Invoice
  [Arguments]  ${address}
  Element Text Value Should Be Equal  ${loc_invoice_client_address}  ${address}

Click On Pay On Arrival Button
  Click On Element  ${loc_invoice_pay_on_arrival}

Confirm Pay On Arrival
  Handle Alert

Validate Booking Status Message As Reserved
  Element Text Value Should Be Equal  ${loc_invoice_reserved_message}  ${RESERVED_MESSAGE}
