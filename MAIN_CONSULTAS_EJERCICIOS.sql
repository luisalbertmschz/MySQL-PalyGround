/*SELECT 
Cli_Id, Cli_RazonSocial
FROM
clientes
WHERE Cli_id <=25
*/

USE curso

/*Traer de la tabla productos aquellos con precio >0 y status 0*/

SELECT * 
FROM productos
WHERE Prod_Precio > 0 AND Prod_Status = 0 OR Prod_Status = 1 AND Prod_ProvId = 97

/*Traer de la tabla ventas la fecha, id del cliente y total de venta
en base a un rango de fecha dado*/

SELECT Ventas_Fecha, Ventas_CliId, Ventas_Total
FROM ventas
WHERE Ventas_Fecha > '2018-01-03'


/*UNIENDO TABLAS usando la clausula WHERE*/

/*Objetivo> Traer de la tabla ventas
-Fecha, Numero de factura, Id del cliente de la venta, y Razon social de la tabla cliente
donde 


*/







-----------------------------------------------------------------------------
/*Ejercicio de obtener los productos NO vendidos de la tabla ventas y productos*/
-------------------------------------------------------------------------------


SELECT Prod_Id AS ID_Producto, Prod_Descripcion AS Producto
FROM productos
WHERE Prod_Id NOT IN (
SELECT VD_ProdId
FROM ventas_detalle
)





SELECT * FROM ventas_detalle





SELECT ventas_fecha, ventas_nrofactura, ventas_cliid, cli_razonsocial, ventas_total
FROM ventas, clientes
where ventas_cliid = cli_id



SELECT ventas_fecha AS 'fecha de venta ', ventas_nrofactura as 'no. factura', ventas_cliid  as 'id del cliente', cli_razonsocial as 'nombre del cliente', ventas_total as 'totales en ventas'
from ventas, clientes
where ventas_cliid = cli_id







/*Clausula ORDER BY*/

/*
Sirve para ordenar los datos de salida
*/



/*Obtener todos los clientes en orden alfabético*/
SELECT * FROM clientes
ORDER BY cli_razonsocial




/*Ordernas alfabéticamente por descripción y luego de manera decendente por el precio*/
 SELECT * FROM productos
 ORDER BY  prod_Status, Prod_precio DESC;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*FUNCIONES EN MYSQL*
 
 
 /* *//





/*La clausula GROUP BY sirve para agrupar registros*/


SELECT ventas_fecha, ventas_total
FROM Ventas




/*Hacer group by que agrupe pro dia la fecha y el total*/

SELECT ventas_fecha, SUM(ventas_total) AS TOTAL
FROM Ventas
GROUP BY ventas_fecha

/*Agrupamos por fecha las ventas y aplicamos un SUM, lo que ahce que 
agrupemos por fecha cada registro de venta y sumemos el total vendido
en una sola fecha a la vez sin tener duplicidad*/










 -- CLAUSULA NOT IN
 
 
 
 -----------------------------------------------------------------------------
/*Ejercicio de obtener los productos NO vendidos de la tabla ventas y productos*/
-------------------------------------------------------------------------------


SELECT Prod_Id AS ID_Producto, Prod_Descripcion AS Producto
FROM productos
WHERE Prod_Id NOT IN (
SELECT VD_ProdId
FROM ventas_detalle
)




-- CLAUSULA BETWEEN


 -----------------------------------------------------------------------------
/*Ejercicio de <::>  USAR BETWEEN PARA OBTERNET LAS VENTAS EN UN RANGO DE FECHA POR CLIENTES   <::> */
-----------------------------------------------------------------------------


SELECT Ventas_Fecha, Ventas_CliId, Cli_RazonSocial,  Ventas_Total
FROM Ventas 
JOIN CLIENTES ON (CLIENTES.Cli_Id = ventas.Ventas_CliId)
WHERE Ventas_Fecha BETWEEN '2018-01-01' AND '2018-02-01' 
GROUP BY   Ventas_CliId





 -----------------------------------------------------------------------------
/*Ejercicio de <::>  USANDO BETWEEN PARA TRAER LAS VENTAS DADO UN RANGO DE ID DE CLIENTES  <::> */
-----------------------------------------------------------------------------

 
 
SELECT Ventas_Fecha, Ventas_CliId, Cli_RazonSocial,  Ventas_Total
FROM Ventas 
JOIN CLIENTES ON (CLIENTES.Cli_Id = ventas.Ventas_CliId)
WHERE Ventas_CliId BETWEEN '0' AND '200' 
GROUP BY   Ventas_CliId

 
 
 --SENTENCIA LIKE
 
 /*Nos permite buscar en base a criterios de busquedad que pueden ser definidos*/
 
-----------------------------------------------------------------------------
/*Ejercicio <::>  USANDO SENTENCIA LIKE PARA BUSCAR REGISTROS  <::> */
-----------------------------------------------------------------------------

SELECT Prod_Id, Prod_Descripcion, Prod_Color
FROM productos
WHERE Prod_Descripcion LIKE '%AD'


/*'%AD' ---> Comienza con cualquer letra y termina con AD*/
/*'AD%' ---> Comienza con AD y termina con cualquer letra */
/*%AD%' ---> Comienza con cualquer letra  contiene  AD y termina con cualquer letra */


SELECT Prod_Id, Prod_Descripcion, Prod_Color
FROM productos
WHERE CONCAT ( Prod_Descripcion, Prod_Color ) LIKE '%AD'







-- clausula INNER JOIN


/*

La sentencia INNER JOIN es el sentencia JOIN por defecto, y consiste en combinar cada fila de una tabla con cada fila de la otra tabla,seleccionado aquellas filas que cumplan una determinada condición.


*/


SELECT 
 Ventas_Fecha,
 Ventas_NroFactura, 
 Ventas_CliId, 
 Cli_RazonSocial, 
 VD_ProdId,
 Prod_Descripcion,
 Prod_ProvId,
 Prov_Nombre,
 VD_Cantidad,
 VD_Precio,
 (VD_Cantidad * VD_Precio) AS PARCIAL
   
 
FROM Ventas VENT

INNER JOIN clientes CLI       ON (VENT.Ventas_CliId =CLI.Cli_Id)
INNER JOIN ventas_detalle VD  ON (VD.VD_VentasId = VENT.Ventas_Id)
INNER JOIN productos PROD     ON  ( VD.VD_ProdId = PROD.Prod_Id )
INNER JOIN  proveedores PROVS ON ( PROD.Prod_ProvId = PROVS.Prov_Id )


SELECT * FROM ventas_detalle

SELECT * FROM VENTAS WHERE  Ventas_Id IN ('123752')








-- clausula INNER JOIN


/*




*/





-- CREANDO TABLITA PARA TRABAJAR CON LEFT JOIN Y RIGHT JOIN 



CREATE DATABASE  TestJoin,

USE TestJoin,

CREATE TABLE Departamentos
(
    Id int,
    Nombre varchar(20)
);

CREATE TABLE Empleados
(
    Nombre varchar(20),
    DepartamentoId int
);

SELECT * FROM EMPLEADOS



INSERT INTO Departamentos VALUES(31, 'Sales');
INSERT INTO Departamentos VALUES(33, 'Engineering');
INSERT INTO Departamentos VALUES(34, 'Clerical');
INSERT INTO Departamentos VALUES(35, 'Marketing');

INSERT INTO Empleados VALUES('Rafferty', 31);
INSERT INTO Empleados VALUES('Jones', 33);
INSERT INTO Empleados VALUES('Heisenberg', 33);
INSERT INTO Empleados VALUES('Robinson', 34);
INSERT INTO Empleados VALUES('Smith', 34);
INSERT INTO Empleados VALUES('Williams', NULL );


select * from testjoin.departamentos

SELECT * FROM testjoin.empleados



SELECT * FROM empleados
JOIN departamentos ON (empleados.DepartamentoId = departamentos.Id)


-- clausula LEFT JOIN


/*

A diferencia de un INNER JOIN, donde se busca una intersección respetada por ambas tablas, con LEFT JOIN damos prioridad a la tabla de la izquierda, y buscamos en la tabla derecha.

Si no existe ninguna coincidencia para alguna de las filas de la tabla de la izquierda, de igual forma todos los resultados de la primera tabla se muestran.


*/


SELECT
  E.Nombre as 'Empleado',
  D.Nombre as 'Departamento'
FROM Empleados E
LEFT JOIN Departamentos D ON ( E.DepartamentoId = D.Id )



-- clausula RIGHT JOIN


/*

En el caso de RIGHT JOIN la situación es muy similar, pero aquí se da prioridad a la tabla de la derecha.

*/





SELECT
  E.Nombre as 'Empleado',
  D.Nombre as 'Departamento'
FROM Empleados E
RIGHT JOIN Departamentos D ON ( E.DepartamentoId = D.Id )







-- FUNCIONES BÁSICAS EN MYSQL



-- FUNCION IF

/*Usando if para que, de la mano del campo estatus decir que si es 1 está en inventario y si no es 1 que sea Agotado*/

SELECT 
PROD.Prod_Id,
PROD.Prod_Descripcion,
IF(PROD.Prod_Status = 1 , 'EN INVENTARIO', 'AGOTADO') AS 'ESTADO-PRODUCTO'

FROM  productos PROD


-- FUNCION CASE


SELECT 
PROD.Prod_Id,
PROD.Prod_Descripcion,

CASE 
WHEN PROD.Prod_Status = 1 THEN   'EN INVENTARIO'
WHEN PROD.Prod_Status = 0 THEN   'AGOTADO'
                          END AS 'ESTADO'

FROM  productos PROD




-- MEJORA USANDO CASE



SELECT 
PROD.Prod_Id AS ID_PRODUCTO,
PROD.Prod_Descripcion AS DESCRIPCION,

CASE  PROD.Prod_Status 
       WHEN 1 THEN   'EN INVENTARIO'
       WHEN 2 THEN   'AGOTADO'
       END AS 'ESTADO'

FROM  productos PROD






-- funcion SUBSTR (SUB STRING)

/*

DEFINICIÓN:
SUB STRING SUBSTR lo que que hace es tomar una proción de un campo de texto y lo muestra en una columna.
por ejemplo si queremos tomar los 10 primeros carácteres del  productos.PRO_Descripción podríamos hacer algo así:




*/

SELECT 
PROD.Prod_Id AS ID_PRODUCTO,
SUBSTR(PROD.Prod_Descripcion,1,10) AS DESCRIPCION,

CASE  PROD.Prod_Status 
       WHEN 1 THEN   'EN INVENTARIO'
       WHEN 2 THEN   'AGOTADO'
       END AS 'ESTADO'

FROM  productos PROD



-- Variación CASE + SUBTR 

/*
Con el uso de case +substr se est[a evaluando el primer car[acter que viene en la descripci[on del producto
y se crea una columna extra en base a lo anterior expresado, en la que se desplegara "Producto inicia con A" 
si el nombre de producto en verdad comienza con la letra A...
 
*/
SELECT 
PROD.Prod_Id AS ID_PRODUCTO,
SUBSTR(PROD.Prod_Descripcion,1,10) AS DESCRIPCION,
CASE  SUBSTR(PROD.Prod_Descripcion,1,1)
       WHEN 'A' THEN   'PRODUCTO INICIA CON A'
       WHEN 'B' THEN   'PRODUCTO INICIA CON B'
       END AS 'INICIAL'


FROM  productos PROD



-- Podemos usar UCASE para convertir texto en mayúsculas completamente




-- Para saber la fecha actual

 SELECT CURDATE()
 
 
-- saber hora actual
 SELECT CURTIME()

-- Saber fecha y hora

SELECT CURRENT_TIMESTAMP


-- Saber nombre de la base de datos que usamos

SELECT DATABASE(), PROD.PROD_DESCRIPCION
FROM PRODUCTOS PROD

-- Saber la cantidad en días entre una fecha x y una fecha Y


SELECT DATEDIFF ('2018-11-22','2019-11-22') Diferencia_NDias


-- La fecha futura va primero para evitar valores en negativo
















-- SENTENCIA INSERT

/*Nos permite insertar datos en nuestras tablas*/


INSERT INTO departamentos (Id, Nombre ) VALUES

('01', 'Soporte Técnico')



SELECT * FROM departamentos




-- SETENCIA UPDATE

/*Nos permite actualizar datos existentes en una tabla*/

UPDATE  departamentos
SET Nombre = 'Technical Support'
WHERE departamentos.id = 1 


-- Actualizando el precio de todos los productos SIN WHERE
/*Esto es delicado ya que estamos actualizando todos los productos de la tabla de productos*/
 

UPDATE productos PROD
SET PROD.Prod_Status = 0

SELECT * FROM  productos



-- Actualizar el estatus de los productos que sean mayor a cero

UPDATE productos PROD
SET PROD.Prod_Status = 1
WHERE prod. Prod_Precio > 0




--Actualizar mas de 1 campo


UPDATE productos PROD
SET PROD.Prod_Status = 1, PROD.
WHERE prod. Prod_Precio > 0



/*Añadimos 2 columnas extras a nuestra tabla para probar el actualizar 2 campos*/

ALTER TABLE PRODUCTOS

ADD  Prod_VentaSuspendida TINYINT
AFTER Prod_Status , 
ADD Prod_CompraSuspendida TINYINT
AFTER Prod_VentaSuspendida ;


ALTER TABLE PROVEEDORES

ADD  Prov_VentaSuspendida TINYINT
AFTER Prov_Nombre , 
ADD Prod_CompraSuspendida TINYINT
AFTER Prov_VentaSuspendida ;

ALTER TABLE PROVEEDORES
RENAME COLUMN  ProV_CompraSuspendida TO Prov_CompraSuspendida

/*Setereamos esos campos con valor de cero sin WHERE ya que queremos hacerlo para todos los productos */

UPDATE PRODUCTOS

SET Prod_VentaSuspendida = 0, Prod_CompraSuspendida = 0

UPDATE PROVEEDORES

SET Prov_VentaSuspendida = 0, Prov_CompraSuspendida = 0


SELECT  * FROM proveedores



----------------------------------------------------------------
-- ACTUALIZAR Prod_VentaSuspendida Y Prod_CompraSuspendida cuando el precio sea mayor a cero
----------------------------------------------------------------


UPDATE PRODUCTOS 

SET Prod_VentaSuspendida = 1, Prod_CompraSuspendida = 1
WHERE Prod_precio > 0


SELECT * FROM PRODUCTOS



--------------------------------------------------------------------------------------------------------------------
-- ACTUALIZAR el precio de los productos cuyo proveedor ID tenga 1 en compra suspendida desde la tabla proveedores
--------------------------------------------------------------------------------------------------------------------



UPDATE PRODUCTOS PROD

SET PROD.Prod_PRECIO = 350 
WHERE Prod_ProvId IN (SELECT PROV.Prov_Id FROM proveedores PROV WHERE PROV.Prov_CompraSuspendida =  1)






--verificando

SELECT * FROM PRODUCTOS WHERE Prod_Precio = 350

SELECT * FROM PROVEEDORES WHERE Prov_Id = 4


SELECT * FROM proveedores






















--INSTRUCCIÓN DELETE


/*Nos permite borrar registros de una tabla  con o sin condiciones que se cumplan para llevar a cabo dicha operación*/


--vamos a borrar un DEPARTAMENTO de la tabla DEPARTAMENTOS de la DB TESTJOIN
-- Borraremos el departamento Technical Support que tiene el ID 1

DELETE FROM DEPARTAMENTOS  WHERE ID = 1


SELECT * FROM DEPARTAMENTOS

















--SUBCONSULTAS

/*
Se pueden definir como sentencias SQL dentro de otras sentencias SQL
*/



SELECT 
PROD.Prod_Id AS 'Articulo',
PROD.Prod_descripcion AS 'Descripción'
FROM Productos PROD

WHERE PROD.Prod_Id = 1633





-- aplicando sub consulta 

SELECT 
Prod_Id AS 'Articulo',
Prod_descripcion AS 'Descripción',
(SELECT MAX(Ventas_Fecha) AS UltF FROM Ventas
  JOIN VENTAS_DETALLE ON VENTAS_ID =VD_VENTASID
  WHERE Prod_Id = 1633 ) AS CALCULO
FROM Productos 

WHERE PROD.Prod_Id = 1633
 
 
 --OBTENER LA ULTIME FECHA EN QUE SE VENDIO EL PRODUCTO CON EL ID1633
 
SELECT 
PROD.Prod_Id AS 'Articulo',
PROD.Prod_descripcion AS 'Descripción',
MAX(Ventas_Fecha) AS UltFecha_Venta

FROM Productos PROD
JOIN Ventas_detalle VD  ON (VD.VD_ProdId = PROD.Prod_Id )
JOIN ventas V ON (V.Ventas_Id = VD.VD_VENTASID)
WHERE  Prod_Id = 1633


--fin

SELECT 
PROD.Prod_Id AS 'Articulo',
PROD.Prod_descripcion AS 'Descripción',
(
SELECT MAX(V.Ventas_Fecha) AS UltFecha_Venta FROM Ventas V
 JOIN Ventas_detalle VD ON (V.Ventas_Id = VD.VD_VENTASID)
) AS Ult_Fecha_Venta

FROM Productos PROD
WHERE  Prod_Id = 1633


JOIN Ventas_detalle VD  ON (VD.VD_ProdId = PROD.Prod_Id )
JOIN ventas V ON (V.Ventas_Id = VD.VD_VENTASID)
WHERE  Prod_Id = 1633

a



SELECT * FROM VENTAS

SELECT * FROM VENTAS_DETALLE

SELECT * FROM PRODUCTOS

SELECT * FROM PROVEEDORES


/*
Estamos obteniendo la fecha de la última venta del producto desde la tabla ventas,
hay que hacer un join a ventas detalle ya que es donde se almacena el id de la venta y sobre todo el id
del producto asociado a la venta misma por ende la relación entre ambas tablas se hace necesaria


 VENTAS --> OBTENEMOS LA ÚLTIMA FECHA EN QUE SE VENDIO EL PRODUCTO
 VENTAS_DETALLE --> OBTENEMOS LA VENTA ASOCIADA AL PRODUCTO Y CON ELLA SE VALIDA LA FECHA DE LA ÚLTIMA VENTA DEL PRODUCTO ID DESEADO
 
 
*/








SELECT * FROM ventas_detalle

CREATE TABLE Permisos
(
Permiso TINYINT (3) UNSIGNED DEFAULT '1'
)









--Ejemplo 

CREATE TABLE MyGuests (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50),
reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


---