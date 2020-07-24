*** Settings ***
Documentation   "Testing My pfSense WebUI using SeleniumLibrary"
Library  SeleniumLibrary

*** Variables ***
${LOGIN URL}    # Add Hostname
${BROWSER}      Chrome
${TITLE}        # Add Page Title
${WELCOMEPG}    # If-needed, welcome page title
${USER}         # Add user
${PW}           # Add password
${DELAY}        0

*** Test Cases ***
Check Login for the `${USER}` user
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username
    Input Password
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]  Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed      ${DELAY}

Login Page Should Be Open
    Title Should Be     ${TITLE}

Input Username
    Input Text      name=usernamefld    ${USER}

Input Password
    Input Text     name=passwordfld   ${PW}
