CREATE DATABASE seeders;

USE seeders;

CREATE TABLE lots(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
);

CREATE TABLE zones(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    lot_id INT FOREIGN KEY REFERENCES lots(id)
);

CREATE TABLE areas(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    zone_id INT FOREIGN KEY REFERENCES zones(id)
);

CREATE TABLE seeders(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
);

CREATE TABLE products(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    seeder_id INT FOREIGN KEY REFERENCES seeders(id),
    area_id INT FOREIGN KEY REFERENCES areas(id)
);

SELECT * FROM lots;
SELECT * FROM zones;
SELECT * FROM areas;
SELECT * FROM seeders;
SELECT * FROM products;

-- crear un inner join que permita mostrar el nombre del producto y el nombre del area donde fue sembrado

SELECT
	products.name as producto,
	areas.name as area_donde_fue_sembrado
FROM products
INNER JOIN areas ON area_id = areas.id

-- mostrar el nombre del sembrador, cantidad de producto que ha sembrado

SELECT
    seeders.name,
	COUNT(products.id) as productos_sembrados
FROM seeders
INNER JOIN products ON seeder_id = seeders.id
GROUP BY seeders.name