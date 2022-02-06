*** Settings ***
Library         SSHLibrary
Suite Setup     Open Connection And Log In
Suite Teardown  Close All Connections

*** Variables ***
${HOST}         clab-walk-client1
${USERNAME}     lab
${PASSWORD}     lab123

*** Keywords ***
Open Connection And Log In
    Open Connection     ${HOST}         port=2222
    Login               ${USERNAME}     ${PASSWORD}

*** Test Cases ***
Ping to client2
    ${output}=          Execute Command     ping 10.0.12.5 -c 5       sudo=true       sudo_password=${PASSWORD}
    Should Contain      ${output}           5 packets received, 0% packet loss

Ping to client3
    ${output}=          Execute Command     ping 10.0.13.5 -c 5       sudo=true       sudo_password=${PASSWORD}
    Should Contain      ${output}           5 packets received, 0% packet loss
