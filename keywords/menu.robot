*** Settings ***
Documentation     Menu keywords
Resource          commons/basic_actions.robot
Resource          ../resources/locators/search_flights.robot

*** Keywords ***
Select Flight Tab
  Click On Element  ${loc_menu_flights_tab}
