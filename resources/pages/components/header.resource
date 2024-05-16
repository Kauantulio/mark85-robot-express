*** Settings ***
Documentation    Ações e elementos do header

Library    Browser

*** Keywords ***
User Should Be Logged In
    [Arguments]    ${name}

    Wait For Elements State    xpath=//header//div[@class="right"]//small
    ...                        visible                                       5

    Get Text    xpath=//header//div[@class="right"]//small    equal    Olá, ${name}

Go To Task Form
    Click    xpath=//header//button[contains(text(),"Nova tarefa")]
