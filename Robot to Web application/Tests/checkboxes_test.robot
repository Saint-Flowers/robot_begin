*** Settings ***
Resource   ../Support/base_tests.robot

Test Setup        New Session
Test Teardown     Close Session

*** Variables ***
${page_url}       ${url}/checkboxes
${thor}           id:thor
${ironman}        css:input[value='iron-man']
${black_panther}  xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Checking an option using ID
  [tags]  thor_by_id
  Go To                         ${page_url}
  Select checkbox               ${thor}
  Checkbox Should Be Selected   ${thor}
  Sleep                         1

Checking an option using CSS selector
  [tags]  ironman_by_value
  Go To                         ${page_url}
  Select checkbox               ${ironman}
  Checkbox Should Be Selected   ${ironman}

Checking an option using Xpath
  [tags]  black_panther_by_xpath
  Go To                         ${page_url}
  Select checkbox               ${black_panther}
  Checkbox Should Be Selected   ${black_panther}