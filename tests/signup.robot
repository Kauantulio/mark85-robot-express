*** Settings ***
Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuário
    ${user}    Create Dictionary        
    ...        name=kauan               
    ...        email=kauan@gmail.com    
    ...        password=teste123

    Remove user from database    ${user}[email]

    Go To Signup Page

    Submit Signup Form    ${user}
    Notice Should Be      Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com e-mail duplicado
    ${user}    Create Dictionary        
    ...        name=tulio               
    ...        email=tulio@gmail.com    
    ...        password=teste123

    Remove user from database    ${user}[email]
    Insert user from database    ${user} 

    Go To Signup Page

    Submit Signup Form    ${user}
    Notice Should Be      Oops! Já existe uma conta com o e-mail informado.

Campos obrigatórios
    ${user}    Create Dictionary    
    ...        name=${EMPTY}        
    ...        email=${EMPTY}       
    ...        password=${EMPTY}

    Go To Signup Page
    Submit Signup Form    ${user}

    Alert Should Be    Informe seu nome completo
    Alert Should Be    Informe seu e-email
    Alert Should Be    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com e-mail incorreto
    ${user}    Create Dictionary     
    ...        name=kauan            
    ...        email=kauan.com.br    
    ...        password=teste123

    Go To Signup Page
    Submit Signup Form    ${user}

    Alert Should Be    Digite um e-mail válido

Não deve cadastrar com senha muito curta
    @{passwords}    Create List    1    12    123    1234    12345

    FOR        ${password}               IN    @{passwords}
        ${user}    Create Dictionary         
        ...        name=kauan                
        ...        email=kauan@gmail.com     
        ...        password=${password}

        Go To Signup Page
        Submit Signup Form    ${user}

        Alert Should Be    Informe uma senha com pelo menos 6 digitos
    END
