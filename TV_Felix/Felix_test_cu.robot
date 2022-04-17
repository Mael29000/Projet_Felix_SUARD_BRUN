*** Settings ***
Resource    resources/java/Felix_test_cu.resource
Library     Process
Library     RemoteSwingLibrary
Suite Setup     Exécution Camix
Suite Teardown  Arrêt Camix

*** Variables ***

${IP_DEFAUT}                        ${IP_CAMIX}
${PORT_DEFAUT}                      ${PORT_CAMIX}
${INFO_DEFAUT}                      Saisir l'adresse et le port du serveur chat
${MESSAGE_CONNEXION}                Connexion au serveur chat \@${EMPTY}{ip}:{port}
${MESSAGE_CONNEXION_IMPOSSIBLE}     Connexion au serveur chat \@${EMPTY}{ip}:{port} impossible
${MESSAGE_ACCUEIL}


*** Test Cases ***

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


*** Keywords ***

Entrer dans le chat 
    [Teardown]  Arrêt Felix
    # 1. 
    L'utilisateur lance l'exécution du composant Felix
    # 2. 
    Felix affiche la vue connexion
    # 3. 
    L'utilisateur demande à se connecter
    # 4. 
    Felix affiche un message de connexion
    # 5. 
    Felix initie la connexion à Camix
    # 6. 
    Camix inscrit l'utilisateur dans le canal par défaut (place publique)
    # 7. 
    Camix informe les composants Felix des autres utilisateurs inscrits dans le canal par défaut que l'utilisateur arrive dans le chat
    # 8. 
    Chaque composant Felix concerné affiche un message d'arrivé de l'utilisateur dans le chat
    # 9. 
    Camix transmet au composant Felix de l'utilisateur un message d'accueil dans le chat
    # 10.
    Felix ferme la vue connexion
    # 11. 
    Felix affiche la vue chat
    # 12. 
    Felix affiche un message d'accueil dans le chat

Entrer dans le chat (smoke test)
    [Tags]  smoke
    [Teardown]  Arrêt Felix
    #1
    L'utilisateur lance l'éxecution du composant Felix
    #2
    Felix affiche ses vues initiales
    Les vues initiales sont correctement initialisées

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
    Felix affiche un message de connexion
    #5
    Felix initie la connexion à Camix

Entrer dans le chat [connexion impossible]
    [Arguments]     ${ip}   ${port}
    [Teardown]  Arrêt Felix
    # 1. 
    L'utilisateur lance l'exécution du composant Felix
    # 2. 
    Felix affiche la vue connexion
    # 3. 
    L'utilisateur demande à se connecter
    # 4. 
    Felix affiche un message de connexion
    # 5. 
    Felix initie la connexion à Camix
    # 6.a 
    Felix affiche un message de connexion impossible. Va en 3