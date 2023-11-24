# DataBase PostgreSQL pour AuBonDeal

Contribution à la création de "AuBonDeal", une plateforme de commerce en ligne 🚀

## Méthodologie MERISE

La méthode Merise (Méthode d'Etude et de Réalisation Informatique pour les Systèmes d'Entreprise) est née à la fin des années 1970 en France, avec pour objectif de définir une démarche de conception de S.I. Le principe de base repose sur la séparation des données et des traitements.
La conception du système d'information se fait par étapes, afin d'aboutir à un système d'information fonctionnel reflétant une réalité physique. Il s'agit donc de valider une à une chacune des étapes en prenant en compte les résultats de la phase précédente. D'autre part, les données étant séparées des traitements, il faut vérifier la concordance entre données et traitements afin de vérifier que toutes les données nécessaires aux traitements sont présentes et qu'il n'y a pas de données superflues.
il existe trois niveaux de modélisation:

- Le niveau conceptuel, il s'agit du MCD (Modèle Conceptuel des Données)
- Le niveau logique, il s'agit du MLD (Modèle Logique des Données)
- Le niveau physique, il s'agit du MPD (Modèle Physique des Données)

### Le Modèle Conceptuel des Données

Le MCD permet de représenter le système d'information indépendamment de son aspect informatique, il doit être compréhensible par tous: informaticiens, employés, secrétaires, personnel de direction, etc.

### le Modèle Logique des Données

Il s'agit de la représentation modélisée qui précède l'implémentation dans le SGBDR.
Pour ce faire la méthode Merise utilise 2 représentations:

- l'entité: elle regroupe l'information statique et durable.
    Par exemple, l’entité employe rassemble toutes les informations communes aux employés d'une entreprise
    Une entité est représentée par un nom commun écrit en majuscules et au sungulier.
    Exemples: EMPLOYE, DIPLOME, COMMUNE, FOURNISSEUR, etc.
- l'association: elle matérialise la dynamique du système et donc les relations entre les entités.
    Par exemple, l'entité employe est en relation avec l'entité service de l'entreprise.
    L'association (ou relation) est représentée par un verbe d'action ou d'éta à l'infinitif.
    Exemples: HABITER, LOUER, JOUER, CARACTERISER, etc.

### le Modèle Physique des Données

Il s'agit de la représentation modélisée qui précède l'implémentation dans le SGBDR.

## posgreSQL code

Users table creation with user_UUID as a Primary Key :

```SQL
CREATE TABLE
     Users (
         user_UUID uuid PRIMARY KEY NOT NULL,
         user_pseudo VARCHAR(50) UNIQUE NOT NULL,
         username VARCHAR(50) UNIQUE NOT NULL,
         user_password VARCHAR(20) NOT NULL,
         Created_at TIMESTAMP NOT NULL
     );
```

Orders table creation, with order_number as a Primary Key and user_UUID as a Foreign Key :

```SQL
CREATE TABLE
     Orders (
         order_number Serial PRIMARY KEY NOT NULL,
         order_total_cost_ht NUMERIC(10, 2) NOT NULL,
         order_total_quantity INT NOT NULL,
         created_at TIMESTAMP NOT NULL,
         deliver_at TIMESTAMP,
         user_UUID uuid NOT NULL,
         CONSTRAINT fk_Users
          FOREIGN KEY (user_UUID)
           REFERENCES Users(user_UUID)
     );
```

Products table creation with product_UUID as a Primary Key :

```SQL
 CREATE TABLE
     Products (
         product_UUID uuid PRIMARY KEY NOT NULL,
         product_name VARCHAR(50) UNIQUE NOT NULL,
         product_description TEXT,
         product_price NUMERIC(10, 2) NOT NULL,
         product_quantity SMALLINT NOT NULL,
         created_at TIMESTAMP NOT NULL,
         update_at TIMESTAMP
     );
```


belong table creation with product_UUID and order_number as a Primary Key :

```SQL
CREATE TABLE
     productBelongOrder (
         product_UUID uuid NOT NULL,
         order_number Serial NOT NULL,
         CONSTRAINT fk_products FOREIGN KEY (product_UUID) REFERENCES products (product_UUID),
         CONSTRAINT fk_Orders FOREIGN KEY (order_number) REFERENCES orders (order_number)
     );
 ```