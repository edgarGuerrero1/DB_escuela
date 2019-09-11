-- ================================================================================================================
-- ==NOMBRE             : Creacion de tablas escuela           														
-- ==AUTOR				: Edgar guerrero																						
-- ==FECHA CREACION		: 27/8/2019																									
-- ==DESARROLLO			: 																		
-- ==MODULO				: 																											
-- ==DESCRIPCION		: Creacion de tablas para escuela y administracion de alumnos, empleados, materias, estacionamiento
-- ==EJEMPLO			: datosPersonaE	
-- ================================================================================================================

CREATE TABLE escuelaE (
      id_escuela int IDENTITY (1, 1) NOT NULL,
      campus varchar(50),
      codigo_p varchar(10),
      telefono int,
      id_profesor int,
      id_alumno int
      PRIMARY KEY (id_escuela)

)
DROP TABLE escuelaE
SELECT
      * 
FROM escuelaE escuelaE
--======================================================================================
CREATE TABLE profesorE (
      id_profesor int IDENTITY (1, 1) NOT NULL,
      id_materia int
      PRIMARY KEY (id_profesor)
)
DROP TABLE profesorE
SELECT
      *
FROM profesorE
--======================================================================================
CREATE TABLE alumnoE (
      id_alumno int IDENTITY (1, 1) NOT NULL,
      id_materia int
      PRIMARY KEY (id_alumno)
)
DROP TABLE alumnosE
SELECT
      *
FROM alumnoE
--======================================================================================
CREATE TABLE CreditoE (
      id_credito int IDENTITY (1, 1) NOT NULL,
      id_alumno int,
      id_escuela int,
      fecha_credito date,
      deuda int
      PRIMARY KEY (id_credito)
)
DROP TABLE CreditoE
SELECT
      *
FROM CreditoE
--======================================================================================
CREATE TABLE estacionamientoE (
      id_estacionamiento int not null,
      id_alumno int,
      id_profesor int,
	  id_escuela int,
	  estatus varchar(6),
	  fecha date,
	  CONSTRAINT FKid_escuela FOREIGN KEY (id_escuela) REFERENCES escuelaE (id_escuela),

)
DROP TABLE estacionamientoE
SELECT * FROM estacionamientoE
--======================================================================================
CREATE TABLE materiaE (
      id_materia int IDENTITY (1, 1) NOT NULL,
      asignatura varchar(30),
      id_profesor int,
      id_escuela int
      PRIMARY KEY (id_materia)
      CONSTRAINT FK_materiaE_profesor FOREIGN KEY (id_profesor) REFERENCES profesorE (id_profesor)
)
DROP TABLE materiaE
SELECT
      *
FROM materiaE
--======================================================================================
CREATE TABLE datosPersonaE (
      nombre varchar(30) NOT NULL,
      apellidoP varchar(30) NOT NULL,
      apellidoM varchar(30),
      telefono int,
      edad int,
      fecha_nac date,
      sexo varchar(1), -- M,H
      actividad varchar(30) NOT NULL,-- esta actividad nos permitira definir si es empleado o profesor
      id_profesor int,
      id_alumno int,
      CONSTRAINT FKid_profesor FOREIGN KEY (id_profesor) REFERENCES profesorE (id_profesor),
      CONSTRAINT FKid_alumno FOREIGN KEY (id_alumno) REFERENCES alumnoE (id_alumno)
)

DROP TABLE datosPersonaE
SELECT
      *
FROM datosPersonaE
--======================================================================================