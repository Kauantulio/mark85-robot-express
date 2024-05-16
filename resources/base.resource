*** Settings ***
Library    libs/database.py
Library    Browser
Library    JSONLibrary

Resource    env.resource
Resource    pages/signupPage.resource
Resource    pages/loginPage.resource
Resource    pages/taskCreatePage.resource
Resource    pages/tasksPage.resource
Resource    pages/components/notice.resource
Resource    pages/components/alert.resource
Resource    pages/components/header.resource

Resource    services.resource

*** Keywords ***
Start Session
    New Browser    browser=${BROWSER}    headless=False
    New Page       ${BASE_URL}

Short Password
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary         
    ...        name=kauan                
    ...        email=kauan@gmail.com     
    ...        password=${short_pass}

    Go To Signup Page
    Submit Signup Form    ${user}

    Alert Should Be    Informe uma senha com pelo menos 6 digitos

Get Fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File                                
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8

    [Return]    ${data}[${scenario}]

Reset User From Database
    [Arguments]    ${user}

    Clean user from database     ${user}[email]
    Insert user from database    ${user}

Create A New Task From API
    [Arguments]    ${data}

    POST a user session    ${data}[user]
    POST a new task        ${data}[task]

Do Login
    [Arguments]    ${user}

    Submit Login Form           ${user}          
    User Should Be Logged In    ${user}[name]
