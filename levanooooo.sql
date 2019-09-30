select * from COMPRA;
SELECT* FROM PERSONA;
select * from DOCUMENTO;


CREATE TABLE COMPRA (
    IDCOM number(15)  NOT NULL,
    PRODUCTO varchar2(50)  NULL,
    PRECIO number(15)  NULL,
    CATEGORIA varchar2(50)  NULL,
    CONSTRAINT COMPRA_pk PRIMARY KEY (IDCOM)
) ;


Insert into COMPRA (IDCOM,PRODUCTO,PRECIO,CATEGORIA) values ('1','COMPU',12,'EQUIPOS');
Insert into COMPRA (IDCOM,PRODUCTO,PRECIO,CATEGORIA) values ('2','MAUSE',13,'ACCESORIOS');
Insert into COMPRA (IDCOM,PRODUCTO,PRECIO,CATEGORIA) values ('4','PAMTALLA',15,'EQUIPOS');
Insert into COMPRA (IDCOM,PRODUCTO,PRECIO,CATEGORIA) values ('5','TECLADO',21,'EQUIPOS');
Insert into COMPRA (IDCOM,PRODUCTO,PRECIO,CATEGORIA) values ('6','USB',13,'ACCESORIOS');
Insert into COMPRA (IDCOM,PRODUCTO,PRECIO,CATEGORIA) values ('7','IMPRESORA',10,'ACCESORIOS');





-- Table: DOCUMENTO
CREATE TABLE DOCUMENTO (
    IDDOC number(15)  NOT NULL,
    TIPO varchar2(50)  NULL,
    PLAZO date  NULL,
    ONSERVACION varchar2(50)  NULL,
    AREA varchar2(50)  NULL,
    EXCLAVO varchar2(50)  NULL,
    CONSTRAINT DOCUMENTO_pk PRIMARY KEY (IDDOC)
) ;

Insert into DOCUMENTO (IDDOC,TIPO,PLAZO,ONSERVACION,AREA,EXCLAVO) values ('1','I',to_date('23/09/19','DD/MM/RR'),'DOCUMENTO OBS1','ADMINISTRACION','JUAN');
Insert into DOCUMENTO (IDDOC,TIPO,PLAZO,ONSERVACION,AREA,EXCLAVO) values ('2','I',to_date('22/09/19','DD/MM/RR'),'DOCUMENTO OBS2','MESA DE PARTES','JUANITA');
Insert into DOCUMENTO (IDDOC,TIPO,PLAZO,ONSERVACION,AREA,EXCLAVO) values ('3','E',to_date('19/09/19','DD/MM/RR'),'DOCUMENTO OBS3','CAJA','JUANITO');
Insert into DOCUMENTO (IDDOC,TIPO,PLAZO,ONSERVACION,AREA,EXCLAVO) values ('4','E',to_date('18/09/19','DD/MM/RR'),'DOCUMENTO OBS4','ADMINISTRACION','JUANCHO');
Insert into DOCUMENTO (IDDOC,TIPO,PLAZO,ONSERVACION,AREA,EXCLAVO) values ('5','I',to_date('23/09/19','DD/MM/RR'),'DOCUMENTO OBS5','REGISTRO CIVIL','JILBERTO');
-- Table: PERSONA
CREATE TABLE PERSONA (
    IDPER number(15)  NOT NULL,
    NOMPER varchar2(50)  NULL,
    APEPER varchar2(50)  NULL,
    EDAD date  NULL,
    CELLPER varchar2(11)  NULL,
    SEXPER char(1)  NULL,
    CONSTRAINT PERSONA_pk PRIMARY KEY (IDPER)
) ;


Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('1','JUAN','QUISPE LUYO',to_date('31/10/00','DD/MM/RR'),'1235','S');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('2','PEDRO','QUISPE QUISPE',to_date('31/10/20','DD/MM/RR'),'1235','S');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('3','PEDRO','QUISPE QUISPE',to_date('31/10/20','DD/MM/RR'),'1235','S');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('4','JUAN','QUISPE LUYO',to_date('10/10/00','DD/MM/RR'),'1235','S');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('5','MAUS','QUE HERRAMIENTA',to_date('11/10/00','DD/MM/RR'),'43211','S');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('6','OUUUU','CHUUUU RUSSS',to_date('21/12/00','DD/MM/RR'),'31221','S');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('7','JOSE',null,to_date('21/12/99','DD/MM/RR'),'21545','M');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('8','JOSE','QUISPE AVALOS',to_date('21/12/99','DD/MM/RR'),'124566','M');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('9','SAMAN','ARATAAA',to_date('21/12/99','DD/MM/RR'),'12457','M');
Insert into PERSONA (IDPER,NOMPER,APEPER,EDAD,CELLPER,SEXPER) values ('10','DEMO','YONIOR',to_date('21/12/99','DD/MM/RR'),'12457','M');

select * from COMPRA;
SELECT* FROM PERSONA;
select * from DOCUMENTO;

--DEMO 0.00001%
--OR REPLACE
create function FUNCION1 (VARIABLE1 NUMBER)
    RETURN NUMBER
IS
 BEGIN
    RETURN VARIABLE1+(VARIABLE1*10);
end;
/
select PRECIO,  FUNCION1(PRECIO) from COMPRA
-====================
create or replace function FUNCION1 (VARIABLE1 NUMBER)
    RETURN NUMBER
IS
 BEGIN
    RETURN VARIABLE1+(VARIABLE1*0.1);
end;
/
select PRECIO,  FUNCION1(PRECIO) from COMPRA

/*
Las funciones, como los procedimientos almacenados 
son bloques de código que permiten agrupar y organizar 
sentencias SQL que se ejecutan al invocar la función.
*/

--Para crear una función empleamos la instrucción "create function"
--Para crear una función empleamos la instrucción "create function" o "create or replace function". Si empleamos "or replace", se sobreescribe (se reemplaza) una función existente; si se omite y existe una función con el nombre que le asignamos, Oracle mostrará un mensaje de error indicando tal situación.


create or replace function FUNCION1 (VARIABLE1 NUMBER) --sección de aclaracion de variables.
RETURN NUMBER
IS
 BEGIN --encierra las acciones.
 RETURN (VARIABLE1*0,1);
end;
/
--Una función acepta parámetros, se invoca con su nombre y retorna un valor.

select PRECIO,  FUNCION1(PRECIO) from COMPRA

--=========CASO #1================
SELECT * FROM COMPRA 

create or replace function f_costoso(valoringresado number)
  return varchar --RETORNO STRING
 is
  valorretornado varchar(20);
 begin
   valorretornado:='';
   if valoringresado<=10 then
    valorretornado:='economico';
   else valorretornado:='costoso';
   end if;
   return valorretornado;
 end;
 /
 select producto,precio,f_costoso(precio) from COMPRA ;
 
 --========= CASO #2 ===============

create or replace function f_promedio (avalor1 number, avalor2 number)
 return number
 is
 begin 
   return (avalor1+avalor2)/2;
 end;
 /

exec f_promedio(10,20);
--============================

-- Table: DOCUMENTO
CREATE TABLE DOCUMENTO (
    IDDOC number(15)  NOT NULL,
    TIPO varchar2(50)  NULL,
    PLAZO date  NULL,
    ONSERVACION varchar2(50)  NULL,
    AREA varchar2(50)  NULL,
    EXCLAVO varchar2(50)  NULL,
    CONSTRAINT DOCUMENTO_pk PRIMARY KEY (IDDOC)
) ;

CREATE OR REPLACE function DOCUMENTO_FUN(PLAZO NUMBER,demo number)
RETURN NUMBER 
IS BEGIN
RETURN Power(PLAZO, 2);

end;
/
SELECT * FROM DOCUMENTO
SELECT * FROM COMPRA
SELECT * FROM DOCUMENTO

select PRECIO , DOCUMENTO_FUN(PRECIO) from COMPRA;

select PRECIO,  FUNCION1(PRECIO) from COMPRA




-- add_months(f,n): agrega a una fecha, un número de meses.
--Si el segundo argumento es positivo, se le suma a la fecha enviada tal cantidad de meses;
--si es negativo, se le resta a la fecha enviada tal cantidad de meses. Ejemplo:


select add_months('10/06/2019',5) from dual; --retorna "10/11/07"
 select add_months('10/06/2019',-5) from dual; --retorna "10/01/07"
 select add_months('30/01/2019',1) from dual; --retorna "25/02/07" ya que es el último día de ese mes.

-- last_day(f): retorna el ultimo día de mes de la fecha enviada como
--argumento. Ejemplo:

 select last_day('10/02/2007') from dual;-- "28/02/07"
 select last_day('10/08/2007') from dual;-- "31/08/07"
 
 
 
 /*La tabla DUAL es una tabla especial de una sola columna presente
 de manera predeterminada en todas las instalaciones de bases de datos
 de Oracle. Se utiliza para seleccionar una seudocolumna como SYSDATE o
 USER. La tabla tiene una sola columna VARCHAR2(1) llamada DUMMY que 
 tiene un valor de 'X'.*/
 
 -- months_between(f1,f2): retorna el numero de meses entre las fechas 
 --enviadas como argumento. Ejemplo:

 select months_between('19/05/2003','21/06/05') from dual;-- retorna

-- next_day(fecha,dia): retorna una fecha correspondiente al primer día
--especificado en "dia" luego de la fecha especificada. En el siguiente
--ejemplo se busca el lunes siguiente a la fecha especificada:

 select next_day('20/9/2019','LUNES') from dual;
 
 -- current_date: retorna la fecha actual. Ejemplo:

 select current_date from dual;
-- current_timestamp: retorna la fecha actual con mas especificación

 select current_timestamp from dual;
 --- to_date: convierte una cadena a tipo de dato "date". Ejemplo:
  select to_date ('05-SEP-2007 10:00 AM','DD-MON-YYYY HH:MI AM') from dual;
  --==================================================
  SELECT * FROM DOCUMENTO
  select EXCLAVO, f_demito(TIPO,PLAZO), PLAZO ,  from DOCUMENTO
  
  create or replace function f_demito(DE varchar, DI date)
  return  varchar --RETORNO STRING
 is  
  valor2 varchar(20);
  valor1 date();
 begin
   valor2:='';
   if DE != 'I' then
    valor2:='INTERNO';
   else valor2:='EXTERNO';
   end if;   
   return valor2;
   return valor1;
 end;
 /
 select producto,precio,f_costoso(precio) from COMPRA ;
 
 create or replace function f_costoso(valoringresado number)
  return varchar --RETORNO STRING
 is
  valorretornado varchar(20);
 begin
   valorretornado:='';
   if valoringresado<=10 then
    valorretornado:='economico';
   else valorretornado:='costoso';
   end if;
   return valorretornado;
 end;
 /
 