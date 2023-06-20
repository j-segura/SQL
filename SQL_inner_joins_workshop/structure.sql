--link Diagrama entidad realacion: https://drive.google.com/file/d/1tX-8hU3mcFUEbjLPbPWOR9ocCpSOzsd_/view?usp=sharing

CREATE DATABASE cilantro_salvaje_company;

USE cilantro_salvaje_company;

CREATE TABLE regions(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50),
);

CREATE TABLE cities(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50),
);

CREATE TABLE positions(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50),
);

CREATE TABLE manufacturers(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50),
);

CREATE TABLE offices(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    sales_target BIGINT NOT NULL,
    sales BIGINT NOT NULL,
    city_id INT FOREIGN KEY REFERENCES cities(id) NOT NULL,
    region_id INT FOREIGN KEY REFERENCES regions(id) NOT NULL,
    --director
);

CREATE TABLE employees(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    contract_start_date DATETIME NOT NULL,
    quota INT NOT NULL,
    sales INT NOT NULL,
    office_id INT FOREIGN KEY REFERENCES offices(id) NOT NULL,
    position_id INT FOREIGN KEY REFERENCES positions(id) NOT NULL,
    --boss_id INT FOREIGN KEY REFERENCES employees(id) TODO: add later with alter
);

CREATE TABLE costumers(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    credit_limit INT NOT NULL,
    representative_id INT FOREIGN KEY REFERENCES employees(id) NOT NULL,
);

CREATE TABLE products(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    stocks INT NOT NULL,
    num INT NOT NULL,
    manufacturer_id INT FOREIGN KEY REFERENCES manufacturers(id) NOT NULL,
    UNIQUE(manufacturer_id, num)
);

CREATE TABLE orders(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    num INT NOT NULL,
    quantity INT NOT NULL,
    value INT NOT NULL,
    date DATETIME NOT NULL,
    customer_id INT FOREIGN KEY REFERENCES costumers(id) NOT NULL,
    representative_id INT FOREIGN KEY REFERENCES employees(id) NOT NULL,
    manufacturer_id INT FOREIGN KEY REFERENCES manufacturers(id) NOT NULL,
);

CREATE TABLE products_orders(
    product_id INT FOREIGN KEY REFERENCES products(id) NOT NULL,
    order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL,
);

SELECT * FROM regions;
SELECT * FROM cities;
SELECT * FROM positions;
SELECT * FROM manufacturers;
SELECT * FROM offices;
SELECT * FROM employees;
SELECT * FROM costumers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM products_orders;

-- Llenar la tabla regions
INSERT INTO regions (name)
VALUES ('North'), ('South'), ('East'), ('West');

-- Llenar la tabla cities
INSERT INTO cities (name)
VALUES ('New York'), ('Los Angeles'), ('Chicago'), ('Houston');

-- Llenar la tabla positions
INSERT INTO positions (name)
VALUES ('Manager'), ('Salesperson'), ('Assistant');

-- Llenar la tabla manufacturers
INSERT INTO manufacturers (name)
VALUES ('Manufacturer A'), ('Manufacturer B'), ('Manufacturer C');

-- Llenar la tabla offices
INSERT INTO offices (name, sales_target, sales, city_id, region_id)
VALUES ('Office 1', 1000000, 800000, 1, 1),
       ('Office 2', 1500000, 1200000, 2, 2),
       ('Office 3', 800000, 650000, 3, 1),
       ('Office 4', 1200000, 950000, 4, 3);

-- Llenar la tabla employees
INSERT INTO employees (name, age, contract_start_date, quota, sales, office_id, position_id)
VALUES ('John Doe', 30, '01/01/2022', 100, 150, 1, 1),
       ('Jane Smith', 25, '15/03/2022', 80, 100, 1, 2),
       ('Michael Johnson', 35, '12/01/2021', 120, 180, 2, 1),
       ('Emily Davis', 28, '02/10/2022', 90, 120, 2, 2),
       ('David Wilson', 32, '20/04/2022', 70, 90, 3, 2),
       ('Sarah Brown', 27, '15/01/2022', 85, 110, 3, 3),
       ('Robert Taylor', 29, '03/01/2022', 110, 160, 4, 1),
       ('Olivia Martinez', 31, '02/05/2022', 95, 130, 4, 2);

-- Llenar la tabla customers
INSERT INTO costumers (name, credit_limit, representative_id)
VALUES ('Customer 1', 5000, 5),
       ('Customer 2', 8000, 6),
       ('Customer 3', 10000, 7),
       ('Customer 4', 6000, 8);

-- Llenar la tabla products
INSERT INTO products (description, price, stocks, num, manufacturer_id)
VALUES ('Product A', 50, 100, 1, 1),
       ('Product B', 30, 200, 2, 2),
       ('Product C', 70, 150, 3, 1),
       ('Product D', 40, 120, 4, 3);

-- Llenar la tabla orders
INSERT INTO orders (num, quantity, value, date, customer_id, representative_id, manufacturer_id)
VALUES (1, 5, 250, '01/05/2022', 2, 5, 1),
       (2, 3, 90, '02/10/2022', 2, 6, 2),
       (3, 8, 560, '20/02/2022', 3, 7, 1),
       (4, 2, 80, '15/03/2022', 4, 9, 3);

-- Llenar la tabla products_orders
INSERT INTO products_orders (product_id, order_id)
VALUES (1, 5),
       (2, 5),
       (3, 6),
       (4, 7),
       (1, 7),
       (2, 8);
