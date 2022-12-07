SELECT * FROM USER_TRIGGERS WHERE TRIGGER_NAME = 'tr_ingresolibros';
SELECT trigger_name, triggering_event, table_name, status 
FROM USER_TRIGGERS WHERE table_name = 'EMPLEADOS';

-- DESABILITAR TRIGGERS.
alter trigger tr_aumentasueldo disable;

-- before insert
create or replace trigger tr_ingresolibros
before insert
on libros
    begin
        insert into control values(user, sysdate);
end tr_ingresolibros;

create or replace trigger tr_ingresaempleados
before insert
on empleados
for each row
    begin
        insert into control values(user, sysdate);
end tr_ingresaempleados;

-- before delete
create or replace trigger borradoalumnos
before delete
on alumnos
for each row
    begin
        insert into control values(user, sysdate);
end borradoalumnos;

-- before update
create or replace trigger actualiza
before update
on empleados
for each row
    begin
        insert into control values(user, sysdate);
end actualiza;

-- MULTIPLES EVENTOS
create or replace trigger tr_control_empleados
 before insert or update or delete
 on empleados
 for each row
begin
 if inserting then
   insert into control_empleados values (user, sysdate,'ingreso');
  end if;
  if deleting then
   insert into control_empleados values (user, sysdate,'borrado');
 end if; 
 if updating then
  insert into control_empleados values (user, sysdate,'actualización');
 end if;

 if(:new.sueldo>5000) then
    raise_application_error(-20000,'SUELDO NO PUEDE SUPERAR LOS $5000.00'); -- MANEJO DE ERRORES
 end if;
 insert into control values (user, sysdate, 'INSERCION');
 
 if(:old.seccion='Gerencia') then
    raise_application_error(-20000,'NO SE PUEDE ELIMINAR PUESTO DE GERENCIA'); -- MANEJO DE ERRORES
 end if;
 insert into control values (user, sysdate, 'BORRADO');
 
 if updating('documento') then
    raise_application_error(-20000,'NO SE PUEDE ACTUALIZAR NUMERO DE DNI'); -- MANEJO DE ERRORES
 end if;
end tr_control_empleados;

-- :NEW
create or replace trigger tr_ingresalibros
    before insert
    on libros
    for each row 
begin
    if(:new.precio<=30) then -- el nuevo precio insertado
        insert into ofertas VALUES (:new.codigo, :new.precio, user, sysdate);
    end if;
end tr_ingresalibros;

-- :OLD
create or replace trigger tr_actualizalibros
    before update of precio -- EN UPDATE DE PRECIO
    on libros
    for each row 
begin
    if(:old.precio<=30) and (:new.precio > 30) then -- SI EL PRECIO NUEVO ES MAYOR A 30 LO ELIMINA DE LA TABLA DE OFERTAS
        delete from ofertas where codigo = :old.codigo;
    end if;

    if(:old.precio>30) and (:new.precio<=30) then -- SI EL PRECIO NUEVO ES MENOR A 30 LO INSERTA DE LA TABLA DE OFERTAS
        insert into ofertas VALUES (:new.codigo, :new.precio, user, sysdate);
    end if;
end tr_actualizalibros;

-- FOR EACH ROW WHEN && IF
create or replace trigger tr_aumentasueldo
    before update of sueldo
    on empleados
    for each row when( new.sueldo > old.sueldo) -- cuando se actualize y el nuevo valor sea mayor al actualizado
begin
    insert into control VALUES (user, sysdate, :old.documento, :old.sueldo, :new.sueldo);
end tr_aumentasueldo;

create or replace trigger tr_actualizadatos
    before insert
    on empleados
    for each row
begin
    :new.apellido := upper(:new.apellido);
    if (:new.sueldo is null) then
        :new.sueldo := 0;
    end if;
end tr_actualizadatos;




