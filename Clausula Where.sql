




/*CLAUSULA WHERE*/
-- Nos permite filtrar nuestros datos de consulta

 
 SELECT  clientes.Cli_Id
 FROM clientes
 WHERE clientes.Cli_Id > 10


SELECT productos.Prod_Descripcion
FROM productos
WHERE productos.Prod_Precio >100

SELECT * FROM productos


/*OPERADOR AND*/



SELECT productos.Prod_Descripcion
FROM productos
WHERE productos.Prod_Precio >0 AND productos.Prod_status = 1


SELECT *
FROM productos
WHERE 
productos.Prod_Precio >0 
AND (productos.Prod_status = 0 OR(productos.Prod_status = 1 AND Productos.Prod_ProvId = 97))



SELECT Ventas_Fecha, Ventas_CliId, Ventas_total
FROM ventas
WHERE ventas_fecha > '2018-01-03' 
AND ventas_fecha < '2018-03-10'
AND ventas_cliid <> 1
AND ventas_total < 1000




