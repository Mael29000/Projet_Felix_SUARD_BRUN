*** Settings ***
Resource    resources/java/Felix_test_cu.resource
Library     Process
Library     RemoteSwingLibrary
Suite Setup     Exécution Camix
Suite Teardown  Arrêt Camix


*** Test Cases ***

Entrer dans le chat (smoke test)
    Entrer dans le chat (smoke test)

Entrer dans le chat 
    Entrer dans le chat 

Entrer dans le chat [modification de l'IP][modification du port]
    [Template]  Entrer dans le chat [modification de l'IP][modification du port]
    ${IP_CAMIX}    ${UNCHANGED}
    ${UNCHANGED}    ${PORT_CAMIX}
    ${IP_CAMIX}    ${PORT_CAMIX}

Entrer dans le chat [connexion impossible]
    [Template]  Entrer dans le chat [connexion impossible]
    192.168.1.1       ${UNCHANGED}
    ${UNCHANGED}      420
    192.168.1.1       420

Entrer dans le chat [connexion impossible puis nouvelle tentative réussie]
    [Template]  Entrer dans le chat [connexion impossible puis nouvelle tentative réussie]
    192.168.1.1       420

Entrer dans le chat [longueur du port]
    [Template]  Entrer dans le chat [longueur du port]
    111
    1111
    11111
    111111

Entrer dans le chat [changement de l'ip et du port pendant la connexion]
    [Template]  Entrer dans le chat [changement de l'ip et du port pendant la connexion]
    localhost   420


*** Keywords ***

Entrer dans le chat 
    [Teardown]  Arrêt Felix
    #1
    L'utilisateur lance l'exécution du composant Felix
    #2
    Felix affiche la vue connexion
    #3
    L'utilisateur demande à se connecter
    #4
    Felix affiche un message de connexion   ${IP_CAMIX}   ${PORT_CAMIX}
    #5
    Felix ferme la vue connexion
    #6
    Felix affiche la vue chat


Entrer dans le chat (smoke test)
    [Tags]  smoke
    [Teardown]  Arrêt Felix
    #1
    L'utilisateur lance l'exécution du composant Felix
    #2
    Felix affiche la vue connexion


Entrer dans le chat [modification de l'IP][modification du port]
    [Arguments]     ${ip}   ${port}
    [Teardown]  Arrêt Felix
    #1
    L'utilisateur lance l'exécution du composant Felix
    #2	
    Felix affiche la vue connexion
    #3.a
    L'utilisateur modifie l'adresse IP  ${ip}
    #3.b
    L'utilisateur modifie le port   ${port}
    #4
    L'utilisateur demande à se connecter
    #5
    Felix affiche un message de connexion   ${ip}   ${port}
    #5
    Felix affiche la vue chat


Entrer dans le chat [connexion impossible]
    [Arguments]     ${ip}   ${port}
    [Teardown]  Arrêt Felix
    # 1. 
    L'utilisateur lance l'exécution du composant Felix
    # 2. 
    Felix affiche la vue connexion
    #tmp
    L'utilisateur modifie l'adresse IP  ${ip}
    #tmp
    L'utilisateur modifie le port   ${port}
    # 3. 
    L'utilisateur demande à se connecter
    # 4. 
    Felix affiche un message de connexion   ${ip}   ${port}
    # 6.a 
    Felix affiche un message de connexion impossible. Va en 3   ${ip}   ${port}


Entrer dans le chat [connexion impossible puis nouvelle tentative réussie]
    [Teardown]  Arrêt Felix
    [Arguments]     ${ip}   ${port}
    # 1.
    L'utilisateur lance l'exécution du composant Felix
    # 2.
    Felix affiche la vue connexion
    #
    L'utilisateur modifie l'adresse IP  ${ip}
    #
    L'utilisateur modifie le port   ${port}
    #
    L'utilisateur demande à se connecter
    #
    Felix affiche un message de connexion impossible. Va en 3   ${ip}   ${port}
    #
    L'utilisateur modifie l'adresse IP  ${IP_CAMIX}
    #
    L'utilisateur modifie le port   ${PORT_CAMIX}
    #
    L'utilisateur demande à se connecter
    #
    Felix affiche un message de connexion   ${IP_CAMIX}   ${PORT_CAMIX}
    #
    Felix affiche la vue chat


Entrer dans le chat [longueur du port]
    [Teardown]  Arrêt Felix
    [Arguments]     ${port}
    #1
    L'utilisateur lance l'exécution du composant Felix
    #2
    Felix affiche la vue connexion
    #
    L'utilisateur modifie le port   ${port}
    #
    L'utilisateur demande à se connecter
    #
    Felix affiche un message de connexion impossible. Va en 3   ${UNCHANGED}   ${port}


Entrer dans le chat [changement de l'ip et du port pendant la connexion]
    [Teardown]  Arrêt Felix
    [Arguments]     ${ip}   ${port}
    #
    L'utilisateur lance l'exécution du composant Felix
    #
    Felix affiche la vue connexion
    #
    L'utilisateur modifie l'adresse IP  ${ip}
    #
    L'utilisateur modifie le port   ${port}
    #
    L'utilisateur demande à se connecter
    #
    L'utilisateur modifie l'adresse IP  ${IP_CAMIX}
    #
    L'utilisateur modifie le port   ${PORT_CAMIX}
    #
    felix affiche un message de connexion impossible. va en 3    ${ip}   ${port}