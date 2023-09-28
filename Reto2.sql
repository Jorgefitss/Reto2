/*RETO2*/
describe Clientes

--1  En la tabla de Clientes agregar los atributos:
ALTER TABLE Clientes
Add NOM_CORTO Varchar2(100) add EDAD Number(3,0);


--2  Actualizar el atributo NOM_CORTO con el contenido de: VAL_NOM1 y VAL_APE1
--  En la actualización se debe de considerar que la primera letra de cada atributo se conserve en Mayúscula y el resto en minúsculas

BEGIN
UPDATE Clientes
SET NOM_CORTO = INITCAP(VAL_NOM1) || ' ' || INITCAP(VAL_APE1);
    For Nom IN(Select NOM_CORTO from clientes) Loop
    dbms_output.put_line('NOM_CORTO: ' ||  Nom.NOM_CORTO);
    END Loop;
END;

 
 --3  Calcular la edad de cada cliente y actualizar el atributo EDAD.

BEGIN
UPDATE Clientes
SET Edad = TRUNC(MONTHS_BETWEEN(SYSDATE, FEC_NACI) / 12, 2);
    For Edad_x IN(Select Edad from clientes) Loop
    dbms_output.put_line('EDAD: ' || Edad_x.Edad);
    END Loop;
END;



 --4  Generar una sentencia que reemplace la letra “Ñ” por la letra “N” en los atributos VAL_APE1 y VAL_APE2 de la tabla Clientes

DECLARE
V_REPLACE Varchar2(30) := 'Ñ';
BEGIN
UPDATE clientes
Set VAL_APE1 = Replace(VAL_APE1, V_REPLACE, 'N'),
    VAL_APE2 = Replace(VAL_APE2, V_REPLACE, 'N');
 For cliente_x IN (Select * from clientes where VAL_APE1 || VAL_APE2 LIKE '%N%') Loop
 dbms_output.put_line('VAL_APE1: ' || cliente_x.VAL_APE1 || ', VAL_APE2: ' || cliente_x.VAL_APE2);
    END Loop;
END;

 
