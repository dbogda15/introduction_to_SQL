CREATE DATABASE skypro;
\c skypro
CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Diana', 'Bogdanova', 'female', 28);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Karina', 'Karimova', 'female', 23);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'female', 18);

SELECT * FROM employee;

UPDATE employee SET (first_name, last_name, gender, age) = ('Albert', 'Zainullin', 'male', 30) WHERE id = 3;

SELECT * FROM employee;

DELETE FROM employee WHERE id = 2;

SELECT * FROM employee;

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Igor', 'Stepanov', 'male', 33);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Timur', 'Lukmanov', 'male', 31);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Alina', 'Ramazanova', 'female', 29);

SELECT first_name AS Имя,
       last_name AS Фамилия
FROM employee;

SELECT * FROM employee
WHERE age < 30 OR age > 50;

SELECT * FROM employee
WHERE age BETWEEN 30 AND 50;

SELECT * FROM employee
ORDER BY last_name DESC;

SELECT * FROM employee
WHERE first_name LIKE '____%';

UPDATE employee SET first_name = 'Diana'
                WHERE id = 6;

UPDATE employee SET first_name = 'Timur'
                WHERE id = 3;

SELECT first_name AS Имя,
       SUM(age) AS суммарный_возраст
FROM employee GROUP BY Имя;

SELECT first_name AS Имя,
       age AS Возраст
FROM employee
WHERE age = (
    SELECT MIN(age)
    FROM employee);

SELECT first_name AS Имя,
       MAX(age) AS Максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY MAX(age);