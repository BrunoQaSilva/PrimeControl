*** Settings ***
Library       SeleniumLibrary
Library           FakerLibrary
Library    XML
Library  Collections
Library    OperatingSystem
Resource      ../Variaveis/variaveis.robot
Library   Press_key/press_tab.py

        

*** Keywords ***

Abrir o navegador   
     Open Browser   browser=chrome   
     Maximize Browser Window
     
Fechar o navegador
    Close Browser

Configurar TIMEOUT
    Set Selenium Timeout    ${TIMEOUT}
    Set Selenium Implicit Wait    ${TIMEOUT}
    
Dado que estou na página de login
    Go To    ${URL}  

E preencho login e senha
    Input Text    ${Login}    Admin
    Input Text    ${Password}    admin123

E clique no botão de login
    Click Element    ${BTN_Login}
    Sleep   3

Quando clico em My Info
    Click Element    ${BTN_MyInfo}

E altero o Nome do usuario
    ${NOMEFAKE}       FakerLibrary.Name
    Sleep  2
    Click Element    ${Name}
    Press Backspace Key
    Sleep  2
    Input Text    ${Name}  ${NOMEFAKE}   
    Press Tab Key
    ${NOMEFAKE}       FakerLibrary.Name
    Press Backspace Key
    Input Text    ${MiddleName}    ${NOMEFAKE}
    ${NOMEFAKE}       FakerLibrary.Name
    Input Text    ${LastName}    ${NOMEFAKE}
    Press Tab Key
    ${PALAVRAFAKE}              FakerLibrary.Word
    Press Backspace Key
    Input Text    ${NickName}    ${PALAVRAFAKE}
    Sleep   2
    
Quando preencho os dados de empregado
    ${MESFAKE}                  FakerLibrary.Month
    ${ANOFAKE}                  FakerLibrary.Year
    ${DIADASEMANAFAKE}          FakerLibrary.Day Of Week
    ${DIADOMESFAKE}             FakerLibrary.Day Of Month
    ${ANOFAKE}                  FakerLibrary.Year
    ${CARTAODECREDITOFAKE}      FakerLibrary.Credit Card Number
    Click Element    ${EmployId}
    Press Backspace Key
    Input Text    ${EmployId}    ${ANOFAKE}${ANOFAKE}
    Click Element    ${OtherId}
    Press Backspace Key
    ${ANOFAKE}                  FakerLibrary.Year
    Input Text    ${OtherId}    ${ANOFAKE}${ANOFAKE}
    Click Element    ${DriverLicense}
    Press Backspace Key
    ${ANOFAKE}                  FakerLibrary.Year
    Input Text    ${DriverLicense}    ${ANOFAKE}${ANOFAKE}${ANOFAKE}$
    Click Element    ${LicenseDate}
    Press Backspace Key
    ${ANOFAKE}                  FakerLibrary.Year
    Input Text    ${LicenseDate}    ${ANOFAKE}-${MESFAKE}-${DIADOMESFAKE}
    Click Element    ${SsnNumber}
    Press Backspace Key
    Input Text    ${SsnNumber}    ${CARTAODECREDITOFAKE}
    Click Element    ${SimNumber}
    ${CARTAODECREDITOFAKE}      FakerLibrary.Credit Card Number
    Press Backspace Key
    Input Text    ${SimNumber}    ${CARTAODECREDITOFAKE}
    Sleep   5
    Scroll Element Into View    ${MilitaryServiceLabel}

Click Random Option
    [Arguments]    ${locator1}    ${locator2}
    ${chosen_locator}=    Evaluate    random.choice([$locator1, $locator2])
    Click Element    ${chosen_locator}
    [Return]    ${chosen_locator}

Get Random Letter From Options
    ${random_letter}=    Evaluate    random.choice($OPTIONS)    random
    [Return]    ${random_letter}

E depois preencho o resto dos dados
    ${MESFAKE}                  FakerLibrary.Month
    ${ANOFAKE}                  FakerLibrary.Year
    ${DIADASEMANAFAKE}          FakerLibrary.Day Of Week
    ${DIADOMESFAKE}             FakerLibrary.Day Of Month
    ${ANOFAKE}                  FakerLibrary.Year
    ${CIDADEFAKE}               FakerLibrary.City
    ${PALAVRAFAKE}              FakerLibrary.Word
    Click Element    ${Nationality}
    Press Tab Key
    Press Keys    NONE    ${PALAVRAFAKE}
    Click element  ${MaritalStatus}
    Press Tab Key
    Press Down Arrow Key
    Press Enter Key
    Scroll Element Into View  ${BloodType}
    Click Element    ${BloodType}
    Click Element    ${BirthDate}
    Press Backspace Key
    ${ANOFAKE}                  FakerLibrary.Year
    Input Text    ${BirthDate}    ${ANOFAKE}-${MESFAKE}-${DIADOMESFAKE}
    #seleção do sexo aleatoriamente
    ${clicked_option}=    Click Random Option    ${Male}    ${Female}
    Log    Clicked on ${clicked_option}
    Click Element    ${MilitaryText}
    Press Backspace Key
    Input Text    ${MilitaryText}    Tenent-${PALAVRAFAKE}
    ${clicked_option}=    Click Random Option    ${Smoke}   ${AltSmoke}
    Click Element    ${Save1}
    Validar quando save e clicado
    Scroll Element Into View    ${OrangeHRM}
    Click Element    ${BloodType}
    Press Tab Key
    ${random_element}=    FakerLibrary.Random Choices    elements=('a', 'b', 'o')
    Log    Chosen element: ${random_element}
    Sleep    3
    Press Keys    NONE    ${random_element}
    Press Enter Key
    Click Element    ${Save2}
    Validar quando save e clicado


Dado que o usuário esteja no site 
    Dado que estou na página de login
    E preencho login e senha
    E clique no botão de login

E Realizo o preenchimento do campos com dados aleatórios 
    E altero o Nome do usuario
    Quando preencho os dados de empregado
    E depois preencho o resto dos dados

Então Realizo a add de um anexo 
    #Aqui eu faço o anexo
    Wait Until Element Is Visible    ${Anexos}
    Click Element    ${Anexos}
    Sleep   2
    Click Element    ${Browse}
    Upload File
    Scroll Element Into View    ${OrangeHRM}
    Click Element    ${Coment}
    Sleep    2
    ${PALAVRAFAKE}              FakerLibrary.Word
    Input Text    ${Coment}    ${PALAVRAFAKE} - 
    ${PALAVRAFAKE}              FakerLibrary.Word
    Input Text    ${Coment}    ${PALAVRAFAKE}
    Click Button    ${Save3}  
    Validar quando save e clicado

Validar quando save e clicado
    Wait Until Element Is Visible    ${Confirmation_save}
    Log  Keyword executed successfully
    [Return]  SUCCESS

Todos os saves foram clicados
    ${status}=  Validar quando save e clicado
    Should Be Equal As Strings  ${status}  SUCCESS
