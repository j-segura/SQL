CREATE DATABASE homework

GO

USE homework

GO

create TABLE departments(
    id int PRIMARY KEY IDENTITY(1,1), 
    name VARCHAR(30) NOT NULL, 
)

GO

create TABLE cities(
    id INT PRIMARY KEY IDENTITY(1,1), 
    name VARCHAR(30) NOT NULL, 
    dep_id INT FOREIGN KEY REFERENCES departments(id) NOT NULL,
)

GO

CREATE TABLE companies(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(30) NOT NULL,
    city_id INT FOREIGN KEY REFERENCES cities(id) NOT NULL,
)


INSERT INTO departments(name) VALUES('Antioquia'), ('Cundinamarca')

INSERT INTO cities(name) VALUES('Medellin'), ('Bogota')

INSERT INTO companies(name) VALUES('Coca Cola'), ('Argos')

SELECT
    companies.name as company,
    cities.name as city
FROM companies
INNER JOIN cities
ON companies.city_id = cities.id

SELECT
    cities.id as id,
    cities.name as city,
    departments.name as department
FROM cities
INNER JOIN departments
ON cities.dep_id = departments.id

