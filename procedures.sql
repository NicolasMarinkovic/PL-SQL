set serveroutput on;

create or replace procedure saludo 
as
  begin
    dbms_output.put_line('Hola a todos');
end saludo;

create or replace procedure aumenta_precio
  as
  begin
   update articulos set precio=precio+(precio*0.1); -- debe exitir una tabla articulos
end aumenta_precio;

begin
  saludo;
end;
execute saludo;  -- executa procedure
drop procedure saludo; -- dropea procedure
select * from user_objects where object_type='PROCEDURE';
select * from user_procedures where object_name like '%saludo%';


--- PARAMETROS
create or replace procedure aumentasueldo(anio in number, porcentaje in number)
as
  begin
    dbms_output.put_line(extract(year from current_date));
    --update empleados set sueldo = sueldo + (sueldo * porcentaje/100)
    --where (extract(year from current_date) - extract(year from fechaingreso)) < anio;

end aumentasueldo;
execute aumentasueldo(10,20);  -- executa procedure

create or replace procedure ingresoemple(docu in char, nom in varchar2, ape in varchar2)
as
  begin
    insert into empleados values(docu,nom,ape, NULL, NULL);
end ingresoemple;
execute ingresoemple( '33333333', 'Nicolas', 'Marinkovic');  -- executa procedure

create or replace procedure autorlibro( atitulo in varchar2)
as
  v_autor varchar2(20):
  begin
    select autor into v_autor from libros where titulo = atitulo; -- LLENO LA VARIABLE V_AUTOR

    insert into tabla1
    select titulo,precio from libros
    where autor = v_autor;

end autorlibro;
