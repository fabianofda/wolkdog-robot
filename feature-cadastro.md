Funcionalidade: Cadastro de Dog Walkers

    Sendo um visitante do site que curte cuidar de pets
    Posso fazer meu cadastro como Dog Walker
    Para que eu possa ter uma nova fonte de renda com essas atividades

Cenários de aceite:

Contexto:
    Dado que visito o site Walkdog
    E que desejo me tornar Dog Walker

Cenário: Cadastro de dog walker com sucesso

    Quando submeto o formulário de cadastro com os meus dados pessoais
    Então devo ver uma mensagem de sucesso informando que meu cadastro foi para análise

Cenario: CPF inválido

    Quando submeto o formulário infomando um cpf incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "CPF inválido"

Cenario: CEP incorreto

    Quando submeto o formulário infomando um cep incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "Informe um CEP válido"

Cenario: Email incorreto

    Quando submeto o formulário infomando um email incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "Informe um email válido"

Cenário: Cadastro de dog walker que saiba cuidar de pets

    Quando submeto o formulário de cadastro com os meus dados pessoais
    Então devo ver uma mensagem de sucesso informando que meu cadastro foi para análise

Cenário: Cadastro de dog walker que saiba adestrar pets

    Quando submeto o formulário de cadastro com os meus dados pessoais
    Então devo ver uma mensagem de sucesso informando que meu cadastro foi para análise

Cenário: Campos obrigatórios

    Quando submeto o formulário sem preencher nehhum dos campos
    Então deve ver "<mensagens de alerta>" avisando que esses campos são obrigatórios
    
    mensagens de alerta:
     Nome do campo   | Mensagem de alerta com o seguinte texto   |
     --------------- | ----------------------------------------- |
     Nome completo   | Informe o seu nome completo               |
     E-mail          | Informe o seu melhor email                |
     CPF             | Informe o seu CPF                         |
     CEP             | Informe o seu CEP                         |
     Rua             | Informe um número maior que zero          |
     Número          | Adcione um documento com foto (RG ou CHN) |


Modelagem de dados:
| Seletores CSS                  | Nome em Português      | Estado       | Obrigatório?  |
| ------------------------------ | ---------------------- | ------------ | ------------- |
| input[name="name"]             | Nome completo          | Habilitado   | Sim           |
| input[name="email"]            | E-mail                 | Habilitado   | Sim           |
| input[name="cpf"]              | CPF                    | Habilitado   | Sim           |
| input[name="cep"]              | CEP                    | Habilitado   | Sim           |
| input[name="addressStreet"]    | Rua                    | Desabilitado | Sim           |
| input[name="addressNumber"]    | Número                 | Habilitado   | Sim           |
| input[name="addressDetails"]   | Complemento            | Habilitado   | Não           |
| input[name="addressDistrict"]  | Bairro                 | Desabilitado | Sim           |
| input[name="addressCityUf"]    | Cidade/UF              | Desabilitado | Sim           |
| input[type="file"]             | Upload do documento    | Habilitado   | Sim           |

Outros seletores:
| Seletores CSS                                         |
| ----------------------------------------------------- |
| h1 >> text=Cuidado e diversão em cada passo           |    
| a[href="/signup"]                                     |
| form h1 >> text=Faça seu cadastro                     | 
| button >> text=Cadastrar                              | 
| div .swal2-html-container >> text=${expected_message} | 
| .alert-error >> text=${expected_text}                 | 

|  Seletor XPATH                                | 
| --------------------------------------------- |
| //span[text()="${atividade_extra}"]/..        | 