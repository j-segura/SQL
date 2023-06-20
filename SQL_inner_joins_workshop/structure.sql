--link flowchart: https://drive.google.com/file/d/1tX-8hU3mcFUEbjLPbPWOR9ocCpSOzsd_/view?usp=sharing

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
)

CREATE TABLE orders(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    num INT NOT NULL,
    quantity INT NOT NULL,
    value INT NOT NULL,
    date DATETIME NOT NULL,
    customer_id INT FOREIGN KEY REFERENCES costumers(id) NOT NULL,
    representative_id INT FOREIGN KEY REFERENCES employees(id) NOT NULL,
    manufacturer_id INT FOREIGN KEY REFERENCES manufacturers(id) NOT NULL,
)

CREATE TABLE products_orders(
    product_id INT FOREIGN KEY REFERENCES products(id) NOT NULL,
    order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL,
)

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
