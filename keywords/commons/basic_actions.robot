*** Settings ***
Documentation     Basic actions keywords
Library           Selenium2Library
Library           DateTime
Library           Collections
Library           String

*** Keywords ***

Click On Element
  [Arguments]  ${locator}
  Wait Until Element Is Visible  ${locator}  timeout=${TIME_TO_WAIT}
  Wait Until Element Is Enabled  ${locator}  timeout=${TIME_TO_WAIT}
  Click Element  ${locator}

Fill Text Input
  [Arguments]  ${locator}  ${text}
  Wait Until Element Is Visible  ${locator}  timeout=${TIME_TO_WAIT}
  Wait Until Element Is Enabled  ${locator}  timeout=${TIME_TO_WAIT}
  Input Text   ${locator}  ${text}

Click On Element List If Contain Text
  [Arguments]  ${list}  ${text}
  :FOR  ${element}  IN  @{list}
   \  ${element_text} =  Get Text Value  ${element}
   \  ${contains} =  Run Keyword And Return Status  Should Contain  ${element_text}  ${text}
   \  Run Keyword If  '${contains}' == 'True'  Click On Element  ${element}

Click On Element List By Text
  [Arguments]  ${list}  ${text}
  ${text} =  Convert To String  ${text}
  ${text} =  Convert To Uppercase  ${text}
  :FOR  ${element}  IN  @{list}
   \  ${element_text} =  Get Text Value  ${element}
   \  ${element_text} =  Convert To String  ${element_text}
   \  ${element_text} =  Convert To Uppercase  ${element_text}
   \  Run Keyword If  "${element_text}" == "${text}"  Click On Element  ${element}
   \  Exit For Loop If  "${element_text}" == "${text}"

Get Elements
   [Arguments]  ${locator}
   Wait Until Element Is Visible  ${locator}  timeout=${TIME_TO_WAIT}
   Wait Until Element Is Enabled  ${locator}  timeout=${TIME_TO_WAIT}
   @{elements} =  Get WebElements  ${locator}
   [Return]  ${elements}

Get Text Value
  [Arguments]  ${locator}
  Wait Until Element Is Visible  ${locator}  timeout=${TIME_TO_WAIT}
  Wait Until Element Is Enabled  ${locator}  timeout=${TIME_TO_WAIT}
  ${text} =  Get Text  ${locator}
  [Return]  ${text}

Get Date Adding Days From Today
   [Arguments]  ${days_to_add}
   ${current_date} =  Get Current Date
   ${calculated_date} =  Add Time To Date  ${current_date}  ${days_to_add} days
   ${calculated_date} =  Convert Date  ${calculated_date}  datetime
   [Return]  ${calculated_date}

Get Day From Date
  [Arguments]  ${date}
  ${day} =  Convert Date  ${date}  result_format=%d
  [Return]  ${day}

Get Month From Date As Number
  [Arguments]  ${date}
  ${month} =  Convert Date  ${date}  result_format=%-m
  [Return]  ${month}

Get Year From Date
  [Arguments]  ${date}
  ${year} =  Convert Date  ${date}  result_format=%Y
  [Return]  ${year}

Moves To Go To Calculated Date
  [Arguments]  ${calculated_date}
  ${current_date} =  Get Current Date
  ${current_year} =  Get Year From Date  ${current_date}
  ${calculated_year} =  Get Year From Date  ${calculated_date}
  ${moves_year} =  Evaluate  (${calculated_year}-${current_year})*12
  ${current_month} =  Get Month From Date As Number  ${current_date}
  ${calculated_month} =  Get Month From Date As Number  ${calculated_date}
  ${moves_month} =  Evaluate  ${calculated_month}-${current_month}
  ${moves} =  Evaluate  ${moves_year}+${moves_month}
  [Return]  ${moves}

Click On Random Element From List
  [Arguments]  ${list}
  ${length} =  Get Length  ${list}
  ${length} =  Evaluate  ${length}-1
  ${random} =  Evaluate  random.randint(1, ${length})  modules=random
  ${element} =  Get From List  ${list}  ${random}
  ${y} =  Get Vertical Position  ${element}
  Scroll Down To  ${y}
  Click On Element  ${element}

Element Text Value Should Be Equal
   [Arguments]  ${locator}  ${value}
   ${value} =  Convert To Uppercase  ${value}
   ${text} =  Get Text Value  ${locator}
   ${text} =  Convert To Uppercase  ${text}
   ${text} =  Strip String  ${text}  mode=both
   Should Be Equal As Strings  ${text}  ${value}

Scroll Down To
   [Arguments]  ${i}
   Execute JavaScript  window.scrollTo(0,${i})
