/* 

CREATE FUNCTION name(params)
RETURN type
AS
BEGIN
    body of the function goes here...
return
END

*/

USE scalar_functions

-- 1. Realizar una función que muestre el Nombre del Medico Ingresando el Código del mismo.

CREATE FUNCTION findDoctor(@cod INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @nom VARCHAR(50)
    SET @nom = (SELECT name FROM doctors WHERE cod = @cod)
    RETURN @nom
END

GO

SELECT dbo.findDoctor(2) AS nombre_doctor;


-- 2. Crear Un función que permita teniendo el número de la cita, visualizar el centro de donde es el Médico.

CREATE FUNCTION centerAppointment(@cod INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @center VARCHAR(50)
    SET @center = (
		SELECT
			centers.name
		FROM appointments
		JOIN doctors ON doctors.cod = doctor_cod
		JOIN centers ON centers.id = center_id
		WHERE appointments.cod  = @cod
	)
    RETURN @center
END

GO

SELECT dbo.centerAppointment(2) AS 'centro de la cita';

-- 3. Crear una función que permita consultar la fecha de una cita determinada.

CREATE FUNCTION dateAppointment(@cod INT)
RETURNS DATETIME
AS
BEGIN
    DECLARE @date DATETIME
    SET @date = (
		SELECT
			date
		FROM appointments
		WHERE appointments.cod  = @cod
	)
    RETURN @date
END

GO

SELECT dbo.dateAppointment(2) AS 'fecha cita';


-- 4. Responda Cuantos resultado devuelve una Función Escalar.

-- R/ las funciones escalares devuelven un solo valor

-- 5. Qué ocurre si al llamar la función no le ingresamos el parámetro de Entrada.

/* RESPUESTA:

En SQL Server, si intentas llamar a una función sin proporcionar el parámetro de entrada requerido, recibirás un error que indica que el número de argumentos es incorrecto o que falta un parámetro.

*/

-- 6. al momento de ejecutar una función y no le ingresamos parámetros cual es el código de error que genera SQL server.

/* RESPUESTA:

El mensaje de error específico puede ser algo como "Incorrect syntax near 'function_name'" o "Function 'function_name' requires parameters that were not supplied".

*/

-- 7. Qué diferencia hay entre returns y return en la sintaxis de la función escalar.


/* RESPUESTA:

RETURNS: Se utiliza en la declaración de la función para especificar el tipo de dato que la función devolverá como resultado. Indica el tipo de dato que se espera como salida de la función. Por ejemplo, si una función escalar devuelve un valor numérico, la declaración de la función puede incluir "RETURNS INT" para indicar que el resultado será un número entero. Aquí, "RETURNS" se utiliza para definir el tipo de dato de retorno de la función.

RETURN: Se utiliza dentro del cuerpo de la función para devolver el resultado o valor calculado. Es una palabra clave que se utiliza para salir de la función y retornar un valor específico. Puedes pensar en "RETURN" como la sentencia que indica qué valor debe ser devuelto por la función. Por ejemplo, dentro del cuerpo de la función, puedes tener una serie de cálculos y manipulaciones de datos, y cuando deseas devolver un valor específico como resultado, utilizas "RETURN" seguido del valor que deseas devolver. 

*/

-- 8. Crear una función que devuelva el promedio de citas.

CREATE FUNCTION avgAppointments()
RETURNS FLOAT
AS
BEGIN
    DECLARE @avg FLOAT
    SET @avg = (
		SELECT
			AVG(cod)
		FROM appointments
	)
    RETURN @avg
END

-- 9. crear una función que devuelva el número de médicos.

CREATE FUNCTION doctorsNum()
RETURNS INT
AS
BEGIN
    DECLARE @num INT
    SET @num = (
		SELECT
			COUNT(cod)
		FROM doctors
	)
    RETURN @num
END

GO

SELECT dbo.doctorsNum() AS 'numero de doctores';

--10. Crear una función que permita ingresar como parámetro el código de la enfermedad y devuelva el número de pacientes que padecen esta enfermedad.

CREATE FUNCTION patientsDisease(@cod INT)
RETURNS INT
AS
BEGIN
    DECLARE @numPatients INT
    SET @numPatients = (
		SELECT
			COUNT(patient_nHistory) 
		FROM conditions
		WHERE disease_cod = @cod
	)
    RETURN @numPatients
END

GO

SELECT dbo.patientsDisease(2) AS 'pacientes con enfermedad';

-- 11. Crear una función que permita ingresar como parámetro el código del médico y devuelva el número de Citas que tiene asignado el médico.

CREATE FUNCTION doctorsAppointments(@cod INT)
RETURNS INT
AS
BEGIN
    DECLARE @numAppointments INT
    SET @numAppointments = (
		SELECT
			COUNT(cod)
		FROM appointments
		WHERE doctor_cod = @cod
	)
    RETURN @numAppointments
END

GO

SELECT dbo.doctorsAppointments(1) AS 'citas del doctor';

-- 12. Crear una función que permita ingresar como parámetro el número del historial del paciente y devuelva el número de citas que ha generado el paciente.

CREATE FUNCTION patientsAppointments(@cod INT)
RETURNS INT
AS
BEGIN
    DECLARE @numAppointments INT
    SET @numAppointments = (
		SELECT
			COUNT(cod)
		FROM appointments
		WHERE patient_nHistory = @cod
	)
    RETURN @numAppointments
END

GO

SELECT dbo.patientsAppointments(9) AS 'citas del paciente';

-- 13. Crear una función que permita ingresar dos parámetros, el cual digite un rango de meses,mes 1 hasta el mes 7, la función debe devolver cuantos pacientes nacieron en estosmeses.

CREATE FUNCTION patientsMonth(@from INT, @to INT)
RETURNS INT
AS
BEGIN
    DECLARE @numPatients INT
    SET @numPatients = (
		SELECT
			COUNT(nHistory)
		FROM patients WHERE MONTH(dateOfBirth) BETWEEN @from AND @to
	)
    RETURN @numPatients
END

GO

SELECT dbo.patientsMonth(1, 7) AS 'numero de pacientes';    

-- 14. crear una función que permita ingresar como parámetro la edad y devuelva el número de médicos que son menores al parámetro de entrada.

CREATE FUNCTION doctorsUndersuchAge(@age INT)
RETURNS INT
AS
BEGIN
    DECLARE @numDoctors INT
    SET @numDoctors = (
		SELECT
			COUNT(cod)
		FROM doctors WHERE DATEDIFF(YEAR, dateOfBirth, GETDATE()) < @age
	)
    RETURN @numDoctors
END

GO

SELECT dbo.doctorsUndersuchAge(45) AS 'numero de doctores';

