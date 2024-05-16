*** Settings ***
Library    Browser

*** Keywords ***
Task Should Be Registered
    [Arguments]    ${task_name}

    Wait For Elements State    xpath=//strong[@class="task-todo"] >> text=${task_name}
    ...                        visible                                                    5

Mark task as completed
    [Arguments]    ${task_name}

    Wait For Elements State    xpath=//strong[text()="${task_name}"]//..//button[@class="item-toggle"]
    ...                        visible                                                                    5

    Click    xpath=//strong[text()="Criar uma nova IA"]//..//button[@class="item-toggle"]

Task Should Be Complete
    [Arguments]    ${task_name}

    Wait For Elements State    xpath=//strong[@class="task-todo"] >> text=${task_name}
    ...                        visible                                                    5

    Get Style    xpath=//strong[@class="task-todo"] >> text=${task_name}
    ...          text-decoration-line                                       equal    line-through

Request removal
    [Arguments]    ${task_name}

    Wait For Elements State    xpath=//strong[text()="${task_name}"]//..//button[@class="task-remove"]
    ...                        visible                                                                    5

    Click    xpath=//strong[text()="${task_name}"]//..//button[@class="task-remove"]

Task Should Not Be Existed
    [Arguments]    ${task_name}

    Wait For Elements State    xpath=//strong[@class="task-todo"] >> text=${task_name}
    ...                        detached                                                   5
