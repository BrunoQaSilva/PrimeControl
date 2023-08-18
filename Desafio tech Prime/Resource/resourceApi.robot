*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  validate_docbr.CPF
Library   Press_key/press_tab.py


*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com
    Log  ${EMAIL_TESTE}

Cadastrar o usuário criado na 4devs
    [Arguments]  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      acao=gerar_pessoa
    ...      pontuacao=N
    ...      sexo=H
    ...      txt_qtde=1   
    Log   ${body}
    
    Criar Sessão na 4devs

    ${resposta}  POST On Session
    ...          alias=4devs
    ...          url=/ferramentas_online.php 
    ...          data=${body} 
    ...          expected_status=${status_code_desejado}

    Log  ${resposta.json()}
    
    IF  ${resposta.status_code} == 201
        Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Criar Sessão na 4devs
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/x-www-form-urlencoded 
    Create Session    alias=4devs    url=https://www.4devs.com.br   headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item  ${RESPOSTA}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}  _id

Consultar os dados do novo usuário
#LOCAL ONDE CONSTRUIMOS O VODY PARA GERAR AS TAREFAS PEDIDAS
    [Arguments]  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      acao=gerar_pessoa
    ...      pontuacao=N
    ...      sexo=H
    ...      txt_qtde=1   
    Log   ${body}

    Criar Sessão na 4devs

     ${resposta_c}  POST On Session
    ...          alias=4devs
    ...          url=/ferramentas_online.php
    ...          data=${body}                    
    ...          expected_status=${status_code_desejado}

    # Obtendo as propriedades do objeto response
    Log   ${resposta_c.status_code}
    Log   ${resposta_c.reason}
    Log   ${resposta_c.headers}
    Log   ${resposta_c.elapsed}
    Log   ${resposta_c.text}
    Log   ${resposta_c.json()}
    

    Set Test Variable    ${RESPOSTA_CONSULTA}    ${resposta_c.json()[0]}
    #AQUI FICA A ATIVIDADE 5 Armazenar o campo CPF do ResponseBody em uma variável nomeada CPF.
    ${json_response} =  Set Variable  ${resposta_c.json()[0]}
    ${CPF} =  Set Variable  ${json_response["cpf"]}
    Log   ${CPF}
    #ATIVIDADE 6 Validando CPF localmente
    ${cpf_validator} =  Create CPF Validator
    ${is_valid} =  Validate CPF Using Validator  ${cpf_validator}  ${CPF}
    Should Be True  ${is_valid}  msg=O CPF ${CPF} não é válido.
    #ATIVIDADE 7 Limpando a variavel CPF
    Set Variable  ${CPF}  ${EMPTY}
    Log  ${CPF}
Conferir os dados retornados
    #AQUI FICA A ATIVIDADE 3 - Validar se o valor do campo sexo do ResponseBody é igual a Masculino (Resultado esperado deve ser Sucesso)
    Log   ${RESPOSTA_CONSULTA}
    Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    sexo    Masculino
    #ATVIDIDADE 2
    Dictionary Should Contain Key    ${RESPOSTA_CONSULTA}    idade
    #AQUI FICA A ATIVIDADE 4 Validar se o valor do campo sexo do ResponseBody é igual a Feminino (Resultado esperado deve ser Falha)
    #Dictionary Should Contain Item    ${RESPOSTA_CONSULTA}    sexo    Feminino

Validate CPF Using Validator
    [Arguments]  ${validator}  ${cpf}
    ${result} =  Call Method  ${validator}  validate  ${cpf}
    [Return]  ${result}


