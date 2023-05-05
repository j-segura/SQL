CREATE DATABASE empresaxy;

GO

USE empresaxy

GO

CREATE TABLE products(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name VARCHAR(100) NOT NULL,
	value MONEY NOT NULL
)

GO

CREATE TABLE costumers(
	id VARCHAR PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	lastName VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    revenues MONEY NOT NULL,
)

GO

CREATE TABLE invoices(
    id PRIMARY KEY IDENTITY(1,1) NOT NULL,
    product_id INT FOREIGN KEY REFERENCES products(id) NOT NULL,
    costumer_id INT FOREIGN KEY REFERENCES costumers(id) NOT NULL,
    quantity INT NOT NULL,
)

GO

INSERT INTO products(name, value) VALUES('Banana', 3000),
   ('Mandarina', 5000),
   ('Manzana', 134000),
   ('Pera', 11040),
   ('Naranja', 35000),
   ('Piña', 31000),
   ('Durazno', 11000),
   ('Uva', 13000),
   ('Cereza', 6000),
   ('Melón', 8000);