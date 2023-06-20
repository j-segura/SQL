-- QUERIES

/* 1. Mostrar el nombre y el total de ventas que debe de realizar el empleado. Además mostrar el código y la ciudad de la oficina. */

SELECT
    employees.name,
    employees.quota,
    offices.name as officeCode,
    cities.name as city
FROM employees
INNER JOIN offices ON offices.id = employees.office_id
INNER JOIN cities ON cities.id = offices.city_id;

-- 2. Listar en la tabla pedidos el número del pedido, el importe, la cantidad, de la tabla empleados el nombre, contrato y de la tabla oficina la ciudad y el objetivo.

SELECT
    orders.num,
    orders.value,
    orders.quantity,
    employees.name,
    employees.contract_start_date
FROM orders
INNER JOIN employees ON employees.id = orders.representative_id
INNER JOIN offices ON offices.id = employees.office_id;

-- 3. Listar los datos de cada uno de los empleados junto con la ciudad y región de la tabla oficina. 

SELECT
    employees.name as employee,
    cities.name as office_city,
    regions.name as office_region
FROM employees
INNER JOIN offices ON offices.id = employees.office_id
INNER JOIN cities ON cities.id = offices.city_id
INNER JOIN regions ON regions.id = offices.region_id;

-- 4. Listar todos los campos de la tabla oficinas con objetivo superior a 600.000 pts.,  junto con el campo nombre de la tabla empleados.

SELECT
    offices.name as office,
    offices.sales_target,
    employees.name as 'employee name'
FROM offices
INNER JOIN employees ON offices.id = employees.office_id
WHERE offices.sales_target > 600000;

-- 5. Listar todos los campos de la tabla pedidos, incluyendo el nombre del empleado que tomó el pedido y el nombre del cliente que lo solicitó.

SELECT
    orders.num,
    orders.quantity,
    orders.value,
    orders.date,
    employees.name as employee,
    costumers.name as customer
FROM orders
INNER JOIN employees ON employees.id = orders.representative_id
INNER JOIN costumers ON costumers.id = orders.customer_id;

-- 6. listar el código del pedido y el nombre de la fábrica.

SELECT
    orders.id as cod_order,
    manufacturers.name as factory
FROM orders
INNER JOIN manufacturers ON manufacturers.id = orders.manufacturer_id;

-- 7.	 listar el nombre del cliente y el nombre del empleado que fue asignado.

SELECT
    costumers.name as costumer,
    employees.name as employee
FROM costumers
INNER JOIN employees ON employees.id = costumers.representative_id;

-- 8. Listar el nombre de la fábrica y el nombre del empleado.


SELECT
    manufacturers.name as factory,
    employees.name as employee
FROM orders
INNER JOIN manufacturers ON manufacturers.id = orders.manufacturer_id
INNER JOIN employees ON employees.id = orders.representative_id;

-- 9. Listar la descripción del producto y el nombre de la fábrica que los produce

SELECT
    products.description as 'product description',
    manufacturers.name as 'made in'
FROM products
INNER JOIN manufacturers ON manufacturers.id = products.manufacturer_id;

-- 10. Listar el nombre del cliente y el objetivo que debe de cumplir por estar en esa oficina.

SELECT
    costumers.name as costumer,
    offices.sales_target as 'Objetive for be in that office'
FROM costumers
INNER JOIN employees ON employees.id = costumers.representative_id
INNER JOIN offices ON offices.id = employees.office_id;

-- 11. Listar el nombre del cliente, el límite de crédito y el nombre del representante

SELECT
    costumers.name as costumer,
    costumers.credit_limit,
    employees.name as 'representative name'
FROM costumers
INNER JOIN employees ON employees.id = costumers.representative_id;

-- 12. Listar el nombre del cliente, el nombre de la fábrica en donde realizo el pedido

SELECT
    costumers.name as costumer,
    orders.num as 'order',
    manufacturers.name as factory
FROM orders
INNER JOIN manufacturers ON manufacturers.id = orders.manufacturer_id
INNER JOIN costumers ON costumers.id = orders.customer_id;

-- 13. Listar la descripción del producto, la cantidad de la tabla pedidos y el nombre de la empresa donde se realiza el producto.

SELECT
    products.description as 'product description',
    manufacturers.name as 'made in'
    order
FROM products
INNER JOIN manufacturers ON manufacturers.id = products.manufacturer_id
INNER JOIN products_orders ON products_orders.product_id = products.id
INNER JOIN orders ON orders.id = products_orders.order_id;