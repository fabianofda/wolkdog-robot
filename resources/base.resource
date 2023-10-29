*** Settings ***
Documentation       arquivo base do projeto

Library             Browser
Library             OperatingSystem
Resource            actions/signup.resource
Resource            env.resource


*** Keywords ***
Start session
    New Browser    ${BROWSER}    headless=true    slowMo=0
    New Context    viewport={'width': 1380, 'height': 900}

    New Page    https://walkdog.vercel.app
    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo    visible    5

Finish session
    ${shot}=    Evaluate    "${TEST_NAME}"
    Take Screenshot    ${shot}    fullPage=True
    Sleep    2
