*** Settings ***
Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder apagar uma tarefa
    ${data}    Get Fixture    tasks    delete

    Reset User From Database      ${data}[user]
    Create A New Task From API    ${data}

    Do Login    ${data}[user]

    Request removal               ${data}[task][name]
    Task Should Not Be Existed    ${data}[task][name]
