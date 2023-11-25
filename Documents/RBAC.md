<a href="../README.md">Retour au menu</a>

# RBAC de la base de données Au Bon Deal

Le modèle de contrôle d'accès basé sur les rôles pour notre site "Au Bon Deal" est structuré comme il suit.

## Roles:

Administrateur (Admin):
- Gère les utilisateurs et leurs rôles.
-  Accès complet à toutes les fonctionnalités du site.
- Peut ajouter, modifier et supprimer des produits.
- Gère les commandes et les transactions.

Gestionnaire de Produits (Gérant Produits):
- Ajoute, modifie et supprime des produits.
- Gère les stocks et les catégories de produits.
- Peut voir les commandes, mais ne peut pas effectuer des transactions.

Utilisateur Enregistré (Client Enregistré):
- Peut parcourir et rechercher des produits.
- Peut ajouter des produits au panier.
- Peut passer des commandes et suivre leur statut.
- Peut laisser des avis sur les produits.

Invité (Non Enregistré):
- Peut parcourir le catalogue de produits.
- Peut ajouter des produits au panier sans enregistrement.
- Doit s'enregistrer pour finaliser la commande.

## Permissions:

Gestion des Utilisateurs:
- Créer, modifier et supprimer des comptes utilisateur.
- Assigner des rôles aux utilisateurs.

Gestion des Produits:
- Ajouter, modifier et supprimer des produits.
- Gérer les catégories de produits.
- Vérifier les statistiques de vente.

Gestion des Commandes:
- Voir les commandes en attente, en cours et terminées.
- Mettre à jour le statut des commandes.

Gestion du Panier:
- Ajouter des produits au panier.
- Modifier la quantité des produits dans le panier.
- Supprimer des produits du panier.

Gestion des Avis:
- Ajouter, modifier et supprimer des avis sur les produits.

## Politiques d'Accès:

- Seul l'administrateur peut attribuer des rôles aux utilisateurs.
- Les gestionnaires de produits peuvent uniquement modifier les informations liées aux produits.
- Les utilisateurs enregistrés et les invités peuvent ajouter des produits au panier, mais seuls les utilisateurs enregistrés peuvent finaliser une commande.
- Les utilisateurs peuvent modifier ou supprimer leurs propres avis, mais pas ceux des autres.