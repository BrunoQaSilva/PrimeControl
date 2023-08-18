*** Settings ***
Documentation    Essa suite testa o login
Resource         ../Resource/resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador
Suite Setup    Configurar TIMEOUT

*** Test Cases ***

#Funcionalidade: Login na aplicação web

Cenário: Login bem sucedido
    [Tags]        Login
    Dado que o usuário esteja no site 
    Quando clico em My Info
    E Realizo o preenchimento do campos com dados aleatórios 
    Então Realizo a add de um anexo
    Todos os saves foram clicados
    Sleep   10

    