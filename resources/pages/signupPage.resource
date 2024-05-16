*** Settings ***
Library    Browser

Resource    ../env.resource

*** Keywords ***
Go To Signup Page
    Go To    ${BASE_URL}/signup

    Wait For Elements State    xpath=//h1    visible    5
    Get Text                   xpath=//h1    equal      Faça seu cadastro

Submit Signup Form
    [Arguments]    ${user}

    Fill Text    xpath=//form//input[@id="name"]        ${user}[name]
    Fill Text    xpath=//form//input[@name="email"]     ${user}[email]
    Fill Text    xpath=//form//input[@id="password"]    ${user}[password]

    Click    xpath=//button[@id="buttonSignup"]
