*** Settings ***
Documentation     Contains locators in order to find the elements on search page

*** Variables ***
# Menu
${loc_menu_flights_tab}                              xpath=//li[@data-title='flights']

# Search Flights Page
${loc_search_flights_from_field_element}             id=s2id_location_from
${loc_search_flights_from_field}                     id=location_from
${loc_search_flights_from_items}                     xpath=//div[contains(@class, 'select2-result-label')]
${loc_search_flights_to_field_element}               id=s2id_location_to
${loc_search_flights_to_field}                       id=location_to
${loc_search_flights_to_items}                       xpath=//div[contains(@class, 'select2-result-label')]
${loc_search_flights_departure_date_field}           xpath=//input[@name='departure']
${loc_search_flights_departure_calendar_forward}     xpath=//div[contains(@style, 'block')]/div[contains(@class, 'datepicker-days')]//th[@class='next']
${loc_search_flights_departure_calendar_days}        xpath=//div[contains(@style, 'block')]/div[contains(@class, 'datepicker-days')]//td[not(contains(@class, 'disabled'))]
${loc_search_flights_return_date_field}              xpath=//input[@name='arrival']
${loc_search_flights_return_calendar_forward}        xpath=//div[contains(@style, 'block')]/div[contains(@class, 'datepicker-days')]//th[@class='next']
${loc_search_flights_return_calendar_days}           xpath=//div[contains(@style, 'block')]/div[contains(@class, 'datepicker-days')]//td[not(contains(@class, 'disabled'))]
${loc_search_flights_travel_class}                   xpath=//select[@name='cabinclass']
${loc_search_flights_travel_class_items}             xpath=//select[@name='cabinclass']/option
${loc_search_flights_one_way_option}                 xpath=//div[@class='trip-check']/div[1]/div
${loc_search_flights_round_trip_option}              xpath=//div[@class='trip-check']/div[2]/div
${loc_search_flights_select_passengers}              xpath=//input[@name='totalManualPassenger']
${loc_search_flights_adults}                         xpath=//select[@name='madult']
${loc_search_flights_adults_items}                   xpath=//select[@name='madult']/option
${loc_search_flights_children}                       xpath=//select[@name='mchildren']
${loc_search_flights_children_items}                 xpath=//select[@name='mchildren']/option
${loc_search_flights_infants}                        xpath=//select[@name='minfant']
${loc_search_flights_infants_items}                  xpath=//select[@name='minfant']/option
${loc_search_flights_select_passengers_done_button}  id=sumManualPassenger
${loc_search_flights_button}                         xpath=//form[@name='flightmanualSearch']/div[contains(@class, 'bgfade')]/button

# Results - Booking List Page
${loc_result_flights_book_buttons}                   id=bookbtn

# Personal Details And Booking Summary
${loc_personal_details_guest_tab}                    id=guesttab
${loc_personal_details_guest_first_name}             xpath=//input[@name='firstname']
${loc_personal_details_guest_last_name}              xpath=//input[@name='lastname']
${loc_personal_details_guest_email}                  xpath=//input[@name='email']
${loc_personal_details_guest_confirm_email}          xpath=//input[@name='confirmemail']
${loc_personal_details_guest_phone}                  xpath=//input[@name='phone']
${loc_personal_details_guest_address}                xpath=//input[@name='address']
${loc_personal_details_guest_country_field}          xpath=//form[@id='guestform']/div[6]/div[2]
${loc_personal_details_guest_country_items}          xpath=//select[@name='country']/option
${loc_booking_summary_adults}                        xpath=//div[contains(@class, 'summary')]/ul/li[6]/span[contains(@class, 'pull-right')]
${loc_booking_summary_children}                      xpath=//div[contains(@class, 'summary')]/ul/li[7]/span[contains(@class, 'pull-right')]
${loc_booking_summary_infants}                       xpath=//div[contains(@class, 'summary')]/ul/li[8]/span[contains(@class, 'pull-right')]
${loc_booking_summary_confirm_button}                xpath=//button[@name='guest']

# Invoice Page
${loc_invoice_pay_on_arrival}                        xpath=//button[contains(@class, 'arrivalpay')]
${loc_invoice_reserved_message}                      xpath=//table[@id='invoiceTable']/tbody/tr[1]/td/div/b
${loc_invoice_client_full_name}                      xpath=//table[@id='invoiceTable']/tbody/tr[2]/td/div[2]//div[2]
${loc_invoice_client_address}                        xpath=//table[@id='invoiceTable']/tbody/tr[2]/td/div[2]//div[3]
${loc_invoice_client_phone}                          xpath=//table[@id='invoiceTable']/tbody/tr[2]/td/div[2]//div[4]
