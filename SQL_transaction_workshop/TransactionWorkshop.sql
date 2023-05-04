CREATE DATABASE transactionWorkshop

GO

USE transactionWorkshop

GO

CREATE TABLE branches (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL
)

GO

CREATE TABLE costumers (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
)

GO

CREATE TABLE accounts (
	id INT PRIMARY KEY NOT NULL,
	num_account nvarchar(10) NOT NULL,
	saldo MONEY NOT NULL,
	branch_id INT FOREIGN KEY REFERENCES branches(id) NOT NULL
)

GO

CREATE TABLE account_costumer (
	account_id INT FOREIGN KEY REFERENCES accounts(id),
	costumer_id INT FOREIGN KEY REFERENCES costumers(id),
	PRIMARY KEY(account_id, costumer_id)
)

GO

SELECT * FROM branches;
SELECT * FROM costumers;
SELECT * FROM accounts;
SELECT * FROM account_costumer;

GO

INSERT INTO branches(id, name) VALUES(1, 'centro'),
	(2, 'Moralzarzal'),
	(3, 'Navacerrada')

GO

INSERT INTO costumers(id, name) VALUES(1, 'Santos'),
	(2, 'Gómez'),
	(3, 'López'),
	(4, 'Pérez'),
	(5, 'Rupérez')

GO

INSERT INTO accounts(id, num_account, branch_id, saldo) VALUES(1, 'C-101', 1, 100000),
	(2, 'C-215', 1, 140000),
	(3, 'C-102', 1, 80000),
	(4, 'C-305', 2, 70000),
	(5, 'C-201', 2, 180000),
	(6, 'C-222', 2, 140000),
	(7, 'C-217', 3, 150000)

GO

INSERT INTO account_costumer(account_id, costumer_id) VALUES(1, 5),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 1),
	(6, 5),
	(7, 1)

GO

----------------------------------------------------------------------------------------------

BEGIN transaction xx --------------->es como un punto de restauracion se guarda en memoria

COMMIT transaction xx ----> subir cambias de transaccion y borar de memoria 

ROLLBACK transaction xx ----------> devolver una transaction

GO

-----------------------------------------------------------------------------------------------

BEGIN TRANSACTION updating_sales

UPDATE accounts SET saldo = saldo + 100000 WHERE saldo BETWEEN 100000 AND 140000

GO

------------------------------------------------------------------------------------------------

BEGIN TRANSACTION updating_some_sales

UPDATE accounts SET saldo = saldo + saldo * 0.1 WHERE num_account = 'C-101' OR num_account = 'C-125'

ROLLBACK TRANSACTION updating_some_sales

------------------------------------------------------------------------------------------------

BEGIN TRANSACTION delete_santos

DELETE FROM costumers WHERE name = 'Santos'

SELECT * FROM costumers