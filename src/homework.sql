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

CREATE TABLE city (
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(20) NOT NULL
);

ALTER TABLE employee
ADD city_id INT;

ALTER TABLE employee
ADD FOREIGN KEY (city_id)  REFERENCES city (city_id);

INSERT INTO city (city_name)
VALUES ('Moscow'), ('Ufa'), ('Kazan'), ('Sochi'), ('Saratov'), ('Samara');

UPDATE employee SET city_id = 6 WHERE id = 1;
UPDATE employee SET city_id = 5 WHERE id = 3;
UPDATE employee SET city_id = 4 WHERE id = 4;
UPDATE employee SET city_id = 3 WHERE id = 5;
UPDATE employee SET city_id = 2 WHERE id = 6;

SELECT first_name, last_name, city_name
FROM city
INNER JOIN employee
ON city.city_id = employee.city_id;

SELECT first_name, last_name, city_name
FROM city
LEFT JOIN employee
ON city.city_id = employee.city_id;

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Alena', 'Petrova', 'female', 50);

SELECT first_name, last_name, city_name
FROM city
FULL JOIN employee
ON city.city_id = employee.city_id;

SELECT first_name, city_name
FROM city
CROSS JOIN employee;