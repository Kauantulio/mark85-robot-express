*** Settings ***
Library    Browser

Resource    ../env.resource

*** Keywords ***
Submit Login Form
    [Arguments]    ${user}

    Fill Text    xpath=//div[@class="form-input"]//input[@id="email"]       ${user}[email]
    Fill Text    xpath=//div[@class="form-input"]//input[@id="password"]    ${user}[password]

    Click    xpath=//button[@id="buttonLogin"]
