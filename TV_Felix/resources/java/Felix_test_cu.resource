*** Settings ***
Library     Process
Library     RemoteSwingLibrary

*** Variables ***

${IP_CAMIX}     127.0.0.1
${PORT_CAMIX}   12345
${EMPTY}
${UNCHANGED}
${MSG_CONNEXION}    Connexion au chat @${IP_CAMIX}:${PORT_CAMIX}
${MSG_CONNEXION_IMPOSSIBLE}     impossible

*** Keywords ***

Entrer dans le chat
    Log     TODO

Exécution Camix
    Start Process   java    -jar    SUT/Camix-0.4.3.jar     alias=Camix
    Sleep   2s

Arrêt Camix
    Terminate Process   Camix
    Sleep   1s

L'utilisateur lance l'exécution du composant Felix
    Start Application   Felix    java -jar SUT/Felix-0.4.3.jar
    Sleep   1s

Arrêt Felix
    Switch To Application    Felix
    System Exit
    Sleep   1s

Felix affiche la vue connexion
    Window Should Be Open    Connexion

L'utilisateur demande à se connecter
    Select Window    Connexion
    Push Button    Connexion

Felix affiche un message de connexion
    Select Window    Connexion
    Assert Text Field Value    Information    ${MSG_CONNEXION}

Felix initie la connexion à Camix
    Log     TODO

Camix inscrit l'utilisateur dans le canal par défaut (place publique)
    Log     TODO

Camix informe les composants Felix des autres utilisateurs inscrits dans le canal par défaut que l'utilisateur arrive dans le chat
    Log     TODO

Chaque composant Felix concerné affiche un message d'arrivé de l'utilisateur dans le chat
    Log     TODO

Camix transmet au composant Felix de l'utilisateur un message d'accueil dans le chat
    Log     TODO

Felix ferme la vue connexion
    Log     TODO

Felix affiche la vue chat
    Window Should Be Open    Chat

Felix affiche un message d'accueil dans le chat
    Log     TODO

Felix affiche ses vues initiales
    Log     TODO

Les vues initiales sont correctement initialisées
    Log     TODO

L'utilisateur modifie l'adresse IP
    [Arguments]    ${ip}
    Select Window    Connexion
    Insert Into Text Field    IP    ${ip}

L'utilisateur modifie le port
    [Arguments]    ${port}
    Select Window    Connexion
    Insert Into Text Field    Port    ${port}

Felix affiche un message de connexion impossible. Va en 3
    [Arguments]    ${ip}    ${port}
    Select Window    Connexion
    Wait Until Keyword Succeeds    2x    500ms    Assert Text Field Value    Information    Connexion au chat @${ip}:${port} ${MSG_CONNEXION_IMPOSSIBLE}


Assert Text Field Value
    [Arguments]    ${textfield}    ${expectedValue}
    ${value} =    Get Text Field Value    ${textfield}
    Should Be Equal As Strings    ${value}    ${expectedValue}