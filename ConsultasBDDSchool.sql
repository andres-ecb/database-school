use school;

-- Consultas & Subconsultas, database «school»

/*
1) Mostrar el nombre, apellido y fecha de nacimiento de todos los estudiantes de género masculino
cuyos nacimientos se encuentren entre el 1 de junio de 2004 y el 1 de diciembre de 2005.
Realizar dos consultas: una incluyendo los límites del rango de fechas y otra excluyéndolos.
*/
-- Consulta que incluye los límites:
SELECT 
    first_name AS nombre, 
    last_name AS apellido, 
    birth_date AS fecha_nacimiento
FROM 
    students
WHERE 
    gender = 'M' 
    AND birth_date BETWEEN '2004-06-01' AND '2005-12-01'
ORDER BY birth_date;

-- Consulta que los excluye:
SELECT 
    first_name AS nombre, 
    last_name AS apellido, 
    birth_date AS fecha_nacimiento
FROM 
    students
WHERE 
    gender = 'M'
    AND birth_date > '2004-06-01' 
    AND birth_date < '2005-12-01'
ORDER BY birth_date;


/*
2) Obtener el nombre y apellido de los estudiantes cuyo nombre
inicie con «C» o «M»; ordenar filas por nombre.
*/
SELECT 
    first_name AS nombre, 
    last_name AS apellido
FROM 
    students
WHERE 
    LEFT(first_name, 1) IN ('C', 'M')
ORDER BY 
    first_name;


/*
3) Obtener el nombre, apellido, género y estatura de los cinco estudiantes más bajos, y
ordenarlos de menor a mayor.
*/
SELECT 
    first_name AS nombre, 
    last_name AS apellido, 
    gender AS género, 
    height AS estatura
FROM 
    students
ORDER BY 
    height
LIMIT 5;



/*
4) Obtener una cadena concatenada que incluya el nombre, apellido y ciudad de origen de cada estudiante.
Ordenar los resultados alfabéticamente por el apellido y el nombre.
*/
SELECT 
    CONCAT(st.first_name, ' ', st.last_name, ' (de ', ci.city_name, ')') AS full_name_plus_city_of_origin
FROM 
    students st
JOIN 
    cities ci ON st.city_id = ci.id
ORDER BY 
    st.last_name, st.first_name;


/*
5) Obtener el nombre, apellido, asignatura y todas las notas de aquellos estudiantes 
cuyo nombre termine en la letra «a» y cuyo apellido tenga la letra «o» en la segunda posición.
*/
SELECT 
    st.first_name, 
    st.last_name, 
    su.subject_name, 
    gr.final_grade
FROM 
    grades gr
JOIN 
    students st ON gr.student_id = st.id
JOIN 
    subjects su ON gr.subject_id = su.id
WHERE 
    st.first_name LIKE '%a' 
    AND st.last_name LIKE '_o%';
    

/*
6) Generar una contraseña de doce caracteres por estudiante. Debe estar compuesta por
los cuatro primeros caracteres del apellido, los caracteres «0,», los cinco
últimos caracteres del nombre, y el caracter «1».
Posteriormente, reemplazar espacios en blanco por el caracter «9».
*/
SELECT 
    REPLACE(
        CONCAT(
            LEFT(last_name, 4), '0,', 
            RIGHT(first_name, 5), '1'
        ),
        ' ', '9'
    ) AS student_password
FROM 
    students;


/*
7) Mostrar nombre, apellido, ciudad de origen, fecha de nacimiento y edad de 
todos los estudiantes. La edad se calcula dinámicamente a partir de la fecha de nacimiento.
*/
SELECT 
    st.first_name, 
    st.last_name, 
    ci.city_name AS c_of_origin, 
    st.birth_date,
    TIMESTAMPDIFF(YEAR, st.birth_date, CURDATE()) AS age
FROM 
    students st
LEFT JOIN 
    cities ci ON st.city_id = ci.id;


/*
8) Obtener el nombre, apellido, estatura y ciudad de origen de los estudiantes
cuya estatura esté fuera del rango 170cm-182cm, y que no sean de Riohacha o Tunja.
*/
SELECT 
    st.first_name, 
    st.last_name, 
    st.height, 
    ci.city_name
FROM 
    students st
JOIN 
    cities ci ON st.city_id = ci.id
WHERE 
    st.height NOT BETWEEN 170 AND 182
    AND ci.city_name NOT IN ('Riohacha', 'Tunja');


/*
9) Obtener el id, nombre, apellido y la nota final en la asignatura de Inglés
de los estudiantes cuyo nombre tenga 6 o menos caracteres
*/
SELECT 
    st.id, 
    st.first_name, 
    st.last_name, 
    gr.final_grade
FROM 
    students st
JOIN 
    grades gr ON st.id = gr.student_id
JOIN 
    subjects sub ON gr.subject_id = sub.id
WHERE 
    sub.subject_name = 'Inglés'
    AND LENGTH(st.first_name) <= 6;


/*
10) Obtener la cantidad de estudiantes de género femenino cuya estatura sea superior a 175cm.
*/
SELECT 
	count(*) 
FROM students 
WHERE 
	gender = 'F' 
    AND height > 175;


/*
11) Obtener los registros de todos los estudiantes nacidos en los años 1999 o 2000
y cuyas fechas de nacimiento corresponden a noviembre o diciembre.
*/
SELECT * 
FROM 
    students 
WHERE 
    YEAR(birth_date) IN (1999, 2000)
    AND MONTH(birth_date) IN (11, 12);
    

/*
12) Obtener la cantidad de estudiantes por género, 
excluyendo valores nulos, y ordenar el resultado de mayor a menor.
*/
SELECT 
    gender, 
    COUNT(*) AS n_of_students
FROM 
    students
WHERE 
    gender IS NOT NULL
GROUP BY 
    gender
ORDER BY 
    n_of_students DESC;


/*
13) Obtener las ciudades de origen que tengan más de cinco estudiantes,
ordenadas por el número de estudiantes en orden descendente y, en caso de empate,
por el nombre de la ciudad en orden alfabético.
*/
SELECT 
    ci.city_name AS city_of_origin, 
    COUNT(*) AS number_of_students
FROM 
    cities ci
JOIN 
    students st ON ci.id = st.city_id
GROUP BY 
    ci.city_name
HAVING 
    COUNT(*) > 5
ORDER BY 
    number_of_students DESC, 
    city_of_origin ASC;
    

/*
14) Obtener el nombre, apellido, género y estatura de los estudiantes cuya estatura sea mayor 
al promedio de la estatura de todos los estudiantes, ordenando de mayor a menor estatura.
*/
SELECT 
    first_name, 
    last_name, 
    gender, 
    height
FROM 
    students
WHERE 
    height > (SELECT AVG(height) FROM students)
ORDER BY 
    height DESC;


/*
15) Obtener el nombre y apellido de los estudiantes que no tienen nota final
en la asignatura de Cálculo Integral
*/
SELECT 
    st.first_name, 
    st.last_name
FROM 
    students st
JOIN 
    grades gr ON st.id = gr.student_id
JOIN 
    subjects sub ON gr.subject_id = sub.id
WHERE 
    sub.subject_name = 'Cálculo Integral'
    AND gr.final_grade IS NULL;


/*
16) Obtener cada nombre de estudiante que aparece más de una vez en la tabla, 
indicando su número de ocurrencias.
*/
SELECT 
    first_name,  
    COUNT(*) AS n_of_occurrences
FROM 
    students
GROUP BY 
    first_name
HAVING 
    COUNT(*) > 1
ORDER BY 
    n_of_occurrences DESC;

/*
17) Obtener cada apellido de estudiante que aparece solo una vez en la tabla.
*/
SELECT 
	last_name
FROM students
GROUP BY 
	last_name
HAVING 
	COUNT(*) = 1
ORDER BY last_name;


/*
18) Obtener la cantidad de estudiantes por asignatura que califican para 
el cuadro de honor, considerando aquellas notas finales mayores o iguales a «4.2».
*/
SELECT 
    sub.subject_name, 
    COUNT(*) AS honored_count
FROM 
    grades gr
JOIN 
    subjects sub ON gr.subject_id = sub.id
WHERE 
    gr.final_grade >= 4.2
GROUP BY 
    sub.subject_name
ORDER BY 
    count(*) DESC;


/*
19) Obtener la cantidad de estudiantes reprobados por asignatura, considerando las notas 
finales con valores nulos como reprobatorias. La nota mínima para aprobar es «3.0».
*/
SELECT 
    sub.subject_name, 
    COUNT(CASE 
            WHEN gr.final_grade < 3.0 OR gr.final_grade IS NULL 
            THEN 1 
          END) AS failed_count
FROM 
    grades gr
JOIN 
    subjects sub ON gr.subject_id = sub.id
GROUP BY 
    sub.subject_name
ORDER BY 
    failed_count DESC;


/*
20) Obtener el promedio de todas las notas finales de la asignatura Física Mecánica,
redondeando la cifra a dos cifras decimales
*/
SELECT 
    ROUND(AVG(final_grade), 2)
FROM 
    grades gr
JOIN 
    subjects su ON gr.subject_id = su.id
WHERE 
    su.subject_name = 'Física Mecánica';

        
/*
21) Obtener el nombre, apellido, nombre de la asignatura y nota final de los estudiantes
cuya nota final es menor o igual a 2.5, o que estén sin calificación
*/
SELECT 
    st.first_name, 
    st.last_name, 
    su.subject_name, 
    gr.final_grade
FROM 
    students st
JOIN 
    grades gr ON st.id = gr.student_id
JOIN 
    subjects su ON gr.subject_id = su.id
WHERE 
    gr.final_grade <= 2.5 
    OR gr.final_grade IS NULL
ORDER BY 
    st.last_name, st.first_name;


/*
22) Obtener el nombre, apellido y el estado de aprobación de los estudiantes 
en la asignatura Bases de Datos, considerando que la nota mínima de aprobación 
es 3.0, clasificando a los estudiantes como aprobados, reprobados o sin calificación 
cuando la nota final sea nula.
*/
SELECT 
    st.first_name, 
    st.last_name,
    CASE 
        WHEN gr.final_grade >= 3.0 THEN 'Aprobado'
        WHEN gr.final_grade < 3.0 THEN 'Reprobado'
        ELSE 'Sin calificación'
    END AS approval_status
FROM 
    students st
JOIN 
    grades gr ON st.id = gr.student_id
JOIN 
    subjects su ON gr.subject_id = su.id
WHERE 
    su.subject_name = 'Bases de Datos';


/*
23) Obtener el nombre, apellido, y la nota final en la asignatura de Inglés de cada
estudiante, así una columna adicional donde se indique si la nota es mayor o menor al 
promedio de todas las notas de la asignatura, o que se indique la falta de calificación
si la nota es nula.
*/
SELECT 
    st.first_name,
    st.last_name,
    gr.final_grade,
    CASE 
        WHEN gr.final_grade IS NULL THEN 'Sin calificación'
        WHEN gr.final_grade > (
            SELECT AVG(final_grade)
            FROM grades gr2
            JOIN subjects su 
                ON gr2.subject_id = su.id
            WHERE su.subject_name = 'Inglés'
        ) THEN 'Mayor que el promedio'
        WHEN gr.final_grade < (
            SELECT AVG(final_grade)
            FROM grades gr2
            JOIN subjects su 
                ON gr2.subject_id = su.id
            WHERE su.subject_name = 'Inglés'
        ) THEN 'Menor que el promedio'
    END AS estado_promedio
FROM 
    students st
JOIN 
    grades gr ON st.id = gr.student_id
JOIN 
    subjects su ON gr.subject_id = su.id
WHERE 
    su.subject_name = 'Inglés';


/*
24) Obtener el nombre, apellido y estatus de los estudiantes cuyos campos de estatura, 
género o ciudad de origen estén desiertos.
*/
SELECT 
    first_name, 
    last_name, 
    CASE 
        WHEN height IS NULL THEN 'Sin estatura' 
        WHEN gender IS NULL THEN 'Sin género' 
        WHEN city_id IS NULL THEN 'Sin ciudad de origen' 
    END AS status_h_g_and_c
FROM 
    students
WHERE 
    gender IS NULL 
    OR height IS NULL 
    OR city_id IS NULL;


/*
25) Obtener las asignaturas sin notas finales registradas.
*/
SELECT su.*
FROM 
	subjects su
WHERE NOT EXISTS(
	SELECT 1
    FROM 
		grades gr
    WHERE 
		gr.subject_id = su.id
)
ORDER BY su.subject_name;

/*
26) Obtener las ciudades de origen que registran estudiantes.
*/
SELECT ci.*
FROM 
	cities ci
WHERE EXISTS (
	SELECT 1
    FROM 
		students st
    WHERE 
		st.city_id = ci.id
) 
ORDER BY ci.city_name;

/*
27) Obtener el nombre, apellido y nota final del estudiante con la nota final más baja,
hacerlo por cada asignatura, excluyendo las notas nulas.
*/
SELECT su.subject_name, st.first_name, st.last_name, gr.final_grade AS lowest_grade
FROM 
	students st
JOIN 
	grades gr ON st.id = gr.student_id
JOIN 
	subjects su ON gr.subject_id = su.id
WHERE 
	gr.final_grade = (
    SELECT 
		MIN(final_grade)
    FROM 
		grades
    WHERE 
		subject_id = su.id
)
ORDER BY su.subject_name;

/*
28) Obtener el nombre, apellido, estatura y nota final de la asignatura de Programación Orientada a Objetos
de todos los estudiantes con estaturas menores al promedio y notas de la asignatura antes mencionada superior 
al promedio de notas de dicha asignatura.
*/
SELECT 
	s.first_name, s.last_name, s.height, g.final_grade
FROM 
	students s
JOIN 
	grades g ON s.id = g.student_id
WHERE 
	s.height < (SELECT AVG(height) FROM students)
	AND g.subject_id = (SELECT id FROM subjects WHERE subject_name = 'Programación Orientada a Objetos')
	AND g.final_grade > (SELECT AVG(final_grade) FROM grades WHERE subject_id = (SELECT id FROM subjects WHERE subject_name = 'Programación Orientada a Objetos'));
            

