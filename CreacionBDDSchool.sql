SHOW DATABASES;
DROP DATABASE IF EXISTS school;
CREATE DATABASE IF NOT EXISTS school;

USE school;


CREATE TABLE cities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(60) UNIQUE
);
-- Registros tabla 'cities'
INSERT INTO cities (city_name) VALUES ('Riohacha');
INSERT INTO cities (city_name) VALUES ('Maicao');
INSERT INTO cities (city_name) VALUES ('Uribia');
INSERT INTO cities (city_name) VALUES ('Tunja');
INSERT INTO cities (city_name) VALUES ('Duitama');
INSERT INTO cities (city_name) VALUES ('Guateque');


CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(60) UNIQUE 
);
-- Registros tabla 'subjects'
INSERT INTO subjects (subject_name) VALUES ('Cálculo Integral');
INSERT INTO subjects (subject_name) VALUES ('Física Mecánica');
INSERT INTO subjects (subject_name) VALUES ('Bases de Datos');
INSERT INTO subjects (subject_name) VALUES ('Programación Orientada a Objetos');
INSERT INTO subjects (subject_name) VALUES ('Álgebra Lineal');
INSERT INTO subjects (subject_name) VALUES ('Inglés');


CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    birth_date DATE NOT NULL,         
    gender VARCHAR(20),  
    height INT,                           
    city_id INT,                       
    FOREIGN KEY (city_id) REFERENCES cities(id) 
);
-- Registros tabla 'students'
INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Rodrigo', 'Freyle', '2003-02-21', 'M', 181, 2);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Calixto', 'Rojas', '2003-09-11', 'M', 184, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Idalia', 'Benjumea', '1999-11-19', 'F', 170, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Francisco', 'Ruano', '2004-08-17', 'M', 190, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Hortensia', 'López', '2000-12-23', 'F', 181, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Diego', 'Valdeblánquez', '2002-10-30', 'M', 193, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Sixta', 'Moscote', '2004-02-29', 'F', 167, 2);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Reina', 'Sastoque', '1999-05-01', 'F', 175, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Ricardo', 'Rojas', '2006-01-22', 'M', 179, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Mónica', 'Jara', '2005-03-12', 'F', 171, 5);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Tomás', 'Amaya', '2003-12-11', 'M', 181, 5);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Berta', 'Iguarán', '2006-07-09', 'F', 177, 2);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Gabriel', 'Meza', '2001-11-16', 'M', 169, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Mireya', 'Ipuana', '2003-01-27', 'F', 166, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Úrsula', 'Freyle', '2004-10-10', 'F', 172, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Fernanda', 'Campos', '2004-04-19', 'F', 170, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Gabriel', 'Coronado', '2004-09-21', 'M', 185, 1);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Camilo', 'Gamboa', '2005-03-02', 'M', 186, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Mónica', 'del Prado', '2001-06-28', 'F', 169, 2);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Diego', 'Neuta', '2005-12-01', 'M', 184, 5);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Francisco', 'Huertas', '1999-09-26', 'M', 178, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height, city_id)
VALUES ('Gabriel', 'López', '2000-12-31', 'M', 168, 4);

-- Registros adicionales con valores faltantes
INSERT INTO students (first_name, last_name, birth_date, height, city_id)
VALUES ('Alejandro', 'Romero', '2004-10-31', 173, 4);

INSERT INTO students (first_name, last_name, birth_date, gender, height)
VALUES ('Camelia', 'Moya', '1998-06-23', 'F', 169);

INSERT INTO students (first_name, last_name, birth_date, gender, height)
VALUES ('Damián', 'del Valle', '2004-06-01', 'M', 176);



CREATE TABLE grades (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    student_id INT,                     
    subject_id INT,                     
    final_grade DECIMAL(3,2),            
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id) 
);

-- Registros tabla 'grades' (para asignatura 1)
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (1, 1, 3.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (2, 1, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (3, 1, 3.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (4, 1, 3.20);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (5, 1, 2.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (6, 1, 2.40);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (7, 1, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (8, 1, 2.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (9, 1, 4.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (10, 1, 3.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (11, 1, 4.60);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (12, 1, 3.15);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (13, 1, 2.25);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (14, 1, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (15, 1, 3.95);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (16, 1, 2.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (17, 1, 2.90);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (18, 1, 4.20);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (19, 1, 3.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (20, 1, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (21, 1, 2.90);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (22, 1, 3.30);
-- Registros tabla 'grades' (para asignatura 2)
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (1, 2, 2.90);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (2, 2, 2.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (3, 2, 3.45);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (4, 2, 4.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (5, 2, 3.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (6, 2, 2.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (7, 2, 2.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (8, 2, 3.20);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (9, 2, 3.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (10, 2, 2.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (11, 2, 3.35);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (12, 2, 3.40);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (13, 2, 3.10);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (14, 2, 2.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (15, 2, 4.25);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (16, 2, 3.35);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (17, 2, 3.10);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (18, 2, 3.50);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (19, 2, 3.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (20, 2, 2.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (21, 2, 3.55);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (22, 2, 2.70);
-- Registros tabla 'grades' (para asignatura 3)
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (1, 3, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (2, 3, 3.15);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (3, 3, 3.95);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (4, 3, 3.50);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (5, 3, 3.15);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (6, 3, 3.20);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (7, 3, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (8, 3, 2.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (9, 3, 3.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (10, 3, 3.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (11, 3, 3.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (12, 3, 2.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (13, 3, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (14, 3, 3.10);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (15, 3, 3.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (16, 3, 3.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (17, 3, 2.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (18, 3, 3.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (19, 3, 3.35);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (20, 3, 3.55);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (21, 3, 3.45);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (22, 3, 2.90);
-- Registros tabla 'grades' (para asignatura 4)
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (1, 4, 3.10);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (2, 4, 2.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (3, 4, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (4, 4, 3.60);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (5, 4, 3.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (6, 4, 2.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (7, 4, 2.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (8, 4, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (9, 4, 3.95);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (10, 4, 2.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (11, 4, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (12, 4, 3.15);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (13, 4, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (14, 4, 2.45);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (15, 4, 3.30);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (16, 4, 3.50);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (17, 4, 3.55);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (18, 4, 3.40);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (19, 4, 2.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (20, 4, 2.90);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (21, 4, 2.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (22, 4, 3.00);
-- Registros tabla 'grades' (para asignatura 6)
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (1, 6, 3.25);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (2, 6, 3.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (3, 6, 4.20);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (4, 6, 2.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (5, 6, 2.65);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (6, 6, 3.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (7, 6, 3.15);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (8, 6, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (9, 6, 4.05);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (10, 6, 2.55);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (11, 6, 2.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (12, 6, 2.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (13, 6, 2.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (14, 6, 3.10);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (15, 6, 3.90);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (16, 6, 4.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (17, 6, 2.75);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (18, 6, 2.50);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (19, 6, 3.55);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (20, 6, 3.00);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (21, 6, 3.25);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (22, 6, 3.30);
-- Registros adicionales (algunos con valores nulos)
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (23, 1, NULL);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (23, 2, 3.16);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (23, 3, 2.70);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (23, 6, NULL);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (24, 3, 2.80);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (24, 6, 2.55);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (24, 1, NULL);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (25, 6, 3.25);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (25, 3, 3.85);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (25, 4, NULL);
INSERT INTO grades (student_id, subject_id, final_grade) VALUES (25, 2, 2.65);
