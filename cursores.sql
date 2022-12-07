-- Los cursores son punteros a una area privada de una sentencia sql
-- Cursores implicitos -> cuando un select devuelve un solo registro
-- Cursores explicitos -> cuando un select devuelve varios registros

-- TIENEN VARIOS ATRIBUTOS, %ISOPEN, %FOUND, %NOTFOUND, %ROWCOUNT

set serveroutput on;

declare 
    filas number(2);
begin
    update empleados
        set sueldo = sueldo + 500 where sueldo > 3000;
    
    if sql%notfound then
        dbms_output.put_line('== NO HAY EMPLEADOS DISPONIBLES ==');
    elsif sql%found then
        filas := sql%rowcount;
        dbms_output.put_line(filas || ': EMPLEADOS ACTUALIZADOS');
    end if;
end;

-- CURSOS IMPLICITO
declare
    v_docu empleados.documento%type;
    v_nom empleados.nombre%type;
    v_ape empleados.apellido%type;
    v_suel empleados.sueldo%type;
    
    cursor c_cursor2 is
        select documento, nombre, apellido, sueldo
        from empleados
        where documento = 22222222;
        
begin
    open c_cursor2;
    fetch c_cursor2 into v_docu, v_nom, v_ape, v_suel;
    close c_cursor2;
    dbms_output.put_line('Documento: ' || v_docu);
    dbms_output.put_line('Nombre: ' || v_nom);
    dbms_output.put_line('Apellido: ' || v_ape);
    dbms_output.put_line('Sueldo: ' || v_suel);
end;

 -- CURSOR EXPLICITOS
 -- RECORRE TODA UNA TABLA DE SQL
declare
    v_empleados empleados%rowtype; -- rowtype junto con el nombre de la tabla le permite recibir a la variable todos los registros disponibles tomando el tipo de dato que necesite.
begin
    for v_empleados in (select * from empleados) loop
    dbms_output.put_line(v_empleados.sueldo); -- IMPRIME TODOS LOS SUELDOS DE LA TABLA
    end loop;
end;

begin 
    update empleados set sueldo = 10000 where documento = '23333333';
    if sql%notfound then -- atributo en caso de que no encuentre un valor
        dbms_output.put_line('NO EXISTE REGISTRO PARA MODIFICAR');
    end if;
end;

-- CURSORES CON PARAMETROS
declare
    v_nom productos.nombre_producto%type;
    v_pre productos.precio%type;

    cursor c_productos (idprod productos.id_producto%type) -- le indico un parametro y su type
        is
        select nombre_producto, precio from productos -- selecciono nombre y precio donde el id sea igual al parametro ingresado
        where id_producto = idprod;
begin
    open c_productos(2); -- le paso el id 2
    loop
        fetch c_productos into v_nom, v_pre;
        exit when c_productos%notfound;
        dbms_output.put_line('Articulo: ' || v_nom || ', precio: ' || v_pre);
    end loop;
    close c_productos;
end;


-- REF CURSORS
-- Es una variable definida como tipo de cursor que apunta a un resultado de un cursor normal

create or replace function f_datoempleados( v_valor1 in number,
                                            v_valor2 in number)
return sys_refcursor
is
    v_ref sys_refcursor;
begin
    open v_ref for select * from empleados
    where documento in (v_valor1,v_valor2);
    return v_ref;
end;

select f_datoempleados('23333333') from dual; -- este select lo devuelve desordenado

var rc1 refcursor -- esto lo devuelve de forma ordenada
exec :rc1 := f_datoempleados(22222222,23333333);
print rc1; 


