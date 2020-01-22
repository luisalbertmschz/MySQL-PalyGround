
-- Ejercicios SELECT buscando strings


-- Ejercicio #1
/*
Traer todos los productos cuya descripción comienze con SUBETERRANEO
*/
-- SOLUCIÓN

SELECT *
FROM productos PROD
WHERE PROD.PROD_descripcion LIKE 'SUBTERRANEO%'

SELECT * FROM PRODUCTOS

-- Ejercicio #2
/*
Traer todos los productos 	que en su descripción o color
o nombre de proveedor tengan el string FERRO
*/
-- SOLUCIÓN

SELECT
PROD.Prod_Id AS 'ID',
PROD.Prod_Descripcion AS 'Nombre',
PROD.Prod_color AS 'Color',
PROV.Prov_Nombre AS 'NombreProveedor'

FROM Productos PROD
JOIN proveedores PROV ON (PROD.Prod_ProvId = PROV.Prov_Id)

WHERE
PROD.Prod_Descripcion LIKE'%FERRO%' 
OR PROD.Prod_color LIKE'%FERRO%'
OR PROV.Prov_Nombre LIKE '%FERRO%'


-- OPTIMIZACIÓN


SELECT
PROD.Prod_Id AS 'ID',
PROD.Prod_Descripcion AS 'Nombre',
PROD.Prod_color AS 'Color',
PROV.Prov_Nombre AS 'NombreProveedor'

FROM Productos PROD

JOIN proveedores PROV ON (PROD.Prod_ProvId = PROV.Prov_Id)

WHERE CONCAT(PROD.Prod_Descripcion, PROD.Prod_color, PROV.Prov_Nombre) LIKE'%FERRO%' 





-- Ejercicio #3
/*
Traer  todos los artículos que en su descripción tengan la palabra CINTA y que tengan ventas realizadas
*/
-- SOLUCIÓN

SELECT
PROD.Prod_Id AS 'ID',
PROD.Prod_Descripcion AS 'Nombre',
PROD.Prod_color AS 'Color'

FROM Productos PROD

WHERE PROD.Prod_Id IN 
(
SELECT 
VD.`VD_ProdId`
FROM `ventas_detalle` VD 
)
AND PROD.Prod_Descripcion LIKE '%CINTA%'


SELECT * FROM ventas_Detalle











SELECT * FROM departamentos

-- prueba de concatenación 
USE TESTJOIN
SELECT
      EMP.nombre,
      EMP.Sexo,
      CASE WHEN Sexo LIKE 'M' THEN 'Masculino ▰   Femenino ▱ '
           WHEN Sexo LIKE 'F' THEN 'Masculino ▱   Femenino ▰  '
		   END AS 'Informacion'
   
    FROM empleados EMP
    
    ALTER TABLE empleados
    ADD COLUMN Sexo VARCHAR (3)
    
    UPDATE empleados
    SET  SEXO = 'F'
    WHERE Nombre LIKE 'H%'


SELECT CONCAT([FIELD A], '\r\n', [FIELD B], '\r\n') AS new_field









SELECT
      EMP.nombre,
      EMP.Sexo,
      CASE WHEN Sexo LIKE 'M' THEN '▰ Masculino '   'Femenino ▱ '
           WHEN Sexo LIKE 'F' THEN '▱ Masculino '  'Femenino ▰  '
		   END AS 'Informacion'
   
    FROM empleados EMP
      
    
    