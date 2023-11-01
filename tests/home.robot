*** Settings ***
Documentation       suite de testes de acesso a home page

Resource            ../resources/base.resource

Suite Setup         Start session


*** Test Cases ***
Home page deve estar online
    Finish session

Deve voltar para home page
    Go to signup page
    Back to home page
    Finish session
