-- 1 Listar las oficinas del este indicando para cada una de ellas su número, ciudad, números y nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados, y hacer otra en las que aparezcan las oficinas del este que no tienen empleados.

SELECT
    offices.id as 'number',
    offices.name as office,
    regions.name as region,
    cities.name as city,
    employees.name as employe,
    employees.id as employe_number
FROM offices
JOIN regions ON regions.id = offices.region_id
JOIN cities ON cities.id = offices.city_id
JOIN employees ON offices.id = employees.office_id
WHERE regions.name = 'East'

-- versión en la que aparecen sólo las que tienen empleados

SELECT
    offices.id as 'number',
    offices.name as office,
    regions.name as region,
    cities.name as city,
    COUNT(employees.id) as employees_count
FROM offices
JOIN regions ON regions.id = offices.region_id
JOIN cities ON cities.id = offices.city_id
LEFT JOIN employees ON offices.id = employees.office_id
GROUP BY offices.id, offices.name, regions.name, cities.name
HAVING COUNT(employees.id) > 0;

-- versión en la que aparecen sólo las que no tienen empleados

SELECT
    offices.id as 'number',
    offices.name as office,
    regions.name as region,
    cities.name as city,
    COUNT(employees.id) as employees_count
FROM offices
JOIN regions ON regions.id = offices.region_id
JOIN cities ON cities.id = offices.city_id
LEFT JOIN employees ON offices.id = employees.office_id
GROUP BY offices.id, offices.name, regions.name, cities.name
HAVING COUNT(employees.id) = 0;


-- 2 Listar los pedidos mostrando su número, importe, nombre del cliente, y el límite de crédito del cliente correspondiente (todos los pedidos tienen cliente y representante).

SELECT
    orders.num as 'number',
    orders.value as importe,
    costumers.name as client,
    costumers.credit_limit
FROM orders
JOIN costumers ON costumers.id = orders.customer_id

-- 3 Listar los datos de cada uno de los empleados, la ciudad y región en donde trabaja.

SELECT
    employees.name,
    cities.name as city,
    regions.name as region
FROM employees
JOIN offices ON offices.id = employees.office_id
JOIN cities ON cities.id = offices.city_id
JOIN regions ON regions.id = offices.region_id

-- 4 Listar las oficinas con objetivo superior a 600.000 pts indicando para cada una de ellas el nombre de su director.

ALTER TABLE offices
ADD director_id INT FOREIGN KEY REFERENCES employees(id);

SELECT
    offices.name,
    offices.sales_target,
    employees.name as director
FROM offices
JOIN employees ON employees.id = offices.director_id
WHERE offices.sales_target > 600000;

-- 5 Listar los pedidos superiores a 250 pts, incluyendo el nombre del empleado que tomó el pedido y el nombre del cliente que lo solicitó.

SELECT
    orders.num as order_number,
    orders.value as order_value,
    costumers.name as client,
    employees.name as employee
FROM orders
JOIN costumers ON costumers.id = orders.customer_id
JOIN employees ON employees.id = orders.representative_id
WHERE orders.value > 250;


-- 6 Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados.

SELECT e.name AS employee_name, e.contract_start_date, o.date AS order_date
FROM employees e
INNER JOIN orders o ON e.id = o.representative_id
WHERE CONVERT(DATE, e.contract_start_date) = CONVERT(DATE, o.date);

-- 7 Listar los empleados con una cuota superior a la de su jefe; para cada empleado sacar sus datos y el número, nombre y cuota de su jefe.

ALTER TABLE employees
ADD boss_id INT FOREIGN KEY REFERENCES employees(id);

SELECT
    employee.id AS employee_id,
    employee.name AS employee_name,
    employee.quota AS employee_quota,
    boss.id AS boss_id,
    boss.name AS boss_name,
    boss.quota AS boss_quota
FROM
    employees employee
INNER JOIN employees boss ON employee.boss_id = boss.id
WHERE employee.quota > boss.quota;

-- 8 Listar los códigos de los empleados que tienen una línea de pedido superior a 10.000 ptas o que tengan una cuota inferior a 10.000 pts.

SELECT e.id AS employee_code
FROM employees e
INNER JOIN orders o ON e.id = o.representative_id
WHERE o.value > 10000 OR e.quota < 10000;