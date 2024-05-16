*** Settings ***
Resource    ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${data}    Get Fixture    tasks    create

    Reset User From Database    ${data}[user]

    Do Login    ${data}[user]

    Go To Task Form
    Submit Task Form    ${data}[task]

    Task Should Be Registered    Refatorar aplicação

Não deve cadastrar tarefa com nome duplicado
    [Tags]    dup

    ${data}    Get Fixture    tasks    duplicate

    Reset User From Database      ${data}[user]
    Create A New Task From API    ${data}

    Do Login    ${data}[user]

    Go To Task Form
    Submit Task Form    ${data}[task]

    Notice Should Be    Oops! Tarefa duplicada.

Não deve cadastrar uma nova tarefa quando atinge o limite de tags
    [Tags]    limit

    ${data}    Get Fixture    tasks    tags_limit

    Reset User From Database    ${data}[user]

    Do Login    ${data}[user]

    Go To Task Form
    Submit Task Form    ${data}[task]

    Notice Should Be    Oops! Limite de tags atingido.