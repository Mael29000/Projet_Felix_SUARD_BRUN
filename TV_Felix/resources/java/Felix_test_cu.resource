*** Settings ***
Library     Process
Library     RemoteSwingLibrary

*** Variables ***

${IP_CAMIX}     127.0.0.1
${PORT_CAMIX}   12345
${EMPTY}
${UNCHANGED}
${MSG_CONNEXION}    Connexion au chat @
${MSG_CONNEXION_IMPOSSIBLE}     impossible

*** Keywords ***

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
    [Arguments]    ${ip}    ${port}
    IF  "${ip}" != "${UNCHANGED}" and "${port}" != "${UNCHANGED}"
        Select Window    Connexion
        Assert Text Field Value    Information    ${MSG_CONNEXION}${ip}:${port}
    ELSE IF  "${ip}" != "${UNCHANGED}" and "${port}" == "${UNCHANGED}"
        Select Window    Connexion
        Assert Text Field Value    Information    ${MSG_CONNEXION}${ip}:${PORT_CAMIX}
    ELSE IF  "${ip}" == "${UNCHANGED}" and "${port}" != "${UNCHANGED}"
        Select Window    Connexion
        Assert Text Field Value    Information    ${MSG_CONNEXION}${IP_CAMIX}:${port}
    ELSE IF  "${ip}" == "${UNCHANGED}" and "${port}" == "${UNCHANGED}"
        Select Window    Connexion
        Assert Text Field Value    Information    ${MSG_CONNEXION}${IP_CAMIX}:${PORT_CAMIX}
    END

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
    IF  "${ip}" != "${UNCHANGED}"
        Select Window    Connexion
        Clear Text Field    IP
        Type Into Text Field    IP    ${ip}
        Sleep   1s
    END

L'utilisateur modifie le port
    [Arguments]    ${port}
    IF  "${port}" != "${UNCHANGED}"
        Select Window    Connexion
        Clear Text Field    Port
        Type Into Text Field    Port    ${port}
        Sleep   1s
    END

Felix affiche un message de connexion impossible. Va en 3
    # TODO Bug -> j'ai l'impression qu'il prend pas les bonnes valeurs -> peut-être le "delay" que l'on impose qui le fait regarder les valeurs trop tard ?
    [Arguments]    ${ip}    ${port}
    IF  "${ip}" != "${UNCHANGED}" and "${port}" != "${UNCHANGED}"
        Select Window    Connexion
        Sleep   4s
        Assert Text Field Value    Information    Connexion au chat @${ip}:${port} ${MSG_CONNEXION_IMPOSSIBLE}
        #Wait Until Keyword Succeeds    2x    500ms    Assert Text Field Value    Information    Connexion au chat @${ip}:${port} ${MSG_CONNEXION_IMPOSSIBLE}
    ELSE IF  "${ip}" != "${UNCHANGED}" and "${port}" == "${UNCHANGED}"
        Select Window    Connexion
        Sleep   4s
        Assert Text Field Value    Information    Connexion au chat @${ip}:${PORT_CAMIX} ${MSG_CONNEXION_IMPOSSIBLE}
        #Wait Until Keyword Succeeds    2x    500ms    Assert Text Field Value    Information    Connexion au chat @${ip}:${PORT_CAMIX} ${MSG_CONNEXION_IMPOSSIBLE}
    ELSE IF  "${ip}" == "${UNCHANGED}" and "${port}" != "${UNCHANGED}"
        Select Window    Connexion
        Sleep   4s
        Assert Text Field Value    Information    Connexion au chat @${IP_CAMIX}:${port} ${MSG_CONNEXION_IMPOSSIBLE}
        #Wait Until Keyword Succeeds    2x    500ms    Assert Text Field Value    Information    Connexion au chat @${IP_CAMIX}:${port} ${MSG_CONNEXION_IMPOSSIBLE}
    ELSE IF  "${ip}" == "${UNCHANGED}" and "${port}" == "${UNCHANGED}"
        Select Window    Connexion
        Sleep   4s
        Assert Text Field Value    Information    Connexion au chat @${IP_CAMIX}:${PORT_CAMIX} ${MSG_CONNEXION_IMPOSSIBLE}
        #Wait Until Keyword Succeeds    2x    500ms    Assert Text Field Value    Information    Connexion au chat @${IP_CAMIX}:${PORT_CAMIX} ${MSG_CONNEXION_IMPOSSIBLE}
    END

Assert Text Field Value
    [Arguments]    ${textfield}    ${expectedValue}
    ${value} =    Get Text Field Value    ${textfield}
    Should Be Equal As Strings    ${value}    ${expectedValue}