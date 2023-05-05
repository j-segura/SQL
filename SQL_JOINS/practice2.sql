CREATE DATABASE store

GO

USE store

GO

CREATE TABLE categories(
    id INT PRIMARY KEY IDENTITY(1,1),
    nom VARCHAR(255) NOT NULL,
)

GO

CREATE TABLE invoices(
    id INT PRIMARY KEY NOT NULL,
    fecha DATETIME NOT NULL,
)

GO

CREATE TABLE products(
    id INT PRIMARY KEY IDENTITY(1,1),
    nom VARCHAR(255) NOT NULL,
    category_id INT FOREIGN KEY REFERENCES categories(id) NOT NULL,
)

GO

CREATE TABLE invoice_product_details(
    id INT PRIMARY KEY IDENTITY(1,1),
    invoice_id INT FOREIGN KEY REFERENCES invoices(id) NOT NULL,
    product_id INT FOREIGN KEY REFERENCES products(id) NOT NULL,
    quantity INT NOT NULL,
)

GO

INSERT INTO categories VALUES('Computadores'), ('Lacteos')

GO

INSERT INTO invoices(id, fecha) VALUES(100, '10/10/2021'),
    (101, '10/10/2020'),
    (102, '10/10/2023')

GO

INSERT INTO products(nom, category_id) VALUES('usb', 1),('cds', 1),('leche', 2)

GO

INSERT INTO invoice_product_details(invoice_id, product_id, quantity) VALUES(101, 1, 20),(101, 2, 10)





