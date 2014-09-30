select count(*) from cita c,empleado e
where 
group by id_empleado
having id_empleado e =id_empleado c

SELECT  `empleado`.`id_empleado`,
 `empleado`.`nombre`,
 `empleado`.`apellido`,
COUNT(`cita`.`id_cita`) 
FROM (`empleado` INNER JOIN `cita` on `cita`.`id_empleado`=`empleado`.`id_empleado`)
GROUP BY  `empleado`.`id_empleado`
HAVING COUNT(`cita`.`id_cita`) >0

SELECT  `empleado`.`id_empleado`,
 `empleado`.`nombre`,
 `empleado`.`apellido`,
 `empleado`.`telefono`,
COUNT(`cita`.`id_cita`) 
FROM (`empleado` INNER JOIN `cita` on `cita`.`id_empleado`=`empleado`.`id_empleado`)
GROUP BY  `empleado`.`id_empleado`
