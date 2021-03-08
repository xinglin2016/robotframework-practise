*** Settings ***
Library  SeleniumLibrary
Test Setup    open browser     ${url}  ${browser}
Test Teardown     close Browser
*** Variables ***
${browser}  chrome
${url}  http://automationpractice.com/index.php/
*** Test Cases ***
LoginTest
    [Tags]  smoke
    loginToApplication
    SeleniumLibrary.Page Should Contain  My account
    sleep  5
SearchTest
    [Tags]  regression
    search
    SeleniumLibrary.Page Should Contain  results have been found
    sleep  5
ViewItemTest
    [Tags]  sanity
    viewItem
    SeleniumLibrary.Page Should Contain  Data sheet
    sleep  5
*** Keywords ***
loginToApplication
    click link  xpath://a[contains(text(),'Sign in')]
    input text  id:email    robottesting2021@gmail.com
    input text  id:passwd      robot2021
    click element   id:SubmitLogin
search
    input text  id:search_query_top    dress
    click element   xpath://header/div[3]/div[1]/div[1]/div[2]/form[1]/button[1]
viewItem
    click element   xpath://header/div[3]/div[1]/div[1]/div[1]/a[1]/img[1]
    click element   //body/div[@id='page']/div[2]/div[1]/div[2]/div[1]/div[1]/ul[1]/li[1]/div[1]/div[1]/div[1]/a[1]/img[1]
