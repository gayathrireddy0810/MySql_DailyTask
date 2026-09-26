CREATE DATABASE cdg_hyd_jfs_058;

USE cdg_hyd_jfs_058;

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_joining DATE
);

SELECT * FROM employees;

INSERT INTO employees (employee_id, first_name, last_name, date_of_joining) VALUES (101, 'Chetan', 'Sharma', '2026-01-01');

INSERT INTO employees VALUES (102, 'Akshat', 'Kumar', '2026-02-01');

INSERT INTO employees (first_name, last_name) VALUES ('Bharat', 'Sharma');

INSERT INTO employees (employee_id, first_name, last_name, date_of_joining)
VALUES
    (104, 'Neha', 'Gupta', '2026-02-16'),
    (105, 'Ravi', 'Verma', '2026-03-01'),
    (106, 'Ashish', 'Bakshi', '2026-04-05');