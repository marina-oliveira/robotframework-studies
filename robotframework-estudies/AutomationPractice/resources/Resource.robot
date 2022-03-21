*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              http://automationpractice.com
${MENU}             xpath=//*[@id="block_top_menu"]/ul

*** Keywords ***
#### Setup e Teardown
Open webstore
  Open Browser   ${URL}  ${BROWSER}               
  Wait Until Element Is Visible    ${MENU}
End test
    Capture Page Screenshot
    Close Browser
    