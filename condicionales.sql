DECLARE 
    a number(2) := 10;
    b number(2) := 20;

BEGIN
    if a > b then
        dbms_output.put_line( a || ' es mayor que' || b );
    elsif b > a then
        dbms_output.put_line( b || ' es mayor que' || a );
    else 
        dbms_output.put_line( ' Son iguales ');
    end if;
END;


create or replace function f_diasemana(numero int)
return varchar2
is
    dia varchar2(25);
    begin
        dia := '';
        case numero
            when 1 then dia := 'Lunes';
            when 2 then dia := 'Martes';
            when 3 then dia := 'Miercoles';
            when 4 then dia := 'Jueves';
            when 5 then dia := 'Viernes';
            when 6 then dia := 'Sabado';
            when 7 then dia := 'Domingo';
            else dia := 'No es un numero correcto';
        end case;
        return dia;
end;


create or replace function f_trimestre(fecha date)
return varchar2
is
    mes varchar2(20);
    trimestre number;
    begin
        mes := extract(month from fecha);
        trimestre := 0;
        case mes
            when 1 then trimestre := 1;
            when 2 then trimestre := 1;
            when 3 then trimestre := 1;
            when 4 then trimestre := 2;
            when 5 then trimestre := 2;
            when 6 then trimestre := 2;
            when 7 then trimestre := 3;
            when 7 then trimestre := 3;
            when 7 then trimestre := 3;
            else trimestre := 4;
        end case;
        return trimestre;
end;