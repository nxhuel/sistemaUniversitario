# Base de Datos MySQL - sistemaUniversitario

# Introducción

La base de datos está diseñada para gestionar información detallada sobre los estudiantes, los docentes, las asignaturas que se imparten, los horarios de las clases, y los periodos académicos.

# Descripción General
Cada carrera está compuesta por varias materias, y cada materia tiene un conjunto de alumnos matriculados. La base de datos también almacena información sobre las notas de los alumnos en cada materia y permite realizar análisis sobre el rendimiento académico tanto a nivel de alumno como de asignatura.

Un profesor puede impartir varias materias, y una materia puede ser impartida por diferentes profesores. Además, la información sobre los contratos de los profesores y los horarios de las clases también se gestiona en esta base de datos.

# Estructura de la Base de Datos
#### Entidades Principales
Alumno: Información detallada de cada alumno, incluyendo su nombre, apellido, DNI, email, teléfono, fecha de inscripción, etc.
Docente: Información de los profesores, como nombre, apellidos, email, especialización, etc.
Materia: Información sobre las asignaturas, como nombre, código, plan de estudio, y los profesores que las imparten.
Carrera: Información sobre las diferentes carreras ofrecidas, incluyendo el nombre, fecha de integración, y duración.
Calificaciones: Notas de los alumnos en cada materia.
Horario: Información sobre los horarios de las materias, incluyendo la hora de inicio y fin.
Periodo: Información sobre los periodos académicos.
#### Relación entre las Entidades
El diagrama de tablas muestra cómo se relacionan estas entidades, permitiendo consultas complejas para obtener información significativa para la gestión académica.

#### Pasos para el Diseño de la Base de Datos
Diseño Conceptual
Definir las entidades, sus atributos y las relaciones entre ellas para estructurar la base de datos de manera eficiente y clara.

#### Diagrama de Tablas
Crear un modelo relacional que define la estructura de las tablas, relaciones y restricciones.

#### Creación de la Base de Datos y las Tablas
Mediante código SQL, se crea toda la estructura de la base de datos definida en los pasos anteriores. Los datos pueden ser cargados manualmente o mediante scripts SQL.

#### Consultas SQL
Se desarrollan diversas consultas SQL para obtener información relevante y realizar análisis sobre la base de datos.
