
-- Ejercicios SELECT uniendo 2 o más tablas


-- Ejercicio #1
/*
Traer fecha de factura, número de factura, id de cliente, razón social del cliente
y el monto vendido de la factura 
*/
-- SOLUCIÓN
SELECT
v.Ventas_Fecha AS 'Fecha_venta',
V.Ventas_NroFactura AS 'Número_Factura',
V.Ventas_CliId AS 'ID_cliente',
C.Cli_RazonSocial AS 'Nombre_Cliente',
V.Ventas_Total AS 'Total_Vendido'
FROM Ventas V
JOIN Clientes C ON (V.ventas_CliId = C.Cli_Id)


SELECT * FROM ventas
SELECT * FROM 
SELECT * FROM clientes

