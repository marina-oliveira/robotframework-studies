*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${LOGIN_EMAIL_CREATE}                        id=email_create
${LOGIN_CREATE_ACCOUNT}                      id=SubmitCreate
${LOGIN_CREATEACCOUNT_TITLE}                 xpath=//*[@id="noSlide"]/h1[contains(text(),"Create an account")]
${LOGIN_INFORMATION}                         xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${LOGIN_GENDER_MRS}                          id=id_gender2
${LOGIN_FIRSTNAME}                           id=customer_firstname
${LOGIN_LASTNAME}                            id=customer_lastname
${LOGIN_ACCOUNT_PASSWD}                      id=passwd
${LOGIN_ADDRESS}                             id=address1
${LOGIN_CITY}                                id=city
${LOGIN_STATE}                               id=id_state
${LOGIN_POSTALCODE}                          id=postcode
${LOGIN_PHONEMOBILE}                         id=phone_mobile
${LOGIN_REGISTER_BUTTON}                     id=submitAccount
${LOGIN_ACCOUNT_SUCCESSMESSAGE}              xpath=//*[@id="center_column"]/p
${LOGIN_ACCOUNT_NAME}                        xpath=//*[@id="header"]/div[2]//div[1]/a/span
${LOGIN_EMAIL_SIGIN}                         id=email
${LOGIN_PASSWORD_SIGIN}                      id=passwd
${LOGIN_SIGIN_BUTTON}                        id=SubmitLogin
${LOGIN_SIGNOUT}                             xpath=//*[@id="header"]//*[@class="logout"][contains(text(),"Sign out")]
${LOGIN_ERROR_MESAGE}                        xpath=//*[@id="center_column"]/div[@class="alert alert-danger"]//li
${LOGIN_CREATEACCOUNTERROR_MESAGE}           xpath=//form[@id="create-account_form"]//div[@class="alert alert-danger"]//li
${LOGIN_CREATE_EMAILFIELD_ERROR}             xpath=//form[@id="create-account_form"]//div[@class="form-group form-error"]


*** Keywords ***
Enter a valid email address to create an account
    Title Should Be     Login - My Store
    Wait Until Element Is Visible   ${LOGIN_EMAIL_CREATE}
    ${LOGIN_NEW_EMAIL}           FakerLibrary.Email
    Set Global Variable    ${LOGIN_NEW_EMAIL}
    Input Text    ${LOGIN_EMAIL_CREATE}        ${LOGIN_NEW_EMAIL}
    

Click on "Create an account"
    Click Button    ${LOGIN_CREATE_ACCOUNT}
    Sleep   7s
    

Fill in the required data
    #Wait Until Element Is Visible        ${LOGIN_CREATEACCOUNT_TITLE} 
    
    ${FAKER_FIRSTNAME}            FakerLibrary.First Name
    ${FAKER_LASTNAME}             FakerLibrary.Last Name
    ${FAKER_ADDRESS}              FakerLibrary.Address
    ${FAKER_CITY}                 FakerLibrary.City
    ${FAKER_POSTALCODE}           FakerLibrary.Postalcode
    ${FAKER_PHONEMOBILE}          FakerLibrary.Phone Number
    ${LOGIN_CLIENT_NAME}          Catenate    ${FAKER_FIRSTNAME}         ${FAKER_LASTNAME}
    Log To Console    ${LOGIN_CLIENT_NAME}
    Set Global Variable           ${LOGIN_CLIENT_NAME}

    Wait Until Element Is Visible    ${LOGIN_INFORMATION}
    Click Element                        ${LOGIN_GENDER_MRS}
    Input Text                           ${LOGIN_FIRSTNAME}            ${FAKER_FIRSTNAME} 
    Input Text                           ${LOGIN_LASTNAME}             ${FAKER_LASTNAME} 
    Input Text                           ${LOGIN_ADDRESS}              ${FAKER_ADDRESS}
    Input Text                           ${LOGIN_CITY}                 ${FAKER_CITY}
    Set Focus To Element                 ${LOGIN_STATE}
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    #Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   id=id_state
    Select From List By Index       ${LOGIN_STATE}                5
    Input Text                      ${LOGIN_POSTALCODE}           ${FAKER_POSTALCODE}
    Input Text                      ${LOGIN_PHONEMOBILE}          555555555
    Input Text                      ${LOGIN_ACCOUNT_PASSWD}       12345

Submit registration
    Click Button    ${LOGIN_REGISTER_BUTTON}

Check if the registration was successful
    Wait Until Element Is Visible    ${LOGIN_ACCOUNT_SUCCESSMESSAGE}
    Element Text Should Be           ${LOGIN_ACCOUNT_SUCCESSMESSAGE}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           ${LOGIN_ACCOUNT_NAME}    ${LOGIN_CLIENT_NAME}

Enter a valid email address to log in
    Title Should Be     Login - My Store
    Wait Until Element Is Visible   ${LOGIN_EMAIL_CREATE}
    Input Text    ${LOGIN_EMAIL_SIGIN}    ${LOGIN_NEW_EMAIL}

Enter a valid password to log in
    Input Password    ${LOGIN_PASSWORD_SIGIN}    12345
    
 Click on "Sign in" button
    Click Button    ${LOGIN_SIGIN_BUTTON}

Click on "Sign Out" option
    Click Element    ${LOGIN_SIGNOUT} 
    Wait Until Element Is Visible    ${LOGIN_EMAIL_CREATE}

Enter a invalid email address to log in
    Title Should Be     Login - My Store
    Wait Until Element Is Visible   ${LOGIN_EMAIL_CREATE}
    Input Text    ${LOGIN_EMAIL_SIGIN}    emailteste123.com

Validate the mesage "${MESAGE_INVALID_EMAIL}"
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESAGE}
    Element Text Should Be    ${LOGIN_ERROR_MESAGE}    ${MESAGE_INVALID_EMAIL}

Enter an invalid password
    Input Text    ${LOGIN_PASSWORD_SIGIN}    54321

Enter a invalid email address to create an account
    Title Should Be     Login - My Store
    Wait Until Element Is Visible   ${LOGIN_EMAIL_CREATE}
    Input Text    ${LOGIN_EMAIL_CREATE}        emailteste123.com

Validate the create account error mesage "Invalid email address."
    Wait Until Element Is Visible    ${LOGIN_CREATEACCOUNTERROR_MESAGE}
    Element Text Should Be    ${LOGIN_CREATEACCOUNTERROR_MESAGE}    Invalid email address.
    Element Should Be Visible    ${LOGIN_CREATE_EMAILFIELD_ERROR}
    