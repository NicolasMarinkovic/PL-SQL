select nombre, id_puesto, level
from empleados
start with nombre = 'Miguel Gonzales' -- la jerarquia tiene que iniciar con el primer registro que le pongamos
connect by prior id_empleado = id_supervisor; -- conecta el empleado con su supervisor

select level,nombre, id_puesto,
sys_connect_by_path(nombre,'>') JERARQUIA
from empleados
start with id_supervisor is null
connect by prior id_empleado = id_supervisor;

select * from empleados;