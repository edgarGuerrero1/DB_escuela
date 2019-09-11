-- ================================================================================================================
-- ==NOMBRE             : Insercion con procedures para escuela                       										
-- ==AUTOR				: Edgar guerrero																					
-- ==FECHA CREACION		: 27/8/2019																										
-- ==DESARROLLO			: 																		
-- ==MODULO				: 																											
-- ==DESCRIPCION		: Insercion de datos a las tablas de escuela
-- ==EJEMPLO			: PROCEDURE AltaCampus
-- ================================================================================================================

--======================================================================================
CREATE PROCEDURE AltaCampus @campus varchar(50),
@codigo_p varchar(10),
@telefono int

AS
BEGIN
 INSERT INTO escuelaE (campus, codigo_p, telefono)
  VALUES ('TecMilenio ' + @campus, @codigo_p, @telefono)
 SELECT
  *
 FROM escuelaE

END

 EXECUTE AltaCampus @campus = 'Guadalajara',
                    @codigo_p = '1234',
                    @telefono = 12345
 DROP PROCEDURE AltaCampus

 --======================================================================================
 CREATE PROCEDURE AltaProfesor @id_materia int
 AS
 BEGIN
  INSERT INTO profesorE (id_materia)
   VALUES (@id_materia)
  SELECT
   *
  FROM profesorE
 END
  EXECUTE AltaProfesor @id_materia = 4
  DROP PROCEDURE AltaProfesor

  SELECT
   *
  FROM profesorE
  TRUNCATE TABLE profesorE
  --======================================================================================

  CREATE PROCEDURE AltaAlumno @id_materia int
  AS
  BEGIN
   INSERT INTO alumnoE (id_materia)
    VALUES (@id_materia)
   SELECT
    *
   FROM alumnoE
  END
   EXECUTE AltaAlumno @id_materia = 3
   --======================================================================================
   /*
   create procedure CargaMaterias
   @id_alumno int,
   @id_materia int
   as
   begin
   	insert into alumnoE (id_alumno, id_materia) values (@id_alumno, @id_materia) 
   	select * from alumnoE
   end
   execute CargaMaterias @id_alumno=1 , @id_materia=1 
   */
   --======================================================================================
   SELECT
    *
   FROM CreditoE
   TRUNCATE TABLE CreditoE

   CREATE PROCEDURE AltaCredito @id_alumno int,
   @id_escuela int,
   @deuda int
   AS
   BEGIN
    IF EXISTS (SELECT
      id_alumno
     FROM creditoE WITH (NOLOCK)
     WHERE id_alumno = @id_alumno)
    BEGIN
     SELECT
      'Credito ya creado'
    END
    ELSE
    BEGIN
     INSERT INTO CreditoE (id_alumno, id_escuela, fecha_credito, deuda)
      VALUES (@id_alumno, @id_escuela, GETDATE(), @deuda)
     SELECT
      *
     FROM CreditoE
     ORDER BY id_credito DESC
    END
   END
    EXECUTE AltaCredito @id_alumno = 1,
                        @id_escuela = 2,
                        @deuda = 70000

    --======================================================================================

    CREATE PROCEDURE AltaMateria @asignatura varchar(30),
    @id_profesor int,
    @id_escuela int
    AS
    BEGIN
     INSERT INTO materiaE (asignatura, id_profesor, id_escuela)
      VALUES (@asignatura, @id_profesor, @id_escuela)
     SELECT
      *
     FROM materiaE
    END
     EXECUTE AltaMateria @asignatura = 'Base de datos ',
                         @id_profesor = 3,
                         @id_escuela = 2

     --======================================================================================

     CREATE PROCEDURE DatosAlumno @nombre varchar(30),
     @apellidoP varchar(30),
     @apellidoM varchar(30),
     @telefono int,
     @edad int,
     @fecha_nac date,
     @sexo varchar(1),
     --@actividad varchar(30),
     @id_alumno int
     AS
     BEGIN

      IF EXISTS (SELECT
        id_alumno
       FROM datosPersonaE WITH (NOLOCK)
       WHERE id_alumno = @id_alumno)
      BEGIN
       SELECT
        'Alumno ya creado'
      END
      ELSE
      BEGIN

       INSERT INTO datosPersonaE (nombre, apellidoP, apellidoM, telefono, edad, fecha_nac, sexo, actividad, id_alumno)
        VALUES (@nombre, @apellidoP, @apellidoM, @telefono, @edad, @fecha_nac, @sexo, 'Alumno', @id_alumno)
       SELECT
        nombre,
        apellidoP,
        apellidoM,
        telefono,
        edad,
        fecha_nac,
        sexo,
        actividad,
        id_alumno
       FROM datosPersonaE
       WHERE actividad = 'Alumno'
      END
     END
      EXECUTE DatosAlumno @nombre = 'Edgar',
                          @apellidoP = 'Guerrero',
                          @apellidoM = 'x',
                          @telefono = 123,
                          @edad = 25,
                          @fecha_nac = '02-17-1994',
                          @sexo = 'h',
                          @id_alumno = 1
      DROP PROCEDURE DatosAlumno

      --======================================================================================

      CREATE PROCEDURE DatosProfesor @nombre varchar(30),
      @apellidoP varchar(30),
      @apellidoM varchar(30),
      @telefono int,
      @edad int,
      @fecha_nac date,
      @sexo varchar(1),
      --@actividad varchar(30),
      @id_profesor int
      AS
      BEGIN

       IF EXISTS (SELECT
         id_alumno
        FROM datosPersonaE WITH (NOLOCK)
        WHERE id_profesor = @id_profesor)
       BEGIN
        SELECT
         'Profesor ya creado'
       END
       ELSE
       BEGIN

        INSERT INTO datosPersonaE (nombre, apellidoP, apellidoM, telefono, edad, fecha_nac, sexo, actividad, id_profesor)
         VALUES (@nombre, @apellidoP, @apellidoM, @telefono, @edad, @fecha_nac, @sexo, 'Profesor', @id_profesor)
        SELECT
         nombre,
         apellidoP,
         apellidoM,
         telefono,
         edad,
         fecha_nac,
         sexo,
         actividad,
         id_profesor
        FROM datosPersonaE
        WHERE actividad = 'Profesor'

       END
      END

       EXECUTE DatosProfesor @nombre = 'Miguel',
                             @apellidoP = 'Kelly',
                             @apellidoM = 'x',
                             @telefono = 123,
                             @edad = 123,
                             @fecha_nac = '02-17-1981',
                             @sexo = 'h',
                             @id_profesor = 1
       DROP PROCEDURE DatosProfesor

       --======================================================================================
       -- Creacion de estacionamientos acorde a cada escuela
       INSERT INTO estacionamientoE (id_estacionamiento, id_escuela)
        VALUES (1, 3)
       -- ingreso primera vez de alumnos 
       INSERT INTO estacionamientoE (id_alumno, id_estacionamiento, id_escuela, estatus, fecha)
        VALUES (1, 2, 1, 'Dentro', GETDATE())
       --salida de alumnos 
       UPDATE estacionamientoE
       SET estatus = 'Fuera',
           fecha = GETDATE()
       WHERE id_alumno = 2

	    --======================================================================================
       -- Creacion de estacionamientos acorde a cada escuela
       INSERT INTO estacionamientoE (id_estacionamiento, id_escuela)
        VALUES (1, 3)
       -- ingreso primera vez de profesor 
       INSERT INTO estacionamientoE (id_profesor, id_estacionamiento, id_escuela, estatus, fecha)
        VALUES (1, 2, 1, 'Dentro', GETDATE())
       --salida de profesor 
       UPDATE estacionamientoE
       SET estatus = 'Fuera',
           fecha = GETDATE()
       WHERE id_profesor = 2
       --======================================================================================
       --creamos un SP para administrar las entradas y salidas del Alumno
       --si esta fuera y entra mostrara dentro
       --si esta  dentro y sale mostrara fuera
       --si es la primera vez que entra al registro del estacionamiento se crea y mostrara estatus dentro
       CREATE PROCEDURE AlumnosEstacionamiento @id_estacionamiento int,
       @id_alumno int,
       @id_escuela int
       AS
       BEGIN
        IF EXISTS (SELECT
          id_alumno
         FROM estacionamientoE WITH (NOLOCK)
         WHERE id_alumno = @id_alumno
         AND estatus = 'Fuera')
        BEGIN

         UPDATE estacionamientoE
         SET estatus = 'Dentro',
             fecha = GETDATE()
         WHERE id_alumno = @id_alumno
        END
        ELSE
        BEGIN
         IF EXISTS (SELECT
           id_alumno
          FROM estacionamientoE WITH (NOLOCK)
          WHERE id_alumno = @id_alumno
          AND estatus = 'Dentro')
          UPDATE estacionamientoE
          SET estatus = 'Fuera',
              fecha = GETDATE()
          WHERE id_alumno = @id_alumno
        END
        BEGIN
         IF NOT EXISTS (SELECT
           id_alumno
          FROM estacionamientoE WITH (NOLOCK)
          WHERE id_alumno = @id_alumno)
          INSERT INTO estacionamientoE (id_alumno, id_estacionamiento, id_escuela, estatus, fecha)
           VALUES (@id_alumno, @id_estacionamiento, @id_escuela, 'Dentro', GETDATE())
        END
       END

        EXECUTE AlumnosEstacionamiento @id_estacionamiento = 1,
                                       @id_alumno = 4,
                                       @id_escuela = 1
        SELECT
         *
        FROM estacionamientoE
        DROP PROCEDURE AlumnosEstacionamiento
       --======================================================================================