*** Settings ***
Documentation       Acoes, steps, e elementos da home page

Resource            ../base.resource


*** Keywords ***
Go to signup page
    Click    css=a[href="/signup"]
    Wait For Elements State    css=form h1 >> text=Faça seu cadastro    visible    5

Back to home page
    Click    css=a[href="/"]
    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo    visible    5
