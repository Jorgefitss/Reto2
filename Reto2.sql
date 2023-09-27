describe Clientes

--1  En la tabla de Clientes agregar los atributos:
ALTER TABLE Clientes
Add NOM_CORTO Varchar2(100) add EDAD Number(3,0);

--2  Actualizar el atributo NOM_CORTO con el contenido de: VAL_NOM1 y VAL_APE1
--  En la actualización se debe de considerar que la primera letra de cada atributo se conserve en Mayúscula y el resto en minúscula
 
UPDATE Clientes
SET NOM_CORTO = INITCAP(VAL_NOM1) || ' ' || INITCAP(VAL_APE1);

Select * from clientes;

--3  Calcular la edad de cada cliente y actualizar el atributo EDAD.
UPDATE Clientes
SET Edad = trunc((sysdate - FEC_NACI)) /365;

Select edad from clientes;

--4  Generar una sentencia que reemplace la letra “Ñ” por la letra “N” en los atributos VAL_APE1 y VAL_APE2 de la tabla Clientes
Update Clientes
Set VAL_APE1 = Replace(VAL_APE1,'Ñ','N'),
    VAL_APE2 = Replace(VAL_APE2,'Ñ','N');
    commit;

Select VAL_APE1, VAL_APE2 from Clientes 
where VAL_APE1 || VAL_APE2 Like '%N%'; 

Select VAL_APE1, VAL_APE2 from Clientes 
where VAL_APE1 || VAL_APE2 Like '%Ñ%'; 

SELECT VAL_APE1 from clientes where VAL_APE1= 'TITUANA';

