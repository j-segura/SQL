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

INSERT INTO categories(id, name) VALUES(10, 'A'),(20, 'B'),(30, 'C'),(40, 'D'),

INSERT INTO items(name, city_id) VALUES('Clasificadora', 1),
    ('Perforadora', 2),
    ('Lectora', 3),
    ('Consola', 4),
    ('Mezcladora', 1),
    ('Terminal', 2),
    ('Cinta', 3),
    ('Clasificadora', 4),
    ('Perforadora', 4),
    ('Lectora', 1),
