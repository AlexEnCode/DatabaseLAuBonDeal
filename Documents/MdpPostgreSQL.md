<a href="README.md">Retour au menu</a>

## posgreSQL code

<br>


<a href="/Documents/SQLAuBonDeal.sql">Link to SQL files</a>

<br>
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