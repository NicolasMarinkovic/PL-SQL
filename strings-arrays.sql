-- Strings
set serveroutput on;
declare
  saludo varchar2(12) :='hola a todos';
  saludo2 varchar2(30) :='####Hola a todos####';
begin
  dbms_output.put_line(UPPER(saludo));--convierte a mayusculas
  dbms_output.put_line(LOWER(saludo));--convierte a minusculas
  dbms_output.put_line(INITCAP(saludo));--convierte mayusculas primeras letras
  
  dbms_output.put_line(SUBSTR(saludo, 7,4));/*busca posicion caracteres a partir de lugar indicado*/
                                            -- imprime ' tod'
  
  dbms_output.put_line(INSTR(saludo, 't'));/*indica la posicion de un caracter
                                           indicado en segundo parametro*/

  dbms_output.put_line(RTRIM(saludo2, '#'));--corta caracteres del lado derecho
  dbms_output.put_line(LTRIM(saludo2, '#'));--corta caracteres del lado izquierdo
  dbms_output.put_line(TRIM('#' from saludo2));--corta caracteres de ambos lados

end;
----------------------------------------------------

-- Arrays

DECLARE
  type a_paises is varray(5) of varchar2(20); -- 5 elementos y 20 caracteres por elemento
  nombre a_paises; -- la declaramos como tipo matriz

  type matriz_nombres is varray(5) of varchar2(20);
  type matriz_edad is varray(5) of integer;
  mnombres matriz_nombres;
  edad matriz_edad;
  total integer;

BEGIN
  nombre:= a_paises('Argentina', 'Brasil', 'Peru', 'Mexico', 'Rep. Dominicana'); -- solo 5 valores porque asi lo declaramos
  for f in 1..5 loop
    dbms_output.put_line('Nombre: ' || nombre(f));
  end loop;

  mnombres := matriz_nombres('Jorge','Nicolas', 'Marta', 'Agustin', 'Thiago');
  edad := matriz_edad(28,25,13,19,21);
  total := mnombres.count;
  for f in 1..total loop
    dbms_output.put_line('Nombre: ' || mnombres(f) || '. Edad: ' || edad(f));
  end loop;

END;