--SECCIÓN DE EJERCICIOS



-- EJERCICIO #1

/*TRAER LAS FECHAS, LOS NÚMEROS DE FACTURA Y EL MONTO TOTAL DE MIS VENTAS*/


--SOLUCIÓN

SELECT * FROM VENTAS

SELECT
VENT.VENTAS_FECHA AS FECHAVENTAS,
VENT.VENTAS_NROFACTURA AS NUMFACTURA,
VENT.VENTAS_TOTAL AS TOTALVENTAS
FROM VENTAS VENT



--EJERCICIO #2


/*
TRAER LOS ID DE PRODUCTOS, CANTIDAD Y PRECIO DE DETALLE VENTAS DE LOS REGISTROS DONDE EL PRECIO SEA MAYOR A 0
*/

SELECT * FROM ventas_detalle
WHERE ventas_Detalle.vd_precio = 0

--solución
SELECT
VD_ProdId AS ID_PRODUCTO,
VD_Cantidad AS CANTIDAD,
VD_Precio AS PRECIO
FROM ventas_detalle
WHERE VD_PRECIO > 0



GROUP BY VD_ProdID
ORDER BY VD_ProdID ASC
8
UPDATE  ventas_detalle 
SET VD_Precio = 0
WHERE VD_ProdId BETWEEN '100' AND '120'
WHERE 







--Ejercicio #3

/*TRAER EL TOTAL VENDIDO POR FECHA FACTURA*/



SELECT * FROM VENTAS 

GROUP BY VENTAS_ID

-- SOLUCIÓN

SELECT
ventas.Ventas_Fecha AS VENTFECHA,
SUM(ventas.Ventas_Total) AS Monto_Total_Venta
FROM Ventas 
GROUP BY ventas.Ventas_Fecha



--Ejercicio #4

/*TRAER EL TOTAL VENDIDO POR AÑO Y MES DE FACTURA */

SELECT * FROM VENTAS
SELECT * FROM VENTAS_DETALLE

--SOLUCIÓN

SELECT

SUM(VENT.Ventas_Total) AS Total_Vendido,
VENT.Ventas_NroFactura  AS No_Factura,
YEAR(VENT.Ventas_Fecha)  AS AÑO,
MONTH (VENT.Ventas_Fecha) AS MES,
VENT.Ventas_Fecha AS Fecha_Full

FROM VENTAS VENT

GROUP BY YEAR(VENT.Ventas_Fecha), MONTH(VENT.Ventas_Fecha)


/*Hacemos un Group by dado que estás usando una función como SUM y necesitamos que el resultado que arroje
sea coherente y preciso*/





-- Ejercicio #5

/*TRAER LOS PRODUCTOS DE LA TABLA PRODUCTOS QUE SEAN DEL PROVEEDOR CON EL ID 62*/


SELECT * FROM PRODUCTOS

-- Solución

SELECT 
PRO.Prod_Descripcion AS Producto
FROM Productos PRO
WHERE PRO.Prod_ProvId = 62




-- Ejercicio #6

/*TRAER LA LISTA DE PRODUCTOS vendidos  ( solo su ID) sin repeticiones 
y con el total vendido por cada uno.*/

--Solucion


SELECT
VD.VD_ProdId AS IDProducto,
SUM((VD.VD_Cantidad * vd.vd_precio)) AS Total_Vendido
FROM 
VENTAS_DETALLE VD
GROUP BY VD.VD_ProdId
WHERE

SELECT * FROM VENTAS_DETALLE

---

SELECT
SUM(VD.VD_Cantidad ) AS CantidadVendida
FROM Ventas_detalle VD
WHERE VD.VD_ProdId = 4322
SELECT
vd.VD_ProdId AS IDProducto,
SUM(VD.VD_Cantidad) AS T0tal_Vendido
FROM 
VENTAS_DETALLE VD
WHERE VD.VD_ProdId = 36 

SELECT * FROM VENTAS_DETALLE
