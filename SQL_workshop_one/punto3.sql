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

