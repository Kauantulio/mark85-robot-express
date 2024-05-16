*** Settings ***
Documentation    Ações e elementos do componente de mensagem de alerta

Library    Browser

*** Keywords ***
Alert Should Be
    [Arguments]    ${expected_text}

    Wait For Elements State    xpath=//div[@class="alert"]//small >> text=${expected_text}
    ...                        visible                                                        5
