*** Settings ***
Documentation    Ações e elementos do componente de notificações

Library    Browser

*** Keywords ***
Notice Should Be
    [Arguments]    ${expected_text}

    Wait For Elements State    css=.notice p
    ...                        visible          5

    Get Text    css=.notice p    equal    ${expected_text}
