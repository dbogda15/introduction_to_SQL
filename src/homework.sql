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