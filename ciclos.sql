-- loop
DECLARE
    valor number := 10;

BEGIN
    loop
        dbms_output.put_line(valor);
        valor := valor + 10;
        --if valor > 50 then
        --    exit;
        --end if;
        exit when valor > 50; -- reemplaza al if
    end loop;

    dbms_output.put_line('Valor final: ' || valor);

END;

-- while
DECLARE
    valor number(2) := 10;

BEGIN
    while valor < 20 loop
        dbms_output.put_line('El valor es: ' || valor);
        valor := valor + 1;
    end loop;

END;

-- for
DECLARE
    numero number(2);

BEGIN
    for numero in 10..20 loop
        dbms_output.put_line('El valor es: ' || numero);
    end loop;

    for f in reverse 0..5 loop
        dbms_output.put_line('El valor de f: ' || f);
    end loop;

    -- tabla de multiplicar
    for f in 1..10 loop
        dbms_output.put_line('2 * ' || f || ' = ' || (f*2));
    end loop;


END;

-- bucles anidados

DECLARE
    bucle1 number(2) := 0;
    bucle2 number(2);

BEGIN
    loop
        dbms_output.put_line('----------------------------');
        dbms_output.put_line('valor de bucle externo = ' || bucle1);
        dbms_output.put_line('----------------------------');

        bucle2 := 0;
            loop
                dbms_output.put_line('valor de blucle externo = ' || bucle2);
                bucle2 := bucle2 + 1;
                exit when bucle2 = 5;
            end loop;
        bucle1 := bucle1 + 1;
        exit when bucle1 = 3;

    end loop;
    
END;