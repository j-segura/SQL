CREATE DATABASE taller2

GO

USE taller2

GO

CREATE TABLE departamentos(
	id INT PRIMARY KEY NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	cod VARCHAR(10) NOT NULL,
)

GO

CREATE TABLE cuidades(
	id INT PRIMARY KEY NOT NULL,
	id_dpto INT FOREIGN KEY REFERENCES departamentos(id) not null,
	nombre VARCHAR(100) NOT NULL
)

GO

CREATE TABLE cargos(
	id INT PRIMARY KEY NOT NULL,
	nombre VARCHAR(100)NOT NULL,
	salario MONEY NOT NULL
)

GO

CREATE TABLE empleados(
	id INT PRIMARY KEY NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	fechaNacimiento DATETIME NOT NULL, --'10 marzo, 2013'
	cargo_id INT FOREIGN KEY REFERENCES cargos(id) NOT NULL,
	ciudad_id INT FOREIGN KEY REFERENCES cuidades(id) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	telefono INT NOT NULL,
)

GO

INSERT INTO departamentos(id, nombre, cod) VALUES(1, 'Antioquia', 'Ant'),
											(2, 'Valle', 'Val'),
											(3, 'Bolivar', 'Bol'),
											(4, 'Quindio', 'Qui'),
											(5, 'Norte Santander', 'Nsa'),
											(6, 'Santander', 'San')

GO

INSERT INTO cuidades(id, id_dpto, nombre) VALUES(2, 2, 'Cali'),
												(3, 1, 'Medellin'),
												(4, 1, 'Girardota'),
												(5, 5, 'Cucuta'),
												(6, 6, 'Bucaramanga'),
												(1, 2, 'Tulua')

GO

INSERT INTO cargos(id, nombre, salario) VALUES(1, 'Operario', 990),
											(2, 'Ayudante', 780),
											(3, 'Secretaria Gral', 1100),
											(4, 'Jefe Contabilidad', 3900),
											(5, 'Gerente General', 7200)

GO

INSERT INTO empleados(id, nombre, apellido, fechaNacimiento, cargo_id, ciudad_id, direccion, telefono) VALUES
	(702040, 'Juan', 'Molina', '1 enero, 1989', 2, 1, 'Calle 15 # 10-10', 3503030),
	(704040, 'Andres', 'Perez', '25 marzo, 1987', 4, 4, 'Circ 2 # 120-25', 2802030),
	(706020, 'Marina', 'Carrillo', '28 febrero, 1980', 1, 2, 'Kra Ssur nro 1D-45', 3416090),
	(708030, 'Rogelio', 'Cabrales', '15 mayo, 1978', 5, 1, 'Autop Sur Kmt 25', 3921111),
	(705030, 'Diana', 'Moncada', '15 enero, 1985', 4, 3, 'Drag 25 nro 14-20', 2501030),
	(703050, 'Carlos', 'Carrillo', '31 diciembre, 1988', 3, 3, 'Circunv 15 # 102-32', 3033030)

GO
-- Recuperacion de informacion ---------------------------------------------------------------------------

-- Mostrar los datos de cada una de las tablas

SELECT * FROM departamentos
SELECT * FROM cuidades
SELECT * FROM cargos
SELECT * FROM empleados

GO

-- Mostrar los empleados ordenados por el cargo

SELECT empleados.nombre as empleado, cargos.nombre as cargo FROM empleados 
INNER JOIN cargos ON cargos.id = empleados.cargo_id
ORDER BY cargo ASC

GO

-- Mostrar los empleados que tienen el cargo 50 o el cargo 11 (en mi caso: 5 y 3)

SELECT * FROM empleados WHERE cargo_id = 5 OR cargo_id = 3

GO

-- Mostrar empleados con apellido 'Carrillo y viven en Cali'

SELECT empleados.nombre, empleados.apellido, cuidades.nombre as ciudad FROM empleados
INNER JOIN cuidades ON cuidades.id = empleados.ciudad_id
WHERE cuidades.nombre = 'Cali';

GO

-- Mostrar los empleados que tienen cargo 20 (4) y viven en Medellin

SELECT empleados.nombre, empleados.cargo_id as cargo, cuidades.nombre as ciudad FROM empleados
INNER JOIN cuidades ON cuidades.id = empleados.ciudad_id
WHERE cuidades.nombre = 'Medellin' AND empleados.cargo_id = 4;

GO

-- Mostrar nombre, apellido, fecha de nacimiento, Nro doc de los empleados

SELECT nombre, apellido, fechaNacimiento, id as NroDoc FROM empleados;

GO

-- Mostrar empleados cuyo apellido empiezen con M

SELECT nombre as empleado, apellido FROM empleados WHERE nombre LIKE 'M%'

GO

-- Mostrar empleados que vivan en Medellin, Cali, Tulua

SELECT empleados.nombre as empleado, cuidades.nombre as ciudad FROM empleados 
INNER JOIN cuidades ON cuidades.id = empleados.ciudad_id
WHERE cuidades.nombre = 'Cali' OR cuidades.nombre = 'Medellin' OR cuidades.nombre = 'Tulua'

GO

-- Mostrar los empleados que tengan cargo de Gerente General o Jefe de Contabilidad

SELECT empleados.nombre as empleado, cargos.nombre as cargo FROM empleados
INNER JOIN cargos ON cargos.id = empleados.cargo_id
WHERE cargos.nombre = 'Gerente General' OR cargos.nombre = 'Jefe Contabilidad'

GO

-- Mostrar los cargos que tengan salario mayor a uss$2000

SELECT * FROM cargos WHERE salario > 2000

GO

-- Mostrar Los Departamentos que contengan la vocal: U o la letra: t

SELECT * FROM departamentos WHERE nombre LIKE '%u%' OR nombre LIKE '%t%'

GO

-- Mostrar Los Departamentos que contengan la vocal: a y la letra: c

SELECT * FROM departamentos WHERE nombre LIKE '%a%' OR nombre LIKE '%c%'

GO

-- Mostrar los cargos que tengan salario mayor a $2000 y menor $5000

SELECT * FROM cargos WHERE salario BETWEEN 2000 AND 5000

GO

-- Mostrar los empleados que hayan nacido entre el 1 enero, 1985 y Diciembre 31 de 1988

SELECT * FROM empleados WHERE fechaNacimiento BETWEEN '01-01-1985' AND '31-12-1988'

GO

-- Insertar los nuevos cargos de: Mensajero(60) con un salario $850, Jefe de sistemas(40) con salario de $3850

INSERT INTO cargos(id, nombre, salario) VALUES (60, 'Mensajero', 850),
											(40, 'Jefe de sistemas', 3850)
GO

-- Mostrar el primer empleado cuyos datos esten ordenados por la fecha de nacimiento de forma descendente

SELECT TOP 1 * FROM empleados ORDER BY fechaNacimiento DESC

GO

-- Mostrar los dos primeros departamentos ordenados por la descripcion

SELECT TOP 2 * FROM departamentos ORDER BY cod

GO

-- Inserta las nuevas Ciudades de Envigado (Antioquia), Turbaco(TUR) (Bolivar), Armenia(ARM)) (Quindio).

INSERT INTO cuidades(id, id_dpto, nombre) VALUES (7, 1, 'Evigado'),
												(8, 3, 'Turbaco'),
												(9, 4, 'Armenia')
GO

/* Inserta los nuevos Empleados: 

Juan Camilo Torres Marín, Nro.Doc: 98005005, para el cargo de Mensajero, en la Ciudad de Envigado,
Calle nro, 15sur-25, tel: 277 15 60, nacido en: Marzo 25 de 1978,
Maria Antonia Acevedo Gardeazabal, Nro.Doc: 32800900, cargo de Jefe de sistemas
en la ciudad de Turbaco, Av 2 nro 68norte 4, tel: 520 20 20, nacida en: Abril 15 de 1972 y
Juán Marielo, Nro Doc: 150300600, para el cargo de Auxiliar Contabie, en la ciudad de Tulúa, Transv 1 4 85-20, tel: 123 10 20,
nacido en Febrero 28 de 1988 */

INSERT INTO empleados(id, nombre, apellido, fechaNacimiento, cargo_id, ciudad_id, direccion, telefono) VALUES
	(98005005, 'Juan Camilo', 'Torres Marín', '25 marzo, 1978', 60, 7, 'Calle nro, 15sur-25', 2771560),
	(32800900, 'Maria Antonia', 'Acevedo Gardeazabal', '15 abril, 1972', 40, 8, 'Av 2 nro 68norte 4', 5202020),
	(150300600, 'Juán', 'Marielo', '28 febrero, 1988', 2, 1, 'Transv 1 4 85-20', 1231020)

GO

-- Actualizar los últimos registros cambiando la dirección, el teléfono y el cargo

SELECT * FROM empleados

UPDATE empleados SET direccion = 'Casa de Juan', telefono = 4034040, cargo_id = 5 WHERE id = 98005005
UPDATE empleados SET direccion = 'Casa de Maria', telefono = 4454040, cargo_id = 3 WHERE id = 32800900
UPDATE empleados SET direccion = 'Casa de Marielo', telefono = 4004040, cargo_id = 40 WHERE id = 150300600

GO

-- Actualizar la Descripción del cargo de Mensajero a Mensajero Categoría 1

UPDATE cargos SET nombre = 'Mensajero Categoría 1' WHERE nombre = 'Mensajero'

GO

-- Dada la cédula del empleado ANDRES PEREZ, cambiar el teléfono de su residencia por 3598978

UPDATE empleados SET telefono = 3598978 WHERE id = 704040

GO

-- Teniendo como ejemplo la tabla CARGOS, supongamos que queremos cambiar el salario de todos los empleados cuyos códigos estén entre 20 y 30 (en mi caso del 1 al 3), y ponerle un valor único de $2500.

UPDATE cargos SET salario = 2500 WHERE id BETWEEN 1 AND 3

GO

/* Asumamos que la tabla CIUDADES tiene registros. Y supongamos que queremos alterar la
tabla para agregar una nueva columna de código postal, que se llame: intCod_Postal_CIU,
que va a ser de tipo INTEGER que no acepte nulos, y que no tenga ningún valor por defecto.
Como lo haría? */

SELECT * FROM cuidades

ALTER TABLE cuidades ADD cod_postal int default 0 not null

-- Actualizar los códigos postales a las ciudades acorde al sistema de telefonía nacional vigente.

UPDATE cuidades SET cod_postal = 1234 WHERE cod = 1

-- Mostrar los Empleados sus trabajan en el departamento de Antioquia (Sin utilizar las uniones, ni el join).

-- Mostrar los empleados nacidos en los meses del primer semestre.

-- Mostrar los empleados que estén en el rango del cargo entre 5 y 20.

-- Mostrar los nombres de los empleados (no repetidos)

-- Mostrar las Ciudades tienen la letra: G

-- Borrar las Ciudades de: Cúcuta y Bucaramanga

-- Borrar todos los cargos que no estén registrados en la tabla de Empleados.