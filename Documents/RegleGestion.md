<a href="README.md">Retour au menu</a>

# Règles de gestion de la base de données de Au Bon Deal

Les règles de gestion d'une base de données (DBMS, pour Database Management System) sont des directives ou des spécifications qui définissent la manière dont une base de données doit être structurée, gérée et utilisée. Elles contribuent à garantir la qualité des données, la cohérence des informations et la sécurité de la base de données.

Lorsqu'un visiteur souhaite effectuer une commande, il doit avoir créé son compte utilisateur. Si il possède déjà un conte, il devra s'identifier.

Concernant les comptes utilisateurs (Users):
- Un compte utilisateur nécessite un nom d'utilisateur (username) et un mot de passe (password) de longueur minimale de 10 caractères et d'un maximum 20 caractères, comportant au minimum une lettre minuscule, une lettre majuscule, un chiffre et un caractère spécial.
- Le compte utilisateur doit comporter un pseudo, il ne peut être ni nul, ni vide.
- Le nom d'utilisateur ne peut être ni nul, ni vide. Il est unique parmi tous les utilisateurs.
- Le mot de passe ne peut être ni nul, ni vide. Il doit être obligatoirement hashé avec bcrypt.
- La suppression d'un utilisateur n'entraine pas la suppression de ses commandes.

Concernant les produits (Products):
- Le nom du produit ne peut être ni nul, ni vide.
- Le prix ne peut pas être nul et doit être supérieur ou égal à 0.
- La quantité en stock ne peut pas être nulle et doit être supérieure ou égale à 0.
- La suppression d'un produit n'entraine pas la suppression des commandes dans lequel figure le produit.
- Un produit peut figurer dans plusieurs commandes.

Concernant les commandes (Orders):
- Chaque commande est associée à un et un seul compte utilisateur existant.
- Un utilisateur peut ou non être associé à une commande. Un utilisateur peut passer plusieurs commandes.
- Le montant total de la commande ne peut être nul et doit être supérieur à 0.
- La quantité totale commandée ne peut être nulle et doit être supérieure à 0.
- La suppression d'une commande ne supprime pas le compte utilisateur associé.

    


