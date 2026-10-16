# Schema relationnel

## Piege 
### Etape 1
- J'ai choisi "int" pour pouvoir stocker un montant sans virgule 
- j'ai choisi le id comme identifiant car chaque plat est different l'un de l'autre

### Etape 2
- On n'ajoute pas seulement categorie varchar dans "cartes" car ca cause des ambiguité si par exemple :
    - un user entre une categorie "Plat malagasy" et puis un autre va ajouter une categorie "plat gasy" et un autre ajoute avec un synthaxe "plat-malagasy" et si on veut faire la statistique des plats malagasy, on doit mettre plein de condition pour avoir tous les plats malagasy et on risque meme d'oublie la condition pour les autres synthaxe


## Etape 3
- Je met la quantite dans le details_commandes pour pouvoir designer la quantite de chaque plat commandé


## cartes (modifié)
(modifié : enlever categorie varchar et ajouter id_categorie)

cartes( **id**, plat, #id_categorie, prix)

## categories (nouveau)

categorie(**id**, libele)

## commandes (nouveau)

commandes(**id**, date_commande )

## details_commandes (nouveau)

details_commandes(**id**, **#id_commande**, **#id_plat**, quantite)