CREATE DATABASE hospital

GO

USE hospital

GO

CREATE TABLE costumers(
    id INT PRIMARY KEY NOT NULL,
    nom VARCHAR(100) NOT NULL,
)

GO

CREATE TABLE appointments(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    fecha DATETIME NOT NULL,
    costumer_id INT FOREIGN KEY REFERENCES costumers(id) NOT NULL
    doctor_id INT FOREIGN KEY REFERENCES doctors(id) NOT NULL
)

GO

CREATE TABLE doctors(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nom VARCHAR(100) NOT NULL,
)

GO

INSERT INTO costumers(id, nom) VALUES(100, 'Carlos'),
    (101, 'Maria'),
    (102, 'Sandra'),
    (103, 'Monica'),
    (104, 'Leidy'),

GO

INSERT INTO doctors VALUES('Juan'),
    ('Matias'),
    ('Esteban')

INSERT INTO appointments(fecha, costumer_id, doctor_id) VALUES('11/11/2023' 100, 1),
    ('12/12/2022' 100, 1),
    ('11/10/2022' 100, 1),
    ('10/10/2023' 100, 1),


