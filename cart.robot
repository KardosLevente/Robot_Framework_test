*** Settings ***
Library           Selenium2Library    


#1. Shopping cart functionality
    #Add multiple products
    #Remove products from the shopping cart
    #Check the contents of the shopping cart

*** Test Cases ***
Add multiple products 
    Login to SauceDemo
    Click Element    id=add-to-cart-sauce-labs-backpack
    Click Element    id=add-to-cart-sauce-labs-bike-light
    Click Element   id=add-to-cart-sauce-labs-bolt-t-shirt
    Element Should Contain    //*[@id="shopping_cart_container"]/a/span    3
    Click Element       //*[@id="shopping_cart_container"]/a

    ${item_count} =     Get Element Count    //*[@class="cart_item"]
    Should Be Equal As Numbers       ${item_count}    3
    Sleep    3s
    Close Browser


*** Keywords ***
Login to SauceDemo
    Open Browser   https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password     secret_sauce
    # Click Button  id=login-button
    Click Button    //*[@id="login-button"]
    Sleep   3s