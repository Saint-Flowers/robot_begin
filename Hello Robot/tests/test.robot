*** Settings ***
Library   ../app/app.py

*** Test Cases ***
Must to return the Welcome Message
  ${result}=        welcome     Gan
  Log to console    ${result}
  Should Be Equal   ${result}   Hello Gan, welcome to the Robot Framework Basic Trainning!