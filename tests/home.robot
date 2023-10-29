*** Settings ***
Documentation       suite de testes de acesso a home page

Resource            ../resources/base.resource


*** Test Cases ***
Home page deve estar online
    Start session
    Finish session
