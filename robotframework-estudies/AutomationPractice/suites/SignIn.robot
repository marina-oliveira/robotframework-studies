*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PageObject/Home.robot
Resource            ../resources/PageObject/Login.robot
Resource            ../resources/PageObject/Account.robot


Test Setup          Open webstore
Test Teardown       End test

*** Variables ***


*** Test Cases ***

Test Case 01: Create New Account
    [Documentation]  This test case creates new account using FakerLibrary
    [Tags]           new_account
    Access the website home page
    Click on "Sign in"
    Enter a valid email address to create an account
    Click on "Create an account"
    Fill in the required data
    Submit registration
    Check if the registration was successful
    Click on "Sign Out" option


    #Add new addres using excel and randon

Test Case 02: Log In
#     [Documentation]  This test 
#     [Tags]           successful_log_in
    Access the website home page
    Click on "Sign in"
    Enter a valid email address to log in
    Enter a valid password to log in
    Click on "Sign in" button
    Check if the registration was successful
    Click on "Sign Out" option

 Test Case 03: Log In with invalid email
#     [Documentation]  This test 
      [Tags]           unsuccessful_log_in
      Access the website home page
      Click on "Sign in"
      Enter a invalid email address to log in
      Click on "Sign in" button
      Validate the mesage "Invalid email address."


 Test Case 04: Log In with invalid password
#     [Documentation]  This test 
    [Tags]           invalid_password
    Access the website home page
    Click on "Sign in"
    Enter a valid email address to log in
    Enter an invalid password
    Click on "Sign in" button
    Validate the mesage "Authentication failed."

 Test Case 05: Log In without an email
#     [Documentation]  This test 
    [Tags]           required_email
    Access the website home page
    Click on "Sign in"
    Click on "Sign in" button
    Validate the mesage "An email address required."

Test Case 06: Creat an account with invalid email
    [Documentation]  This test 
    [Tags]           invalid_email_createaccount
    Access the website home page
    Click on "Sign in"
    Enter a invalid email address to create an account
    Click on "Create an account"
    Validate the create account error mesage "Invalid email address."

