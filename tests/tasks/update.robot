*** Settings ***
Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder marcar uma tarefa como concluída
    ${data}    Get Fixture    tasks    done

    Reset User From Database      ${data}[user]
    Create A New Task From API    ${data}

    Do Login    ${data}[user]

    Mark task as completed     ${data}[task][name]
    Task Should Be Complete    ${data}[task][name]
