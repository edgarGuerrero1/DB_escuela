-- ================================================================================================================
-- ==NOMBRE             : Creacion de joins escuela           														
-- ==AUTOR				: Edgar guerrero																						
-- ==FECHA CREACION		: 27/8/2019																									
-- ==DESARROLLO			: 																		
-- ==MODULO				: 																											
-- ==DESCRIPCION		: Creacion de joins, administracion de alumnos, empleados, materias, estacionamiento
-- ==EJEMPLO			: busquedaProfe	
-- ================================================================================================================

--======================================================================================
--ver lainformacion de los profesores
create procedure busquedaProfe
as
begin

	select 
		DE.nombre,
		DE.apellidoP,
		DE.telefono,
		PE.id_profesor,
		ME.id_materia,
		ME.asignatura,
		ME.id_escuela,
		EE.campus
	from datosPersonaE DE
		join profesorE PE on DE.id_profesor = PE.id_profesor
		join materiaE ME on PE.id_profesor = ME.id_profesor
		join escuelaE EE on EE.id_escuela = ME.id_escuela
end
execute busquedaProfe
drop procedure busquedaProfe

--======================================================================================
--ver lainformacion de los alumnos
create procedure busquedaAlumno 
as
begin
	select 
		DE.nombre,
		DE.apellidoP,
		DE.telefono,
		AE.id_alumno,
		ME.id_materia,
		ME.asignatura,
		ME.id_escuela,
		EE.campus
	from datosPersonaE DE
		join alumnoE AE on DE.id_alumno = AE.id_alumno
		join materiaE ME on AE.id_materia = ME.id_materia
		join escuelaE EE on EE.id_escuela = ME.id_escuela
	
end
execute busquedaAlumno

drop procedure busquedaAlumno

--======================================================================================
--ver los alumnos estacionados en determinado estacionamiento 
create procedure EstacionamientoAlumno
@estacionamiento int
as
begin
	select 
		EE.id_estacionamiento,
		DE.nombre,
		DE.apellidoP,
		DE.telefono,
		AE.id_alumno,
		ME.id_escuela
		from estacionamientoE EE

		join alumnoE AE on EE.id_alumno = AE.id_alumno
		join materiaE ME on AE.id_materia = ME.id_materia
		join datosPersonaE DE on EE.id_alumno = DE.id_alumno
		--buscar por estacionamiento
		where EE.id_estacionamiento = @estacionamiento
end
execute EstacionamientoAlumno @estacionamiento=1

--======================================================================================
--ver los profesores estacionados en determinado estacionamiento 
create procedure EstacionamientoProfesor
@estacionamiento int

as
begin
select 
		EE.id_estacionamiento,
		DE.nombre,
		DE.apellidoP,
		DE.telefono,
		PE.id_profesor,
		ME.id_escuela
		from estacionamientoE EE

		join profesorE PE on EE.id_profesor = PE.id_profesor
		join materiaE ME on PE.id_materia = ME.id_materia
		join datosPersonaE DE on EE.id_profesor = DE.id_profesor
		where EE.id_estacionamiento = @estacionamiento
end
execute EstacionamientoProfesor @estacionamiento=2


--ver todos los estacionados y en que estacionamiento estan
/*
select 
		EE.id_estacionamiento,
		DE.nombre,
		DE.apellidoP,
		DE.telefono,
		AE.id_alumno,
		PE.id_profesor,
		ME.id_escuela
		from estacionamientoE EE

		join alumnoE AE on EE.id_alumno = AE.id_alumno
		join profesorE PE on EE.id_profesor = PE.id_profesor

		join materiaE ME on AE.id_materia = ME.id_materia
		join datosPersonaE DE on EE.id_alumno = DE.id_alumno

*/













