*** Settings ***
Documentation       Acoes, steps, e elementos da funcionalidade de cadastro

Resource            ../base.resource


*** Keywords ***
Go To Signup Page
    Click    css=a[href="/signup"]
    Wait For Elements State    css=form h1 >> text=Faça seu cadastro    visible    5

Fill signup form
    [Arguments]    ${dog_walker}

    Fill Text    css=input[name=name]    ${dog_walker}[nome]
    Fill Text    css=input[name=email]    ${dog_walker}[email]
    Fill Text    css=input[name=cpf]    ${dog_walker}[cpf]
    Fill Text    css=input[name=cep]    ${dog_walker}[cep]

    Click    css=input[value$="CEP"]

    Get Property    css=input[name="addressStreet"]    value    equal    ${dog_walker}[rua]
    Get Property    css=input[name="addressDistrict"]    value    equal    ${dog_walker}[bairro]
    Get Property    css=input[placeholder="Cidade/UF"]    value    equal    ${dog_walker}[cidade_uf]

    Fill Text    css=input[name=addressNumber]    ${dog_walker}[numero]
    Fill Text    css=input[name=addressDetails]    ${dog_walker}[complemento]

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[documento]

Additional service
    [Arguments]    ${atividade_extra}

    ${el}    Set Variable    xpath=//span[text()="${atividade_extra}"]/..

    Wait For Elements State    ${el}    visible    5
    Click    ${el}

Submit signup form
    Click    css=button >> text=Cadastrar

Pop-up with succes message
    [Arguments]    ${expected_message}

    Wait For Elements State    css=div .swal2-html-container >> text=${expected_message}
    ...    visible    5

Warning message
    [Arguments]    ${expected_text}

    Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...    visible    5
