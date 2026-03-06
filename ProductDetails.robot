*** Settings ***
Library           Selenium2Library
Library          Collections
Resource        LoginKeywords.robot


*** Test Cases ***
Termékoldal megnyitása név alapján
    Login with standard user
    Close Browser

Termékoldal megnyitása kép alapján
    Login with standard user
    Click Element     class=inventory_item_img
    Sleep    3s
    Page Should Contain Element    class=inventory_details_img
    Close Browser

Termék információk ellenőrzése - név
    Login with standard user
    ${product_name}=    Get WebElement    class=inventory_item_name
    ${product_name_text}=    Get Text    ${product_name}
    Log    ${product_name_text}
    Click Element    class = inventory_item_name
    Page Should Contain   ${product_name_text}


Termék információk ellenőrzése - ár
    Login with standard user
    ${product_price}=    Get WebElement    class=inventory_item_price
    ${product_price_text}=    Get Text    ${product_price}
    Click Element    class = inventory_item_price
    Close Browser

Termék információk ellenőrzése - leírás
    Login with standard user
    ${product_description}=    Get WebElement    class=inventory_item_desc
    ${product_description_text}=    Get Text    ${product_description}
    Click Element    class = inventory_item_desc
    Page Should Contain   ${product_description_text}
    Close Browser

Termék információk ellenőrzése - kép
    Login with standard user
    ${product_image}=    Get WebElement    class=inventory_item_img
    Click Element    class = inventory_item_img
    Page Should Contain Element    class=inventory_details_img
    Close Browser

Vissza navigáció
    Login with standard user
    Go Back
    Close Browser