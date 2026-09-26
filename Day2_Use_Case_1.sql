CREATE DATABASE IF NOT EXISTS cdg_hyd_jfs_058;
USE cdg_hyd_jfs_058;

CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    admission_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE NOT NULL,
    programme VARCHAR(100) NOT NULL,
    admission_date DATE NOT NULL,
    cgpa DECIMAL(4,2) CHECK (cgpa BETWEEN 0 AND 10),
    status VARCHAR(20) CHECK (status IN ('ACTIVE','SUSPENDED','DROPPED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES ('STU26C001', 'Ananya', 'Rao', 'ananya.rao@example.test', '9876501001', '2007-04-18', 'BSc Computer Science', '2026-07-01', 8.40, 'ACTIVE');

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES ('STU26C002', 'Vivaan', 'Sharma', 'vivaan.sharma@example.test', NULL, '2006-12-09', 'BCom', '2026-07-01', 7.75, 'ACTIVE');

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES
('STU26C003', 'Diya', 'Nair', 'diya.nair@example.test', '9876501003', '2007-02-25', 'BA Economics', '2026-07-02', 9.10, 'ACTIVE'),
('STU25C004', 'Kabir', 'Singh', 'kabir.singh@example.test', '9876501004', '2006-08-14', 'BSc Mathematics', '2025-07-01', 6.85, 'SUSPENDED'),
('STU24C005', 'Tara', 'Bose', 'tara.bose@example.test', '9876501005', '2005-09-30', 'BA History', '2024-07-01', 5.90, 'DROPPED');

SELECT * FROM students;

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES ('STU26C006', 'Rahul', 'Kumar', 'ananya.rao@example.test', '9876501006', '2007-05-10', 'BCom', '2026-07-01', 7.50, 'ACTIVE');

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES ('STU26C007', 'Rahul', 'Kumar', 'rahul.kumar@example.test', '9876501007', '2007-05-10', 'BCom', '2026-07-01', 10.50, 'ACTIVE');

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES ('STU26C008', 'Neha', 'Reddy', 'neha.reddy@example.test', '9876501008', '2007-06-12', 'BCom', '2026-07-01', 8.00, 'TRANSFERRED');

UPDATE students SET cgpa = 8.65 WHERE admission_number = 'STU26C001';

UPDATE students SET cgpa = LEAST(cgpa + 0.20, 10.00) WHERE status = 'ACTIVE' AND programme = 'BSc Computer Science';

UPDATE students SET status = 'ACTIVE' WHERE admission_number = 'STU25C004';

UPDATE students SET programme = 'BCom Finance' WHERE programme = 'BCom';

UPDATE students SET email = 'ananya.rao@example.test' WHERE admission_number = 'STU26C003';

SELECT * FROM students WHERE status = 'DROPPED';

DELETE FROM students WHERE status = 'DROPPED';

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, programme, admission_date, cgpa, status)
VALUES ('STU-TEMP-001', 'Temporary', 'Student', 'temporary.student@example.test', '9876501099', '2007-01-01', 'BCom Finance', '2026-07-01', 7.00, 'ACTIVE');

SELECT * FROM students WHERE admission_number = 'STU-TEMP-001';

DELETE FROM students WHERE admission_number = 'STU-TEMP-001';

SELECT * FROM students ORDER BY student_id;