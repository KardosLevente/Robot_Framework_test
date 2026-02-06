*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Sauce Demo
    Open Browser    https://www.saucedemo.com/    firefox
    Sleep    3s
    Close Browser
    