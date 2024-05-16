*** Settings ***
Documentation    Cenários de testes para tentativa de cadastro com senha muito curta

Resource    ../resources/base.resource

Test Template    Short Password

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Não deve cadastrar senha com 1 digito    1

Não deve cadastrar senha com 2 digitos    12

Não deve cadastrar senha com 3 digitos    123

Não deve cadastrar senha com 4 digitos    1234

Não deve cadastrar senha com 5 digitos    12345

*** Keywords ***
Short Password
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary         
    ...        name=kauan                
    ...        email=kauan@gmail.com     
    ...        password=${short_pass}

    Go To Signup Page
    Submit Signup Form    ${user}

    Alert Should Be    Informe uma senha com pelo menos 6 digitos
