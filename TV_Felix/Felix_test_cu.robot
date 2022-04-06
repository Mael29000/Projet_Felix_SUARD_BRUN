*** test cases ***

Entrer dans le chat 
    # 1. 
    L’utilisateur lance l’exécution du composant Félix
    # 2. 
    Felix affiche la vue connexion
    # 3. 
    L’utilisateur demande à se connecter
    # 4. 
    Felix affiche un message de connexion
    # 5. 
    Felix initie la connexion à Camix
    # 6. 
    Camix inscrit l’utilisateur dans le canal par défaut (place publique)
    # 7. 
    Camix informe les composants Felix des autres utilisateurs inscrits dans le canal par défaut que l’utilisateur arrive dans le chat
    # 8. 
    Chaque composant Felix concerné affiche un message d’arrivé de l’utilisateur dans le chat
    # 9. 
    Camix transmet au composant Felix de l’utilisateur un message d’accueil dans le chat
    # 10.
    Felix ferme la vue connexion
    # 11. 
    Felix affiche la vue chat
    # 12. 
    Felix affiche un message d’accueil dans le chat

Entrer dans le chat [modification de l'IP][modification du port]
    #1
    L'utilisateur lance l'exécution du composant Felix
    #2	
    Felix affiche la vue connexion
    #3.a
    L'utilisateur modifie l'adresse IP
    #3.b
    L'utilisateur modifie le port
    #4
    Felix affiche un message de connexion
    #5
    Felix initie la connexion à Camix

Entrer dans le chat [connexion impossible]
    # 1. 
    L’utilisateur lance l’exécution du composant Félix
    # 2. 
    Felix affiche la vue connexion
    # 3. 
    L’utilisateur demande à se connecter
    # 4. 
    Felix affiche un message de connexion
    # 5. 
    Felix initie la connexion à Camix
    # 6.a 
    Felix affiche un message de connexion impossible. Va en 3