set serveroutput on;
-- Variable compuesta basada en una tabla

declare
    reg_productos productos%rowtype; -- variable compuesta
    -- toma todos los tipos de datos de la tabla productos
begin
    select * into reg_productos from productos
    where codigo = 3; -- aca lleno la variable

    dbms_output.put_line('CARACTERISTICA DEL PRODUCTO');
    dbms_output.put_line('Codigo de producto: ' || reg_productos.codigo);
    dbms_output.put_line('Articulo: ' || reg_productos.nombre);
    dbms_output.put_line('Precio: ' || reg_productos.precio);
end;

-- Variable compuesta a nivel de Cursor

declare
    cursor cu_productos is
    select * from productos; -- apuntamos el cursor a toda la tabla productos

    var_productos cu_productos%rowtype; -- creamos la variable compuesta con el cursor
begin
    open cu_productos;
    loop
        fetch cu_productos into var_productos; -- la variable guarda todos los registros de la tabla productos
        exit when cu_productos%notfound;
        dbms_output.put_line(var_productos.codigo || ' ' || var_productos.nombre);
    end loop;
end;

