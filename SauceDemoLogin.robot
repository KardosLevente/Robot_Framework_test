*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Login with standard user
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Sleep    1s
    Input Text    id=password     secret_sauce
    Sleep    1s
    Click Button  id=login-button
    Sleep    1s
    Page Should Contain Element    id=inventory_container
    Close Browser

Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Sleep    1s
    Input Text    id=password     wrong_password
    Sleep    1s
    Click Button  id=login-button
    # //*[@id="login-button"]
    Sleep    1s
    Page Should Contain Element    css=.error-message-container.error
    Close Browser

Login with locked_out_user
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    locked_out_user
    Sleep    1s
    Input Text    id=password     secret_sauce
    Sleep    1s
    Click Button  id=login-button
    Sleep    1s
    Page Should Contain Element    css=.error-message-container.error
    Close Browser
Login with problem_user
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    problem_user
    Sleep    1s
    Input Text    id=password     secret_sauce
    Sleep    1s
    Click Button  id=login-button
    Sleep    1s
    Page Should Contain Element    id=inventory_container
    Close Browser

Login with performance_glitch_user
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    performance_glitch_user
    Sleep    1s
    Input Text    id=password     secret_sauce
    Sleep    1s
    Click Button  id=login-button
    Sleep    5s
    Page Should Contain Element    id=inventory_container 

    Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=password     secret_sauce
    Sleep    1s
    Click Button  id=login-button
    Sleep    1s
    Page Should Contain Element    css=.error-message-container.error
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Sleep    1s
    Click Button  id=login-button
    Sleep    1s
    Page Should Contain Element    css=.error-message-container.error
    Close Browser