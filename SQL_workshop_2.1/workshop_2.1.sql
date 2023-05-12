CREATE DATABASE shipments;

GO

USE shipments;

GO

CREATE TABLE cities(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE colors(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE categories(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE items(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    city_id INT FOREIGN KEY REFERENCES cities(id)
);

CREATE TABLE components(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    weight FLOAT NOT NULL,
    color_id INT FOREIGN KEY REFERENCES colors(id),
    city_id INT FOREIGN KEY REFERENCES cities(id)
);

CREATE TABLE providers(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    category_id INT FOREIGN KEY REFERENCES categories(id),
    city_id INT FOREIGN KEY REFERENCES cities(id)
);

CREATE TABLE shipments(
    provider_id INT FOREIGN KEY REFERENCES providers(id) NOT NULL,
    component_id INT FOREIGN KEY REFERENCES components(id) NOT NULL,
    item_id INT FOREIGN KEY REFERENCES items(id) NOT NULL,
    quantity INT NOT NULL,
    date DATETIME NOT NULL
);

INSERT INTO cities VALUES('Barranquilla'),('Medellin'),('Cali'),('Bogota');

INSERT INTO colors VALUES('Rojo'),('Verde'),('Azul'),('Morado'),('Amarillo');

INSERT INTO categories VALUES('A'),('B'),('C'),('D');

INSERT INTO items(name, city_id) VALUES('Clasificadora', 1),
    ('Perforadora', 2),
    ('Lectora', 3),
    ('Consola', 4),
    ('Mezcladora', 1),
    ('Terminal', 2),
    ('Cinta', 3),
    ('Clasificadora', 4),
    ('Perforadora', 4),
    ('Lectora', 1);

INSERT INTO components(name, color_id, weight,city_id) VALUES
    ("X3A", 1, 12, 1), 
    ("B85", 2, 17, 2),
    ("C48", 3, 7, 3),
    ("VT8", 4, 20, 4),
    ("C30", 5, 30, 1),
    ("X3A", 1, 54, 2),
    ("B85", 2, 17, 3),
    ("C4B", 3, 10, 4),
    ("VT9", 4, 23, 4),
    ("C31", 5, 30, 1);

INSERT INTO providers(name,category_id,city_id) VALUES
    ('Andres Verjel', 1, 1),
    ('Carlos Villareal', 2, 2),
    ('Julian Jaramillo', 3, 3),
    ('Jose Perez', 4, 4),
    ('Andrea Morales', 1, 1),
    ('Eva Braunt', 2, 2),
    ('Christian Mejia', 3, 3),
    ('Natalia Mendoza', 4, 4),
    ('Daniel Ruiz', 4, 4);

INSERT INTO shipments(provider_id, component_id, item_id, quantity, date) VALUES(1, 1, 1, 100, '13/01/2009'),
    (2, 2, 1, 200, '13/01/2009'),
    (3, 3, 1, 300, '15/01/2009'),
    (4, 4, 1, 400, '20/03/2009'),
    (5, 5, 1, 500, '13/01/2009'),
    (6, 6, 1, 600, '20/03/2009'),
    (7, 7, 1, 700, '30/01/2009'),
    (8, 8, 1, 800, '14/05/2009'),
    (9, 9, 1, 900, '11/07/2009'),
    (1, 10, 1, 1000, '13/03/2009'),
    (2, 1, 1, 100, '16/02/2009'),
    (3, 2, 1, 200, '14/06/2009'),
    (4, 3, 1, 300, '16/08/2009'),
    (5, 4, 1, 400, '11/09/2009'),
    (6, 5, 1, 500, '16/02/2009'),
    (7, 6, 1, 600, '11/06/2009'),
    (8, 7, 1, 700, '19/01/2009'),
    (9, 8, 1, 800, '23/09/2009'),
    (1, 9, 1, 900, '26/01/2009'),
    (2, 10, 1, 1000, '29/12/2009'),
    (3, 1, 1, 100, '12/11/2009'),
    (4, 2, 1, 200, '7/9/2009'),
    (5, 3, 1, 300, '1/11/2009'),
    (6, 4, 1, 400, '8/11/2009'),
    (7, 5, 1, 500, '25/01/2009'),
    (8, 6, 1, 600, '21/01/2009'),
    (9, 7, 1, 700, '11/5/2009')


    



