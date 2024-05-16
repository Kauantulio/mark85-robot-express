*** Settings ***
Library    Collections

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    ${user}    Create Dictionary
    ...        name=kauan
    ...        email=kauantulio@gmail.com
    ...        password=teste123456

    Remove user from database    ${user}[email]
    Insert user from database    ${user} 

    Submit Login Form           ${user}          
    User Should Be Logged In    ${user}[name]

Não deve logar com senha invalida
    ${user}    Create Dictionary
    ...        name=tuliokauan
    ...        email=tuliokauan@gmail.com
    ...        password=teste123456

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=senhainvalida123
    Submit Login Form    ${user}

    Notice Should Be    Ocorreu um erro ao fazer login, verifique suas credenciais.
