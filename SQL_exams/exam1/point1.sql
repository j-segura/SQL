CREATE DATABASE flights;

USE flights;

CREATE TABLE cities(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
);

CREATE TABLE classes(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE airplanes(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    cod VARCHAR(100) NOT NULL,
);

CREATE TABLE users(
    dni INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    last_name1 VARCHAR(100) NOT NULL,
    last_name2 VARCHAR(100),
    address VARCHAR(255),
    city_id INT FOREIGN KEY REFERENCES cities(id), /* cuidad a la que pertenece el usuario */
); 

CREATE TABLE flights(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    departure INT FOREIGN KEY REFERENCES cities(id), /* cuidad de salida */
    destination INT FOREIGN KEY REFERENCES cities(id), /* cuidad de llegada */
    date_output DATETIME NOT NULL, /* fecha y hora de salida */
    date_arrival DATETIME NOT NULL, /* fecha y hora de entrada */
    max_seats INT NOT NULL, /* maximo de plazas que tiene el vuelo disponible */
    airplane_id INT FOREIGN KEY REFERENCES airplanes(id), /* avion que pertenece va ser usado en el vuelo */
);

CREATE TABLE flights_classes( 
    num_flight INT FOREIGN KEY REFERENCES flights(id) NOT NULL,
    class_id INT FOREIGN KEY REFERENCES classes(id) NOT NULL,
    seats INT NOT NULL, /* cantidad de plazas disponibles para la clase de un vuelo en especifico */
    price MONEY NOT NULL,
);

CREATE TABLE paths(
    user_id INT FOREIGN KEY REFERENCES users(dni) NOT NULL,
    flight_id INT FOREIGN KEY REFERENCES flights(id) NOT NULL,
);

SELECT * FROM cities;
SELECT * FROM classes;
SELECT * FROM airplanes;
SELECT * FROM users;
SELECT * FROM flights;
SELECT * FROM flights_classes;
SELECT * FROM paths;

INSERT INTO cities VALUES('New York', 'Newyorkino'),
                         ('Los Angeles', 'Angelianos'),
                         ('texas', 'Texianos'),
                         ('Florida', 'Florinicenses');

INSERT INTO classes VALUES('New York'),('Los Angeles'),('Texas'),('Florida');

INSERT INTO airplanes VALUES('GH32'),('JE54'),('BN20'),('BG77');

INSERT INTO users VALUES('Alex', 'Born', 'Treps', 'avenida 3', 1),
                        ('Mary', 'cirlcle', 'pam', 'calle 12', 2),
                        ('Juan', 'Rodrigez', 'Gonzales', 'parque texas #22', 3),
                        ('Mark', 'duplin', 'gess', 'avenida 4', 4);

INSERT INTO flights VALUES(1, 2, '13/01/2023', '14/01/2023', 100, 1),
                          (2, 3, '13/01/2023', '14/01/2023', 120, 2),
                          (3, 4, '13/01/2023', '14/01/2023', 30, 3),
                          (4, 1, '13/01/2023', '14/01/2023', 45, 4);

INSERT INTO flights_classes(num_flight, class_id, seats, price) VALUES(3, 2, 50, 200),
                                                                      (3, 3, 50, 500),
                                                                      (4, 4, 20, 1200),
                                                                      (4, 1, 100, 100);
                                                                    
INSERT INTO paths VALUES(1, 3),(2, 3),(3, 6),(1, 5);

BEGIN TRANSACTION updating_classes;

UPDATE classes SET name = 'Economica' WHERE id = 1;
UPDATE classes SET name = 'Turista' WHERE id = 2;
UPDATE classes SET name = 'Preferencial' WHERE id = 3;
UPDATE classes SET name = 'VIP' WHERE id = 4;

ROLLBACK TRANSACTION updating_classes;

COMMIT TRANSACTION updating_classes;


BEGIN TRANSACTION add_user;

INSERT INTO users VALUES('Sara', 'Sanchez', 'sabal', 'calle 4', 1);

ROLLBACK TRANSACTION add_user;

COMMIT TRANSACTION add_user;


DECLARE @discount FLOAT
SET @discount = 0.1

UPDATE flights_classes SET price = price - price * @discount WHERE num_flight = 3;

DECLARE @clientOneName VARCHAR

SET @clientOneName = (SELECT last_name1 FROM users WHERE dni = 1);

PRINT @clientOneName;

-- Mostrar numero de vuelo clase y precio

SELECT
	flights.id as numero_de_vuelo,
	classes.name as clase,
	flights_classes.price as precio
FROM flights
INNER JOIN flights_classes ON num_flight = flights.id
INNER JOIN classes ON class_id = classes.id

-- mostrar los aviones y lo vuelos que tienen programados

SELECT
    airplanes.cod,
	COUNT(flights.id) as numero_de_vuelo
FROM airplanes
INNER JOIN flights ON airplane_id = airplanes.id
GROUP BY airplanes.cod;
