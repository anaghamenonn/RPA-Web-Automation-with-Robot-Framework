*** Settings ***
Library         RPA.Browser.Selenium
Library         RPA.Excel.Files
Library         Collections
Library         String
Library         BuiltIn
Library         random
Library         OperatingSystem
Suite Setup     Setup chromedriver

*** Variables ***
${GOOGLE_URL}           https://www.google.com
${SEARCH_BOX}           name=q
${SEARCH_RESULTS}       //div[@id='search']//div[@class='g']//a
${FLIPKART_SEARCH_BOX}  //*[@id="container"]/div/div[1]/div/div/div/div/div[1]/div/div[1]/div/div[1]/div[1]/header/div[1]/div[2]/form/div/div/input
${ITEM_NAME}            //*[@id="container"]/div/div[3]/div[1]/div[2]/div[2]/div/div/div/a/div[3]/div[1]/div[1]
${ITEM_PRICE}           //*[@id="container"]/div/div[3]/div[1]/div[2]/div[2]/div/div/div/a/div[3]/div[2]/div[1]/div[1]/div[1]
${EXCEL_PATH}           C:\\Users\\Desktop\\Website scraper\\mobiles.xlsx

*** Tasks ***
Minimal Task
    Open Google With Signed In Account
    Search For Flipkart
    Search For Mobile Phones Under 10000
    Collect Mobile Data And Save To Excel
    Close All Browsers

*** Keywords ***
Setup chromedriver
    Set Environment Variable  webdriver.chrome.driver  C:\\Users\\Downloads\\chromedriver

Open Google With Signed In Account
    [Documentation]  
    [Tags]    Open with Signed-in Account
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${browser}=    Open Browser    ${GOOGLE_URL}    Chrome    options=${chrome_options}
    Log    Browser opened successfully.
    [Return]    ${browser}

Search For Flipkart
    Input Text    ${SEARCH_BOX}    flipkart
    Press Keys    ${SEARCH_BOX}    ENTER
    Wait Until Element Is Visible    ${SEARCH_RESULTS}    timeout=30s
    Click Element    ${SEARCH_RESULTS}
    Log    First search result clicked successfully.

Search For Mobile Phones Under 10000
    Wait Until Element Is Visible    ${FLIPKART_SEARCH_BOX}    timeout=30s
    Input Text    ${FLIPKART_SEARCH_BOX}    mobiles under 10000
    Press Keys    ${FLIPKART_SEARCH_BOX}    ENTER
    Log    Searched for mobile phones under 10000.

Collect Mobile Data And Save To Excel
    Wait Until Element Is Visible    ${ITEM_NAME}    timeout=30s
    @{names}=    Get WebElements    ${ITEM_NAME}
    @{prices}=   Get WebElements    ${ITEM_PRICE}
    ${rows}=     Create List
    ${len_names}=    Get Length    ${names}
    FOR    ${i}    IN RANGE    ${len_names}
        ${name}=    Get Text    ${names}[${i}]
        ${price}=   Get Text    ${prices}[${i}]
        ${row}=     Create List    ${name}    ${price}
        Append To List    ${rows}    ${row}
    END
    Log    Collected data: ${rows}

    Open Workbook    ${EXCEL_PATH}
    Append Rows To Worksheet    ${rows}    header=["Name", "Price"]
    Save Workbook
    Close Workbook
    Log    Data saved to Excel file successfully.

Close All Browsers
    Close All Browsers
