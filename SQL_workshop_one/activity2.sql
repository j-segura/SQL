-- INFORME DE PROPIETARIOS EN UN SISTEMA DE ARRENDAMIENTO

CREATE DATABASE leases

GO

USE leases

GO

CREATE TABLE owners(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL
)

GO

CREATE TABLE reports(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    date DATETIME NOT NULL,
    owner_id INT FOREIGN KEY REFERENCES owners(id)
)

GO

CREATE TABLE propertie_types(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL
)

GO

CREATE TABLE cities(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL
)

GO

CREATE TABLE kitchen_types(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL
)

GO

CREATE TABLE properties(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    adress VARCHAR(255) NOT NULL,
    num_rooms INT NOT NULL,
    num_living_rooms INT NOT NULL,
    num_dining_rooms INT NOT NULL,
    num_services INT NOT NULL,
    garage BIT NOT NULL,
    city_id INT FOREIGN KEY REFERENCES cities(id),
    propertie_type_id INT FOREIGN KEY REFERENCES propertie_types(id),
    kitchen_type_id INT FOREIGN KEY REFERENCES kitchen_types(id),
    report_id INT FOREIGN KEY REFERENCES reports(id),
)

GO

INSERT INTO owners VALUES('Juan')
INSERT INTO propertie_types VALUES('Apartamento'), ('Casa')
INSERT INTO cities VALUES('Medellin'),('Envigado')
INSERT INTO kitchen_types VALUES('Integral'),('Semi Integral')
INSERT INTO reports(date, owner_id) VALUES('27/05/2023', 1)
INSERT INTO properties(adress,
    num_rooms,
    num_living_rooms,
    num_dining_rooms,
    num_services,
    garage,
    city_id,
    propertie_type_id,
    kitchen_type_id,
    report_id    
) VALUES('Calle 45', 3, 1, 1, 2, 1, 1, 1, 1, 1),('Calle 50', 4, 2, 1, 3, 0, 2, 2, 2, 1)

GO

SELECT * FROM properties