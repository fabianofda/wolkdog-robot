*** Settings ***
Documentation       suite de testes de cadastro de dog wolker

Resource            ../resources/base.resource

Test Setup          Start session
Test Teardown       Finish session


*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke
    ${dog_walker}    Create Dictionary
    ...    nome= Mister bean
    ...    email=bean@gmail.com
    ...    cpf=00000030007
    ...    cep=06382090
    ...    rua=Rua Yukio Wada
    ...    bairro=Vila Silviânia
    ...    cidade_uf=Carapicuíba/SP
    ...    numero=1000
    ...    complemento=casa 1
    ...    documento=doc.jpg

    Go to signup page
    Fill Signup Form    ${dog_walker}
    Submit Signup Form
    Pop-up With Succes Message    Recebemos o seu cadastro e em breve retornaremos o contato.

Nao deve cadastrar se o cpf for invalido
    [Tags]    cpf_inv
    ${dog_walker_cpf_inv}    Create Dictionary
    ...    nome= disney wold
    ...    email=wold@gmail.com
    ...    cpf=000000300er
    ...    cep=06382090
    ...    rua=Rua Yukio Wada
    ...    bairro=Vila Silviânia
    ...    cidade_uf=Carapicuíba/SP
    ...    numero=1000
    ...    complemento=casa 12
    ...    documento=cpf-inv.png

    Go to signup page
    Fill Signup Form    ${dog_walker_cpf_inv}
    Submit Signup Form
    Warning message    CPF inválido

Nao deve cadastrar se o CEP for invalido
    [Tags]    cep_inv
    ${dog_walker_CEP_inv}    Create Dictionary
    ...    nome= jao best
    ...    email=best@gmail.com
    ...    cpf=00000030007
    ...    cep=${EMPTY}
    ...    rua=${EMPTY}
    ...    bairro=${EMPTY}
    ...    cidade_uf=${EMPTY}
    ...    numero=1000
    ...    complemento=${EMPTY}
    ...    documento=cpf-inv.png

    Go to signup page
    Fill Signup Form    ${dog_walker_CEP_inv}
    Warning message    Informe um CEP válido

Nao deve cadastrar se os campos obrigatorios nao forem preenchidos
    [Tags]    required
    Go to signup page
    Submit Signup Form
    Warning message    Informe o seu nome completo
    Warning message    Informe o seu melhor email
    Warning message    Informe o seu CPF
    Warning message    Informe o seu CEP
    Warning message    Informe um número maior que zero
    Warning message    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um dog walker que saiba cuidar de pets
    [Tags]    add_service 
    ${dog_walker}    Create Dictionary
    ...    nome= Mc catra
    ...    email=mister@gmail.com
    ...    cpf=00000030007
    ...    cep=06382090
    ...    rua=Rua Yukio Wada
    ...    bairro=Vila Silviânia
    ...    cidade_uf=Carapicuíba/SP
    ...    numero=1000
    ...    complemento=casa 123
    ...    documento=doc.jpg

    Go to signup page
    Fill Signup Form    ${dog_walker}
    Additional service    Cuidar
    Submit Signup Form
    Pop-up With Succes Message    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um dog walker que saiba adestrar pets
    [Tags]    add_service 
    ${dog_walker}    Create Dictionary
    ...    nome= Bill gates
    ...    email=bill@gmail.com
    ...    cpf=00000030007
    ...    cep=06382090
    ...    rua=Rua Yukio Wada
    ...    bairro=Vila Silviânia
    ...    cidade_uf=Carapicuíba/SP
    ...    numero=1000
    ...    complemento=casa 1234
    ...    documento=doc.jpg

    Go to signup page
    Fill Signup Form    ${dog_walker}
    Additional service    Adestrar
    Submit Signup Form
    Pop-up With Succes Message    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve validar buscar por CEP sem preenchimento
    Go to signup page
    Search by zip code
    Warning message    Informe um CEP válido
    