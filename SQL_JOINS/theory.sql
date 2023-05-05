-- INNER JOIN

SELECT <select_list> FROM tableA (Alias) INNER JOIN tableB (Alias) ON A.key = B.key

-- ejm

SELECT DISTINCT e.descr FROM empleados e INNER JOIN factura f ON e.id = f.empleado_id

