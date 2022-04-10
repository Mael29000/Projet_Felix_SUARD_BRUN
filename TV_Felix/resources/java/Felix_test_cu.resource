*** Settings ***
Library     Process
Library     RemoteSwingLibrary

*** Variables ***

${IP_CAMIX}     127.0.0.1
${PORT_CAMIX}   12345
${EMPTY}
${UNCHANGED}

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
    Log     TODO

L'utilisateur demande à se connecter
    Log     TODO

Felix affiche un message de connexion
    Log     TODO

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
    Log     TODO

Felix affiche un message d'accueil dans le chat
    Log     TODO

Felix affiche ses vues initiales
    Log     TODO

Les vues initiales sont correctement initialisées
    Log     TODO

L'utilisateur modifie l'adresse IP
    Log     TODO

L'utilisateur modifie le port
    Log     TODO

Felix affiche un message de connexion impossible. Va en 3
    Log     TODO