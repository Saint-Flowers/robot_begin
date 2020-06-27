*** Settings ***
Resource   ../Support/base_tests.robot

Test Setup        New Session
Test Teardown     Close Session

*** Variables ***
${page_url}             ${url}/login
${page_title}           css:h2
${page_subtitle}        css:h4

${input_username}       id:userId
${input_password}       css:input[name="password"]

${label_username}       css:label[for="username"]
${label_password}       css:label[for="password"]
${welcome_message}      id:flash
${login_error_message}  id:flash

${button_login}     css:button[class='radius btn-login']

*** Keywords ***
Verify Login Page
  ${title}=           Get WebElement        ${page_title}
  ${subtitle}=        Get WebElement        ${page_subtitle}
  Should Be Equal     ${title.text}         Formulário de Login
  Should Be Equal     ${subtitle.text}      Para acessar a área logada, digite stark para o usuário e jarvis! (tudo em caixa baixa) para a senha.\nSe os dados estiverem incorretos, você deverá ver as mensagens de erro.
  
Perform Login
  [Arguments]   ${username}         ${password}
  Input Text    ${input_username}   ${username}
  Input Text    ${input_password}   ${password}
  Click Button  ${button_login}

Verify Logged Area
  [Arguments]         ${expected_message}
  ${title}=           Get WebElement        ${page_title}
  ${subtitle}=        Get WebElement        ${page_subtitle}
  ${message}=         Get WebElement        ${welcome_message}
  Should Be Equal     ${title.text}         Área Logada
  Should Be Equal     ${subtitle.text}      Bem-vindo à área logada. Quando terminar, clique em logout.
  Should Be Equal     ${message.text}       ${expected_message}

Verify Login Error
  [Arguments]         ${expected_message}
  Verify Login Page
  ${message}=         Get WebElement        ${login_error_message}
  Should Be Equal     ${message.text}       ${expected_message}

*** Test Cases ***
Login with good credentials
  [tags]  login_good_credentials
  Go To               ${page_url}
  Perform Login       stark               jarvis!
  Verify Logged Area  Olá, Tony Stark. Você acessou a área logada!\n×

Login with wrong password
  [tags]  login_wrong_password
  Go To               ${page_url}
  Perform Login       stark               wrong_password
  Verify Login Error  Senha é invalida!\n×

Login with unexistent user
  [tags]  login_wrong_username
  Go To               ${page_url}
  Perform Login       404_username        jarvis!
  Verify Login Error  O usuário informado não está cadastrado!\n×

Login with empty password
  [tags]  login_empty_password
  Go To               ${page_url}
  Input Text          ${input_username}   stark
  Click Button        ${button_login}
  Verify Login Error  Senha é invalida!\n×

Login with empty username
  [tags]  login_empty_username
  Go To               ${page_url}
  Input Text          ${input_password}   jarvis!
  Click Button        ${button_login}
  Verify Login Error  O usuário informado não está cadastrado!\n×

Login with empty credentials
  [tags]  login_empty_credentials
  Go To               ${page_url}
  Click Button        ${button_login}
  Verify Login Error  O usuário informado não está cadastrado!\n×

Checking Page Labels and Login Button strings
  [tags]  login_labels_button_strings
  Go To               ${page_url}
  ${username}=        Get WebElement          ${label_username}
  ${password}=        Get WebElement          ${label_password}
  ${login_button}=    Get WebElement          ${button_login}
  Should Be Equal     ${username.text}        Usuário
  Should Be Equal     ${password.text}        Senha
  Should Be Equal     ${login_button.text}    Login

Checking Page Title and Subtitle
  [tags]  login_title_subtitle
  Go To               ${page_url}
  Verify Login Page