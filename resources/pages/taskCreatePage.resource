*** Settings ***
Library    Browser

*** Keywords ***
Submit Task Form
    [Arguments]    ${task}

    Fill Text    xpath=//div//input[@placeholder="Nome da tarefa"]    ${task}[name]

    FOR              ${tag}                              IN        @{task}[tags]
        Fill Text    xpath=//div//input[@name="tags"]    ${tag}

        Sleep    1      #Estrategia de simular o usuario pensando antes de digitar

        Press Keys    xpath=//div//input[@name="tags"]    Enter
    END           

    Click    xpath=//button[contains(text(),"Cadastrar")]
