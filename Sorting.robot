*** Settings ***
Library           Selenium2Library
Library          Collections
Resource        LoginKeywords.robot

*** Test Cases ***
Sort products from Z to A
    Login with standard user
    Click Element      class = product_sort_container   
    Select From List By Label    class = product_sort_container    Name (Z to A)
    ${product_names}=    Get All Products
    Verify Z to A sorting       ${product_names}
    Sleep    3s
    Close Browser

*** Keywords ***
Get All Products
    ${products}=    Create List
    ${product_elements}=    Get WebElements    class = inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN     @{products}

Verify Z to A sorting
    [Arguments]    @{product_names}
    ${length}=    Get Length    @{product_names}
    FOR    ${index}    IN RANGE  0  ${length}-1
        ${current}=    Get From List    @{product_names}    ${index}
        ${next}=    Get From List    @{product_names}    ${index + 1}

        Should Be True    '${current}' >= '${next}'    Sorting is not Z to A at index ${index}
    END

*** Test Cases ***
Sort products by price from low to high
    Login with standard user
    Click Element      class = product_sort_container   
    Select From List By Label    class = product_sort_container    Price (low to high)
    ${product_prices}=    Get All Product Prices
    Verify low to high sorting       ${product_prices}
    Sleep    3s
    Close Browser

*** Keywords ***
Get All Product Prices
    ${prices}=    Create List
    ${price_elements}=    Get WebElements    class = inventory_item_price
    FOR    ${element}    IN    @{price_elements}
        ${price_text}=    Get Text    ${element}
        ${price}=    Convert To Number    ${price_text.replace('$', '')}
        Append To List    ${prices}    ${price}
    END
    RETURN     @{prices}

Verify low to high sorting
    [Arguments]    @{product_prices}
    ${length}=    Get Length    @{product_prices}
    FOR    ${index}    IN RANGE  0  ${length}-1
        ${current}=    Get From List    @{product_prices}    ${index}
        ${next}=    Get From List    @{product_prices}    ${index + 1}

        Should Be True    ${current} <= ${next}    Sorting is not low to high at index ${index}
    END