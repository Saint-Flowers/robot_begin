*** Settings ***
Resource   ../Support/base_tests.robot

Test Setup        New Session
Test Teardown     Close Session

*** Variables ***
${page_url}                       ${url}/tables
${table_class}                    class:tablesorter
${table_id}                       id:actors
${table_headers_css}              css:#actors thead tr

${ironman_xpath}                  xpath:.//tr[contains (., '@robertdowneyjr')]
${edit_ironman_xpath}             ${ironman_xpath}//a[@class="edit"]
${delete_ironman_xpath}           ${ironman_xpath}//a[@class="delete"]

${domic_toreto_xpath}             xpath:.//tr[contains (., '@vindiesel')]
${star_lord_xpath}                xpath:.//tr[contains (., '@prattprattpratt')]
${black_panther_xpath}            xpath:.//tr[contains (., '@chadwickboseman')]

${captain_america_xpath}          xpath:.//tr[contains (., '@teamcevans')]
${edit_captain_america_xpath}     ${captain_america_xpath}//a[@class="edit"]
${delete_captain_america_xpath}   ${captain_america_xpath}//a[@class="delete"]

*** Test Cases ***
Checking the Table Columns Headers
  [tags]  table_headers
  Go To           ${page_url}
  ${headers}      Get WebElement    ${table_headers_css}
  Should Contain  ${headers.text}   Ator
  Should Contain  ${headers.text}   Personagem
  Should Contain  ${headers.text}   Filme
  Should Contain  ${headers.text}   Salário
  Should Contain  ${headers.text}   Instagram
  Should Contain  ${headers.text}   Ações

Checking the Table`s Cell value passing the Row Index
  [tags]  table_cell_value_by_index
  Go To                     ${page_url}
  Table Row Should Contain  ${table_id}   1   Robert Downey Jr
  Table Row Should Contain  ${table_id}   1   Homem de Ferro
  Table Row Should Contain  ${table_id}   1   Vingadores
  Table Row Should Contain  ${table_id}   1   $ 10.000.000
  Table Row Should Contain  ${table_id}   1   @robertdowneyjr
  Table Row Should Contain  ${table_id}   1   edit
  Table Row Should Contain  ${table_id}   1   delete

Checking Ironman at Table Cell searching the Row by Xpath
  [tags]  table_cell_value_ironman_by_xpath
  Go To             ${page_url}
  ${cell_value}     Get WebElement        ${ironman_xpath}
  Should Contain    ${cell_value.text}    Robert Downey Jr
  Should Contain    ${cell_value.text}    Homem de Ferro
  Should Contain    ${cell_value.text}    Vingadores
  Should Contain    ${cell_value.text}    $ 10.000.000
  Should Contain    ${cell_value.text}    @robertdowneyjr
  Should Contain    ${cell_value.text}    edit
  Should Contain    ${cell_value.text}    delete

Checking Dominic Toreto at Table Cell searching the Row by Xpath
  [tags]  table_cell_value_domic_toreto_by_xpath
  Go To             ${page_url}
  ${cell_value}     Get WebElement        ${domic_toreto_xpath}
  Should Contain    ${cell_value.text}    Vin Diesel
  Should Contain    ${cell_value.text}    Domic Toreto
  Should Contain    ${cell_value.text}    Velozes e Furiosos
  Should Contain    ${cell_value.text}    $ 10.000.000
  Should Contain    ${cell_value.text}    @vindiesel
  Should Contain    ${cell_value.text}    edit
  Should Contain    ${cell_value.text}    delete

Checking Star Lord at Table Cell searching the Row by Xpath
  [tags]  table_cell_value_star_lord_by_xpath
  Go To             ${page_url}
  ${cell_value}     Get WebElement        ${star_lord_xpath}
  Should Contain    ${cell_value.text}    Chris Pratt
  Should Contain    ${cell_value.text}    Senhor das Estrelas
  Should Contain    ${cell_value.text}    Vingadores
  Should Contain    ${cell_value.text}    $ 10.000.000
  Should Contain    ${cell_value.text}    @prattprattpratt
  Should Contain    ${cell_value.text}    edit
  Should Contain    ${cell_value.text}    delete

Checking Black Panther at Table Cell searching the Row by Xpath
  [tags]  table_cell_value_black_panther_by_xpath
  Go To             ${page_url}
  ${cell_value}     Get WebElement        ${black_panther_xpath}
  Should Contain    ${cell_value.text}    Chadwick Boseman
  Should Contain    ${cell_value.text}    Pantera Negra
  Should Contain    ${cell_value.text}    Vingadores
  Should Contain    ${cell_value.text}    $ 700.000
  Should Contain    ${cell_value.text}    @chadwickboseman
  Should Contain    ${cell_value.text}    edit
  Should Contain    ${cell_value.text}    delete

Checking Captain America at Table Cell searching the Row by Xpath
  [tags]  table_cell_value_captain_america_by_xpath
  Go To             ${page_url}
  ${cell_value}     Get WebElement        ${captain_america_xpath}
  Should Contain    ${cell_value.text}    Chris Evans
  Should Contain    ${cell_value.text}    Capitão América
  Should Contain    ${cell_value.text}    Vingadores
  Should Contain    ${cell_value.text}    $ 7.000.000
  Should Contain    ${cell_value.text}    @teamcevans
  Should Contain    ${cell_value.text}    edit
  Should Contain    ${cell_value.text}    delete

Edit Ironman at Table Cell searching the Row by Xpath
  [tags]  edit_ironman_by_xpath
  Go To             ${page_url}
  Click Link        ${edit_ironman_xpath}
  Sleep             5
  ${message}=	      Handle Alert
  Should be Equal   ${message}              Robert Downey Jr foi selecionado para edição!

Delete Ironman at Table Cell searching the Row by Xpath
  [tags]  delete_ironman_by_xpath
  Go To             ${page_url}
  Click Link        ${delete_ironman_xpath}
  Sleep             5
  ${message}=	      Handle Alert
  Should be Equal   ${message}              Robert Downey Jr foi selecionado para remoção!

Edit Captain America at Table Cell searching the Row by Xpath
  [tags]  edit_captain_america_by_xpath
  Go To             ${page_url}
  Click Link        ${edit_captain_america_xpath}
  Sleep             5
  ${message}=	      Handle Alert
  Should be Equal   ${message}              Chris Evans foi selecionado para edição!

Delete Captain America at Table Cell searching the Row by Xpath
  [tags]  delete_captain_america_by_xpath
  Go To             ${page_url}
  Click Link        ${delete_captain_america_xpath}
  Sleep             5
  ${message}=	      Handle Alert
  Should be Equal   ${message}              Chris Evans foi selecionado para remoção!