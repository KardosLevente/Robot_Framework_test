*** Settings ***
Library           Selenium2Library
Library          Collections
Resource        LoginKeywords.robot


*** Test Cases ***
Üres mezők ellenőrzése - név
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Element    id=checkout
    Input Text    id=first-name     Karoly
    Input Text    id=postal-code     1234
    Click Element    id=continue
    Page Should Contain   text=Error: Last Name is required
    Close Browser

Üres mezők ellenőrzése - cím
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Element    id=checkout
    Input Text    id=first-name     Karoly
    Input Text    id=last-name     Kardos
    Click Element    id=continue
    Page Should Contain   text=Error: Postal Code is required
    Close Browser

Üres mezők ellenőrzése - minden mező üres
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Element    id=checkout
    Click Element    id=continue
    Page Should Contain   text=Error: First Name is required
    Close Browser

Érvénytelen adatok kezelése - túl hosszú név
    ${long_name}=    Evaluate    "A" * 100
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Element    id=checkout
    Input Text    id=first-name     ${long_name}
    Input Text    id=last-name     Kardos
    Input Text    id=postal-code     1234
    Click Element    id=continue
    Page Should Contain   text=Error: First Name is too long
    Close Browser

Érvénytelen adatok kezelése - speciális karakterek
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Element    id=checkout
    Input Text    id=first-name     Karoly!
    Input Text    id=last-name     Kardos@
    Input Text    id=postal-code     1234
    Click Element    id=continue
    Page Should Contain   text=Error: First Name contains invalid characters
    Page Should Contain   text=Error: Last Name contains invalid characters
    Close Browser


