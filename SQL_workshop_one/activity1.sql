CREATE DATABASE empresaxy;

GO

USE empresaxy

GO

CREATE TABLE products(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name VARCHAR(100) NOT NULL,
	value MONEY NOT NULL
)

GO

CREATE TABLE costumers(
	id VARCHAR PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	lastName VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    revenues MONEY NOT NULL,
)

GO

CREATE TABLE invoices(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    product_id INT FOREIGN KEY REFERENCES products(id) NOT NULL,
    costumer_id VARCHAR FOREIGN KEY REFERENCES costumers(id) NOT NULL,
    quantity INT NOT NULL,
)

GO

INSERT INTO products(name, value) VALUES('Banana', 3000),
   ('Mandarina', 5000),
   ('Manzana', 134000),
   ('Pera', 11040),
   ('Naranja', 35000),
   ('Piña', 31000),
   ('Durazno', 11000),
   ('Uva', 13000),
   ('Cereza', 6000),
   ('Melón', 8000);

GO

INSERT INTO costumers(id, name, lastName, phone, revenues) VALUES
    (1, 'David', 'Segura', '3015775484', 120000000),
    (2, 'Juan', 'Rueda', '3015772764', 234500),
    (3, 'Miguel', 'Moreales', '3455772384', 234567),
    (4, 'Jhon', 'Burgos', '3015776384', 123456),
    (5, 'Camilo', 'Torres', '3011272384', 765432),
    (6, 'Luis', 'Palomino', '3011775484', 098765),
    (7, 'Carlos', 'Carabali', '3012772764', 3456789),
    (8, 'Luna', 'Hurtado', '3445772384', 87654),
    (9, 'Jairo', 'Mora', '3055776384', 23456789),
    (10, 'Oscar', 'Valencia', '3051272384', 12345),
    (11, 'Esteban', 'Muros', '3015775414', 123456),
    (12, 'Jose', 'Pinto', '3015772724', 1234567),
    (13, 'Jesus', 'Vargas', '3455772334', 9765345),
    (14, 'Maria', 'Mona', '3015776344', 2349876),
    (15, 'Gustavo', 'Torrealba', '3011272354', 234567),
    (16, 'Rosa', 'Lopez', '3015775184', 987634),
    (17, 'Risaralda', 'Ramirez', '3015772264', 23098765),
    (18, 'Alejandro', 'Acosta', '3455772484', 2345987),
    (19, 'Isabela', 'Londoño', '3015776584', 234567),
    (20, 'Paulina', 'Jaramillo', '3011276384', 98765432)

GO

INSERT INTO ivoices(product_id, costumer_id, quantity) VALUES(1, 1, 10),
    (2, 1, 10),
    (1, 2, 30),
    (3, 3, 40),
    (4, 4, 50),
    (7, 20, 10),
    (7, 5, 10),
    (8, 6, 10),
    (8, 7, 20),
    (9, 19, 10),
    (10, 18, 10),
    (2, 8, 10),
    (2, 9, 10),
    (9, 10, 10),
    (10, 11, 10)

