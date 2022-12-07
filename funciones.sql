set serveroutput on;

create or replace function f_prueba(valor number)
return number 
is
    begin
        return valor * 2;
end;


select f_prueba(2) as total from dual;


create or replace function f_costo(valor number)
return varchar
is
    costo varchar(20);
    begin
        costo := '';
        if valor <= 500 then
            costo := 'Economico';
        else costo := 'Costoso';
        end if;
        return costo;
end;