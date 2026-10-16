# Schema relationnel

## Piege 
### Etape 1
- J'ai choisi "int" pour pouvoir stocker un montant sans virgule 
- j'ai choisi le id comme identifiant car chaque plat est different l'un de l'autre

### Etape 2
- On n'ajoute pas seulement categorie varchar dans "cartes" car ca cause des ambiguité si par exemple :
    - un user entre une categorie "Plat malagasy" et puis un autre va ajouter une categorie "plat gasy" et un autre ajoute avec un synthaxe "plat-malagasy" et si on veut faire la statistique des plats malagasy, on doit mettre plein de condition pour avoir tous les plats malagasy et on risque meme d'oublie la condition pour les autres synthaxe


### Etape 3
- Je met la quantite dans le details_commandes pour pouvoir designer la quantite de chaque plat commandé

### Etape 4
- Ma clé etrangere n'est pas "NOT NULL"
- Pour ne perdre aucune commande il faut le type :
    - LEFT JOIN

### Etape 5
- une table de la salle et une commande sont different car une table peut avoir plusieurs commandes , par exemple il y  2 client different sur une table et leur commandes sont different

- le nom table pose un probleme en sql car ce nomenclature  est propre a postgres 


## cartes (modifié)
(modifié : enlever categorie varchar et ajouter id_categorie)

cartes( **id**, plat, #id_categorie, prix)

## categories (nouveau)

categorie(**id**, libele)

## commandes (modifié)

commandes(**id**, date_commande, **#id_client**,**#id_table**, **#id_server**)

## details_commandes (nouveau)

details_commandes(**id**, **#id_commande**, **#id_plat**, quantite)

## clients (nouveau)

clients(**id**, nom, prenom)

## servers (nouveau)

servers(**id**, nom, prenom)

## tables (nouveau)

tables(**id**, numero)