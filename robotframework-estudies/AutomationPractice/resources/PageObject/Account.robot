*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ACCOUNT_SIGNOUT}                            xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

*** Keywords ***
Click on "Sign Out"
     Click Element    ${ACCOUNT_SIGNOUT}