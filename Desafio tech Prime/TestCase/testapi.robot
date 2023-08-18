*** Settings ***
Resource  ../Resource/resourceApi.robot

*** Variables ***

*** Test Cases ***
#ATIVIDADE 1 VERIFICANDO O COD DE RETORNO
Cenario 01: Validar o status code
    Criar um usuário novo
    Cadastrar o usuário criado na 4devs  status_code_desejado=200

#DEMAIS ATIVIDADES, DECLARAÇAO DE KEYWORDS E VARIAVEIS DISPONIVEIS NO RESOURCE.
Cenario 02: Validar demais atividades solicitadas 
    Criar um usuário novo
    Consultar os dados do novo usuário   status_code_desejado=200
    Conferir os dados retornados