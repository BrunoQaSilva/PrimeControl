
*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login 
${Login}        //input[contains(@name,'username')]
${Password}     //input[contains(@type,'password')] 
${BTN_Login}        //button[@type='submit'][contains(.,'Login')]
${TIMEOUT}        10s
${BTN_MyInfo}    //span[@class='oxd-text oxd-text--span oxd-main-menu-item--name'][contains(.,'My Info')]
${Name}       name=firstName
${MiddleName}    name=middleName
${LastName}     name=lastName
${NickName}     //input[contains(@wfd-id,'id4')]
${EmployId}    //input[contains(@wfd-id,'id5')]
${OtherId}     //input[contains(@wfd-id,'id6')]
${DriverLicense}        //input[contains(@wfd-id,'id7')]
${LicenseDate}        //input[contains(@wfd-id,'id8')]
${SsnNumber}        //input[contains(@wfd-id,'id9')]
${SimNumber}        //input[contains(@wfd-id,'id10')]
${MilitaryServiceLabel}        //label[@class='oxd-label'][contains(.,'Military Service')]
${Nationality}        //label[@class='oxd-label'][contains(.,'Nationality')]
${MaritalStatus}    //label[@class='oxd-label'][contains(.,'Marital Status')]
${BloodType}        //label[@class='oxd-label'][contains(.,'Blood Type')]
${BirthDate}        //input[contains(@wfd-id,'id11')]
${Male}    //label[contains(.,'Male')]
${Female}    //label[contains(.,'Female')]
${MilitaryText}        //input[contains(@wfd-id,'id14')]
${Smoke}     //label[contains(.,'Yes')]    
${AltSmoke}    //label[@class='oxd-label'][contains(.,'Smoker')]
${OrangeHRM}    //p[@class='oxd-text oxd-text--p orangehrm-copyright'][contains(.,'OrangeHRM OS 5.5')]
${BloodText}    //div[@class='oxd-select-text-input'][contains(.,'A-')]
${ArrowDown1}   /html/body/div/div[1]/div[2]/div[2]/div/div/div/div[2]/div[2]/div/form/div[2]
${ArrowDown2}   /html/body/div/div[1]/div[2]/div[2]/div/div/div/div[2]/div[3]/div[2]/div
${Browse}    //div[@class='oxd-file-button'][contains(.,'Browse')]
${Anexos}    //button[@type='button'][contains(.,'Add')]
${FILE}        C:\\Users\\bruno\\OneDrive\\Imagens\\teste.txt
${Coment}        //textarea[@placeholder='Type comment here']
${Save1}    (//button[@type='submit'][contains(.,'Save')])[1]
${Save2}    (//button[@type='submit'][contains(.,'Save')])[2]
${Save3}    (//button[@type='submit'][contains(.,'Save')])[3]
${Confirmation_save}       //div[@class='oxd-toast-container oxd-toast-container--bottom'][contains(@id,'1')]