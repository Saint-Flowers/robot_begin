*** Settings ***
Resource   ../Support/base_tests.robot

Test Setup        New Session
Test Teardown     Close Session

*** Variables ***
${page_url}       ${url}/radios
${capitain}       cap
${thor}           thor
${ironman}        iron-man
${avengers}       the-avengers
${guardians}      guardians
${ant_man}        ant-man
${black_panther}  xpath://*[@id='radios']/input[7]

*** Test Cases ***
Selecting the Capitain option using ID
  [tags]  radio_capitain_by_id
  Go To                           ${page_url}
  Select Radio Button             movies        ${capitain}
  Radio Button Should Be Set To   movies        ${capitain}

Selecting the Avengers option using Value
  [tags]  radio_avengers_by_value
  Go To                           ${page_url}
  Select Radio Button             movies        ${avengers}
  Radio Button Should Be Set To   movies        ${avengers}

Selecting the Black Panther option using Xpath
  [tags]  radio_black_panther_by_xpath
  Go To                           ${page_url}
  Assign Id To Element            ${black_panther}  black-panther
  Select Radio Button             movies            black-panther
  Radio Button Should Be Set To   movies            black-panther