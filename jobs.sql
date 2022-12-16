begin
    sys.dbms_scheduler.create_job(
        job_name => 'job_uno',
        job_type => 'PLSQL_BLOCK',  -- le doy tipo de bloque
        job_action => 'declare
        v_conteo number := 0;
        begin
            select count(*) into v_conteo
            from log_actividades;
            insert into log_actividades values(v_conteo + 1,sysdate);
            commit;
        end;',
        start_date => systimestamp, -- inicia justo despues de haberlo creado
        repeat_interval => 'freq=secondly; interval=5', -- la frecuencia de repeticiones es cada 5 segundos
        end_date => null, -- no finaliza
        enabled => true, -- esta habilitado
        comments => 'log de actividades');
end;

select * from log_actividades;