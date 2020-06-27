*** Settings ***
Resource   ../Support/base_tests.robot

Test Setup        New Session
Test Teardown     Close Session

*** Variables ***
${page_url}                 ${url}/dropdown
${dropdown_class}           class:avenger-list
${dropdown_id}              id:dropdown
${capitain_label}           Steve Rogers
${bucky_label}              Bucky
${tony_stark_value}         3
${natasha_romanoff_value}   4
${bruce_banner_value}       5
${loki_xpath}               xpath://*[@id='dropdown']/option[7]
${scott_lang_xpath}         xpath://*[@id='dropdown']/option[8]

*** Test Cases ***
Selecting at Dropdown List the option Capitain by Label
  [tags]  dropdown_capitain_by_label
  Go To                           ${page_url}
  Select From List By Label       ${dropdown_class}         ${capitain_label}
  ${selected_option}=             Get Selected List Label   ${dropdown_class}
  Should be Equal                 ${selected_option}        ${capitain_label}

Selecting at Dropdown List the option Bucky by Label
  [tags]  dropdown_bucky_by_label
  Go To                           ${page_url}
  Select From List By Label       ${dropdown_class}         ${bucky_label}
  ${selected_option}=             Get Selected List Label   ${dropdown_class}
  Should be Equal                 ${selected_option}        ${bucky_label}

Selecting at Dropdown List the option Tony Stark by Value
  [tags]  dropdown_tony_stark_by_value
  Go To                           ${page_url}
  Select From List By Value       ${dropdown_id}              ${tony_stark_value}
  ${selected_option}=             Get Selected List Value     ${dropdown_id}
  Should be Equal                 ${selected_option}          ${tony_stark_value}

Selecting at Dropdown List the option Natasha Romanoff by Value
  [tags]  dropdown_natasha_romanoff_by_value
  Go To                           ${page_url}
  Select From List By Value       ${dropdown_id}              ${natasha_romanoff_value}
  ${selected_option}=             Get Selected List Value     ${dropdown_class}
  Should be Equal                 ${selected_option}          ${natasha_romanoff_value}

Selecting at Dropdown List the option Bruce Banner by Value
  [tags]  dropdown_bruce_banner_by_value
  Go To                           ${page_url}
  Select From List By Value       ${dropdown_id}              ${bruce_banner_value}
  ${selected_option}=             Get Selected List Value     ${dropdown_id}
  Should be Equal                 ${selected_option}          ${bruce_banner_value}

Selecting at Dropdown List the option Loki by Xpath
  [tags]  dropdown_loki_by_xpath
  Go To                           ${page_url}
  Click Element                   ${dropdown_class}
  Click Element                   ${loki_xpath}
  ${selected_option}=             Get Selected List Value     ${dropdown_class}
  ${expected_option}=             Get Value                   ${loki_xpath}
  Should be Equal                 ${selected_option}          ${expected_option}

Selecting at Dropdown List the option Scott Lang by Xpath
  [tags]  dropdown_scott_lang_by_xpath
  Go To                           ${page_url}
  Click Element                   ${dropdown_id}
  Click Element                   ${scott_lang_xpath}
  ${selected_option}=             Get Selected List Value     ${dropdown_id}
  ${expected_option}=             Get Value                   ${scott_lang_xpath}
  Should be Equal                 ${selected_option}          ${expected_option}