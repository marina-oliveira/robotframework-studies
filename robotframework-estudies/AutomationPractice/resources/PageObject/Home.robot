*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_SIGNIN}        xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

*** Keywords ***

Access the website home page
    Title Should Be     My Store

Click on "Sign in"
     Click Element    ${HOME_SIGNIN}