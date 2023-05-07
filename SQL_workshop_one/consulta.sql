
/* Para asignar criterios o condiciones en una consulta SQL Server,
se utiliza la cláusula WHERE. Esta cláusula permite filtrar los datos de
una tabla en función de una o varias condiciones.

La sintaxis básica de la cláusula WHERE es la siguiente: */

SELECT columnas
FROM tabla
WHERE condicion;

/* Donde "columnas" son las columnas que deseas seleccionar en la consulta,
"tabla" es la tabla en la que deseas buscar datos y "condicion" es la condición
que se debe cumplir para que se muestren los datos seleccionados.

Por ejemplo, si queremos seleccionar todos los registros de una
tabla llamada "clientes" donde el campo "edad" sea mayor o igual a 18 años,
la consulta SQL se vería así: */

SELECT *
FROM clientes
WHERE edad >= 18;


Para asignar criterios o condiciones en una consulta SQL Server, se utiliza la cláusula WHERE. Esta cláusula permite filtrar los datos de una tabla en función de una o varias condiciones.

La sintaxis básica de la cláusula WHERE es la siguiente:

sql
Copy code
SELECT columnas
FROM tabla
WHERE condicion;
Donde "columnas" son las columnas que deseas seleccionar en la consulta, "tabla" es la tabla en la que deseas buscar datos y "condicion" es la condición que se debe cumplir para que se muestren los datos seleccionados.

Por ejemplo, si queremos seleccionar todos los registros de una tabla llamada "clientes" donde el campo "edad" sea mayor o igual a 18 años, la consulta SQL se vería así:

sql
Copy code
SELECT *
FROM clientes
WHERE edad >= 18;

/* En este ejemplo, el asterisco (*) indica que queremos seleccionar
todas las columnas de la tabla "clientes".
La condición especificada en la cláusula WHERE es "edad >= 18",
lo que significa que solo se seleccionarán los registros donde el valor
del campo "edad" sea mayor o igual a 18.

Es posible utilizar múltiples condiciones en la cláusula WHERE
utilizando operadores lógicos como AND, OR y NOT. Por ejemplo,
si queremos seleccionar todos los registros de la tabla "clientes"
donde la edad sea mayor o igual a 18 y la ciudad sea "Madrid", la consulta SQL se vería así: */

SELECT *
FROM clientes
WHERE edad >= 18 AND ciudad = 'Madrid';

/* En este ejemplo, la condición especificada es "edad >= 18 AND ciudad = 'Madrid'",
lo que significa que solo se seleccionarán los registros donde el valor del campo "edad"
sea mayor o igual a 18 y el valor del campo "ciudad" sea "Madrid". */