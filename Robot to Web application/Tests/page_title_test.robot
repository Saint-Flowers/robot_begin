*** Settings ***
Resource   ../Support/base_tests.robot

Test Setup        New Session
Test Teardown     Close Session

*** Test Cases ***
Should see the Page Title
  Title Should Be   Training Wheels Protocol