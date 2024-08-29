-- CONSULTAS

-- Consulta 1: Número de alumnos, carácter de las asignaturas, y nota media, mínima y máxima de la nota media de las calificaciones, ordenado por carrera y después por nota media.

SELECT
    carrera.nombre AS Carrera,
    materia.nombre AS Materia,
    COUNT(calificaciones.id) AS Alumnos,
    ROUND(MIN(calificaciones.nota_final), 2) AS NotaMin,
    ROUND(MAX(calificaciones.nota_final), 2) AS NotaMax,
    ROUND(AVG(calificaciones.nota_final), 2) AS NotaMedia
FROM
    carrera
INNER JOIN
    materia ON carrera.id = materia.fk_materia_carrera_id
INNER JOIN
    calificaciones ON materia.id = calificaciones.fk_calificaciones_materia_id
GROUP BY
    carrera.nombre, materia.nombre
ORDER BY
    carrera.nombre ASC, NotaMedia DESC;

-- Consulta 2: Asignaturas con nota media inferior a 5.

SELECT
    materia.nombre AS Materia,
    carrera.nombre AS Carrera,
    ROUND(AVG(calificaciones.nota_final), 2) AS NotaMedia
FROM
    materia
INNER JOIN
    carrera ON carrera.id = materia.fk_materia_carrera_id
INNER JOIN
    calificaciones ON materia.id = calificaciones.fk_calificaciones_materia_id
GROUP BY
    materia.nombre, carrera.nombre
HAVING
    NotaMedia < 5.00
ORDER BY
    carrera.nombre ASC, materia.nombre ASC;

-- Consulta 3: Alumnos con una media superior a 8.00, ordenados por nota media descendente.

SELECT
    CONCAT(alumno.nombre, " ", alumno.apellido) AS Alumno,
    ROUND(AVG(calificaciones.nota_final), 2) AS NotaMedia
FROM
    alumno
INNER JOIN
    calificaciones ON alumno.id = calificaciones.fk_calificaciones_alumno_id
GROUP BY
    alumno.id
HAVING
    NotaMedia > 8.00
ORDER BY
    NotaMedia DESC;

-- Consulta 4: Asignaturas que no tienen ningún alumno matriculado.

SELECT
    materia.nombre AS Materia,
    COUNT(calificaciones.fk_calificaciones_alumno_id) AS Alumnos
FROM
    materia
LEFT JOIN
    calificaciones ON materia.id = calificaciones.fk_calificaciones_materia_id
GROUP BY
    materia.nombre
HAVING
    Alumnos = 0;

-- Consulta 5: Número de alumnos en un período específico que tienen que recuperar alguna asignatura, ordenados por número de alumnos suspensos de forma descendente.

SELECT
    materia.nombre AS Materia,
    COUNT(alumno.id) AS AlumnosSuspensos
FROM
    calificaciones
INNER JOIN
    alumno ON alumno.id = calificaciones.fk_calificaciones_alumno_id
INNER JOIN
    materia ON materia.id = calificaciones.fk_calificaciones_materia_id
WHERE
    calificaciones.nota_final < 5.00
GROUP BY
    materia.nombre
ORDER BY
    AlumnosSuspensos DESC;

-- Consulta 6: Alumnos que suspendieron una asignatura específica, incluyendo la nota con la que suspendieron.

SELECT
    CONCAT(alumno.nombre, " ", alumno.apellido) AS Alumno,
    calificaciones.nota_final AS Nota
FROM
    alumno
INNER JOIN
    calificaciones ON alumno.id = calificaciones.fk_calificaciones_alumno_id
INNER JOIN
    materia ON materia.id = calificaciones.fk_calificaciones_materia_id
WHERE
    calificaciones.nota_final < 5.00
    AND materia.nombre = "Matematicas Academicas"
ORDER BY
    calificaciones.nota_final DESC;

-- Consulta 7: Los 10 profesores con mayor nota media en las asignaturas que imparten.

SELECT
    docente.id AS DocenteID,
    CONCAT(docente.nombre, " ", docente.apellido) AS Profesor,
    ROUND(AVG(calificaciones.nota_final), 2) AS NotaMedia
FROM
    docente
LEFT JOIN
    materia ON docente.id = materia.fk_materia_docente_id
LEFT JOIN
    calificaciones ON materia.id = calificaciones.fk_calificaciones_materia_id
GROUP BY
    docente.id
ORDER BY
    NotaMedia DESC
LIMIT 10;

-- Consulta 8: Mejores alumnos en un período específico que han sacado un 10.

SELECT
    periodo.inicio AS Periodo,
    materia.nombre AS Materia,
    CONCAT(alumno.nombre, " ", alumno.apellido) AS Alumno,
    calificaciones.nota_final AS Nota
FROM
    calificaciones
INNER JOIN
    alumno ON alumno.id = calificaciones.fk_calificaciones_alumno_id
INNER JOIN
    materia ON materia.id = calificaciones.fk_calificaciones_materia_id
INNER JOIN
    periodo ON periodo.id = materia.fk_materia_periodo_id
WHERE
    calificaciones.nota_final = 10
ORDER BY
    materia.nombre ASC;





