set serveroutput on

DECLARE
--seccion declarativa (opcional)
    identificador integer := 50;
    nombre varchar2(25) := 'Nicolas Marinkovic'; -- varchar2 acorta los espacios que no se utilizen en memoria
    apodo char(10) := 'joselo';
    sueldo number(5) := 30000; -- number permite alojar puntos y comas
    comision decimal(4,2) := 50.20; -- 4 enteros, 2 decimales
    fecha_actual date := (sysdate);
    fecha date := to_date('2020/07/09', 'yyyy/mm/dd');
    saludo varchar2(50) default 'Buenos dias a todos';
    detalles clob;

-- CONSTANTES
    mensaje constant varchar2(30) := 'Buenos dias a todos';
    numero constant number(6) := 30000;

BEGIN
--seccion ejecutable
    dbms_output.put_line('El valor de la variable es: ' || identificador); -- es un paquete de PL-SQL que permite imprimir una variable
    dbms_output.put_line('El nombre de usuario es: ' || nombre);
    dbms_output.put_line('La comision a cobrar al usuario es: ' || comision);
    detalles := 'Mira soy una variable CLOB
                y puedo estar en diferentes renglones';
    dbms_output.put_line(detalles);

--EXCEPTION
--manejo de errores y situaciones (opcional)

END;

 --borrar tablas (si existen)
 drop table libros;
 drop table control;
 drop table empleados;

 --crear tablas
 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table ofertas(
  codigo number(6),
  precio number(6,2),
  usuario varchar2(20),
  fecha date
 );

 create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
   
 create table control(
  usuario varchar2(30),
  fecha date,
  documento char(8),
  antiguosueldo number(8,2),
  nuevosueldo number(8,2)
 ); 

create table alumnos(
legajo varchar2(4) not null,
documento varchar2(8) not null,
nombre varchar2(30) not null,
curso number(1) not null,
materia varchar2(15) not null,
nota_final number(3,2) not null);

create table control_empleados(
usuario varchar2(20),
fecha date,
accion varchar(20));

drop table productos;

create table productos (
codigo int not null primary key,
nombre varchar2(100) not null,
precio number(6,2) not null,
codigo_fabricante int not null);

insert into productos values(1, 'Disco duro SATA· 1TB', 86.99, 5);
insert into productos values(2 , 'Memoria RAM DDR4 8GB', 120, 6);
insert into productos values(3, 'DISCO SSD 1 TB', 150.99, 4);
insert into productos values(4, 'GEFORCE GTX 1050Ti', 185, 7);
insert into productos values(5, 'GEFORCE GTX 1080TI', 755, 6);
insert into productos values(6, 'Monitor 24 LED Full HD', 202, 1);
insert into productos values(7, 'Monitor 27 LED Full HD', 245.99, 1);
insert into productos values(8, 'Portátil Yoga 520', 559, 2);
insert into productos values(9, 'Portátil Ideapd 320', 444, 2);
insert into productos values(10, 'Impresora HP Deskjet 3720', 59.99, 3);
insert into productos values(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

insert into alumnos values('A234','23333333','LOPEZ ANA',5,'MATEMATICA',9);
insert into alumnos values('A345','24444444','GARCIA CARLOS',6,'MATEMATICA',8.5);
insert into alumnos values('A457','26666666','PEREZ FABIAN',6,'LENGUA',3.2);
insert into alumnos values('A348','25555555','PEREZ PATRICIA',6,'LENGUA',7.85);
insert into alumnos values('A123','22222222','PEREZ PATRICIA',5,'MATEMATICAS',9);
insert into alumnos values('A124','32222222','GONZALES JOSE',5,'BIOLOGIA',9);
insert into alumnos values('A124','32222222','GONZALES JOSE',5,'MATEMATICAS',8);
 
 --INSERTS
  insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
