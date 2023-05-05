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
    (1034257728, 'David', 'Segura', '3015775484', 120000000),
    (1035257728, 'Juan', 'Rueda', '3015772764', 234500),
    (1036257728, 'Miguel', 'Moreales', '3455772384', 234567),
    (1037257728, 'Jhon', 'Burgos', '3015776384', 123456),
    (1038257728, 'Camilo', 'Torres', '3011272384', 765432),
    (1013257728, 'Luis', 'Palomino', '3011775484', 098765),
    (1023257728, 'Carlos', 'Carabali', '3012772764', 3456789),
    (1043257728, 'Luna', 'Hurtado', '3445772384', 87654),
    (1053257728, 'Jairo', 'Mora', '3055776384', 23456789),
    (1063257728, 'Oscar', 'Valencia', '3051272384', 12345),
    (1033257729, 'Esteban', 'Muros', '3015775414', 123456),
    (1033257727, 'Jose', 'Pinto', '3015772724', 1234567),
    (1033257726, 'Jesus', 'Vargas', '3455772334', 9765345),
    (1033257725, 'Maria', 'Mona', '3015776344', 2349876),
    (1033257724, 'Gustavo', 'Torrealba', '3011272354', 234567),
    (1033257728, 'Rosa', 'Lopez', '3015775184', 987634),
    (1033257728, 'Risaralda', 'Ramirez', '3015772264', 23098765),
    (1033257728, 'Alejandro', 'Acosta', '3455772484', 2345987),
    (1033257728, 'Isabela', 'Londoño', '3015776584', 234567),
    (1033257728, 'Paulina', 'Jaramillo', '3011276384', 98765432),
