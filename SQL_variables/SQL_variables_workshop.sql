/* 1 	restar 2 números */

declare @num1 int = 20, @num2 int = 2, @result int

set @result = @num1 - @num2

print @result

/* 2	si el resultado de los 2, es mayos a 25: multiplicar los 2 números, de lo contrario dividir */

IF @result > 25
    BEGIN
        set @result = @num1 * @num2
    END
ELSE
    BEGIN
        set @result = @num1 / @num2
    END

print @result

/* 3	CREAR UN EJERCICIO QUE PERMITA CALCULAR EL	PROMEDIO DE 3 NÚMEROS */

declare @num1 int = 10, @num2 int = 15, @num3 int = 30, @promedio float

set @promedio = (@num1+@num2+@num3)/3

print @promedio


/* 4	CALCULAR EL 10% DE LAS VENTAS SI ES MAYOR DE 1.000.000 DE LO CONTRARIO EL 2% */

declare @valorVentas float = 1200000, @descuento float

IF @valorVentas > 1000000
    BEGIN
        set @descuento = @valorVentas * 0.10
    END
ELSE
    BEGIN
        set @descuento = @valorVentas * 0.02
    END

print 'El descuento es de: ' + convert(nvarchar(50), @descuento) + ' pesos'

/* 5	CALCULAR EL AREA DE UN CUADRADO CUYOS LADO ES 20CM */

declare @lado float = 20, @area float

set @area = @lado*@lado

print @area
	
/* 6	CALCULAR EL AUXILIO DE TRANSPORTE PARA UN EMPLEADO QUE LE PAGAN MENSUALMENTE 
CUYO SALARIO BASICO SON 1.000.000  */

declare  @salario float = 1400000, @axilioTransporte float = 140000, @porcentajeAT float

set @porcentajeAT = (@axilioTransporte * 100)/@salario

print 'El auxilio de transporte equivale al ' + convert(nvarchar(50), @porcentajeAT) + '% de tu salario'

/* 7	Imprimir los numeros del 1 al 10 */

declare @i int = 1

WHILE @i < 11
BEGIN
    print @i
    set @i=@i+1
END

/* 8	imprmir los numeros de la tabla del 2 hasta el 40 */

declare @i int = 2

WHILE @i < 41
BEGIN
    print convert(nvarchar(50),SELECT FROM empleados WHERE cod=@i)
    set @i=@i+1
END

/* 9	calcular el area de un triangulo cuya altura son 45cm y cuya base son 30 cm */

declare @base int = 30, @altura int = 45, @area float

set @area = (@base * @altura)/2

print @area


/* 10	calcular el promedio de 4 notas de un alumno */

declare @nota1 float = 3, @nota2 float = 4, @nota3 float = 4, @nota4 float = 5, @promedioN float

set @promedioN = (@nota1+@nota2+@nota3+@nota4)/4

print @promedioN


/* 11	calcular el promedio general de notas teniendo encuenta que el grupo tiene 2 alumnos
y cada alumno tiene 2 notas */

declare @nota1Alumno1 float = 3, @nota2Alumno1 float = 4, @nota1Alumno2 float = 4, @nota2Alumno2 float = 5, @promedioG float

set @promedioG = (@nota1Alumno1+@nota2Alumno1+@nota1Alumno2+@nota2Alumno2)/4

print @promedioG


/* 12	realizar un algoritmo que me indique el índice 	de masa corporal  (IMC) e imprimir el resultado 
con  respecto a los datos siguientes:

bajo peso---- 18,5 
normal------- 18,5 a 24,9 
pre obesidad- 25 a 29,9--- de 1 a 10 kilos de mas 
obesidad 1--- 30 a 34,9--- 10 a 20kilos de mas 
obesidad 2--- 35 a 39,9--- de 20 a 30kilos de mas 
obesidad 3--- +40 --------- desde 30 kilos de mas

Nota: utilizar la tabla empleados para realizar el algoritmo 12 */

--Solucion

-- Creamos tabla

use empleados

create table empleados(cod int primary key, nombre nvarchar(100), peso float, año_nacimiento int, altura float)

insert into empleados(cod, nombre, peso, año_nacimiento, altura) values(101, 'Carlos', 80, 1983, 1.90),(102, 'Maria', 60, 1983, 1.70)

select * from empleados

declare @IMC float, @nombre nvarchar(100), @resultado varchar(100), @peso float, @altura float

set @nombre = (select nombre from empleados where cod=101)
set @peso = (select peso from empleados where cod=101)
set @altura = (select altura from empleados where cod=101)

set @IMC = @peso / (@altura*@altura)

IF @IMC < 18.5
    BEGIN
        set @resultado = 'bajo peso'
    END
ELSE IF @IMC >= 18.5  AND @IMC < 25
    BEGIN
        set @resultado = 'normal'
    END
ELSE IF @IMC >= 25  AND @IMC < 30
    BEGIN
        set @resultado = 'pre obesidad'
    END
ELSE IF @IMC >= 30  AND @IMC < 35
    BEGIN
        set @resultado = 'obesidad 1'
    END
ELSE IF @IMC >= 35  AND @IMC < 40
    BEGIN
        set @resultado = 'obesidad 2'
    END
ELSE IF @IMC >= 40
    BEGIN
        set @resultado = 'obesidad 3'
    END
ELSE
    BEGIN
        set @resultado = 'no se encuentra en el rango'
    END

print 'El susodicho ' + convert(nvarchar(50), @nombre) + ' tiene un IMC de ' + convert(nvarchar(50), @IMC) + ' tiene un resultado: ' + convert(nvarchar(50), @resultado)


