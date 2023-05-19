CREATE DATABASE transactionWorkshop;

USE transactionWorkshop;

----------------------------------------------------------------------------------------------

GO

CREATE TABLE branches (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE costumers (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
);

CREATE TABLE accounts (
	id INT PRIMARY KEY NOT NULL,
	num_account nvarchar(10) NOT NULL,
	saldo MONEY NOT NULL,
	branch_id INT FOREIGN KEY REFERENCES branches(id) NOT NULL
);

CREATE TABLE account_costumer (
	account_id INT FOREIGN KEY REFERENCES accounts(id),
	costumer_id INT FOREIGN KEY REFERENCES costumers(id),
	PRIMARY KEY(account_id, costumer_id)
);

----------------------------------------------------------------------------------------------

GO

SELECT * FROM branches;
SELECT * FROM costumers;
SELECT * FROM accounts;
SELECT * FROM account_costumer;

----------------------------------------------------------------------------------------------

GO

INSERT INTO branches(id, name) VALUES(1, 'centro'),
	(2, 'Moralzarzal'),
	(3, 'Navacerrada');

INSERT INTO costumers(id, name) VALUES(1, 'Santos'),
	(2, 'Gómez'),
	(3, 'López'),
	(4, 'Pérez'),
	(5, 'Rupérez');


INSERT INTO accounts(id, num_account, branch_id, saldo) VALUES(1, 'C-101', 1, 100000),
	(2, 'C-215', 1, 140000),
	(3, 'C-102', 1, 80000),
	(4, 'C-305', 2, 70000),
	(5, 'C-201', 2, 180000),
	(6, 'C-222', 2, 140000),
	(7, 'C-217', 3, 150000);


INSERT INTO account_costumer(account_id, costumer_id) VALUES(1, 5),
	(2, 2),
	(3, 3), 
	(4, 4),
	(5, 1),
	(6, 5),
	(7, 1);

----------------------------------------------------------------------------------------------

-- 2. how a transaction begin? --

BEGIN transaction xx; ---------------> is a restorationpoint that save in memory

-- 3. what is the command to run a transaction definitly?

COMMIT transaction xx; ----> push transaction´s changes and delete from memory 

-- 4. what is the command to rollback a transaction?

ROLLBACK transaction xx; ----------> rollback a transaction

-----------------------------------------------------------------------------------------------

-- 5. Inside a transaction update the accounts information with balances between 100.000 and 140000 increasing one hundre thousand pesos more.

GO

BEGIN TRANSACTION updating_sales

UPDATE accounts SET saldo = saldo + 100000 WHERE saldo BETWEEN 100000 AND 140000

SELECT * FROM accounts;

COMMIT TRANSACTION updating_sales; 

------------------------------------------------------------------------------------------------

-- 6. create a transaction that update the account balnces 'C-101' and 'C-125' in a 10%

GO

BEGIN TRANSACTION updating_some_sales

UPDATE accounts SET saldo = saldo + saldo * 0.1 WHERE num_account = 'C-101' OR num_account = 'C-125'

SELECT * FROM accounts;

COMMIT TRANSACTION updating_some_sales;

------------------------------------------------------------------------------------------------

-- 7. create a trasaction that delete the costumer 'Santos'.

GO

BEGIN TRANSACTION delete_santos

DELETE FROM costumers WHERE name = 'Santos'

-- COMMENT: this query throws error because the costumer table has a foreign KEY.

-- 8. create a transaction that update the costumer 'Gómez' to 'Santos'.

GO

BEGIN TRANSACTION update_gomez

UPDATE costumers SET name = 'Gómez' WHERE name = 'Santos'

SELECT * FROM costumers;

ROLLBACK TRANSACTION update_gomez;

-- 9. consult what is a escalar fuction in sql server and what are its advantages.


/* 

In SQL Server, an "scalar function" refers to a user-defined function that returns a single value for each input value passed to it. It operates on a row-by-row basis, accepting one or more input parameters and producing a single output value.

Scalar functions can be created using the CREATE FUNCTION statement in SQL Server. They are typically used within queries or other SQL statements to perform calculations or transformations on data. The function is invoked by specifying its name and providing the necessary input parameters.

Advantages of scalar functions in SQL Server include:

Code Reusability: Scalar functions allow you to encapsulate common calculations or transformations into a single function that can be used across multiple queries. This promotes code reusability, reduces code duplication, and simplifies maintenance.

Modular Design: By defining scalar functions, you can break down complex logic into smaller, more manageable units. This improves code organization and makes it easier to understand and maintain.

Improved Readability: Scalar functions can enhance the readability of queries by abstracting complex calculations into named functions. This can make the SQL code more self-explanatory and easier to understand for other developers or database administrators.

Performance Optimization: Scalar functions can also help optimize performance in certain scenarios. SQL Server is designed to optimize queries that use scalar functions, and it can inline or optimize the execution of scalar functions in some cases. However, it's important to note that poorly designed or inefficient scalar functions can negatively impact performance.

Flexibility: Scalar functions can be used in various SQL Server components, including SELECT statements, WHERE clauses, computed columns, and more. They provide flexibility in performing calculations, string manipulations, date conversions, and other operations within SQL queries. */


-- 10. create a transaction that gets all costumers information

GO

BEGIN TRANSACTION costumer_information

SELECT * FROM costumers

COMMIT transaction costumer_information;

-- 11. inside a transaction update the costumer 'Santos' to the name 'Rojas'

BEGIN TRANSACTION update_santos

UPDATE costumers SET name = 'Rojas' WHERE name = 'Santos'

COMMIT transaction update_santos;

-- 12. update account C-201 in a 10% more

BEGIN TRANSACTION updating_c201

UPDATE accounts SET saldo = saldo + saldo * 0.1 WHERE num_account = 'C-201'

SELECT * FROM accounts;

-- 13. finsih a transaction

COMMIT TRANSACTION updating_c201;

-- 14 inster two new regirter into accounts table

BEGIN TRANSACTION insert_data

INSERT INTO accounts(id, num_account, branch_id, saldo) VALUES(8, 'C-400', 1, 1500000),
	(9, 'C-401', 1, 660000)

COMMIT TRANSACTION insert_data;

-- 15. get branches' information

SELECT * FROM branches;
