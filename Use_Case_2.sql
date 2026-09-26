USE cdg_hyd_jfs_058;

CREATE TABLE students (
    student_id INT NOT NULL AUTO_INCREMENT,
    admission_number VARCHAR(15) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    admission_date DATE NOT NULL,
    cgpa DECIMAL(4, 2) NOT NULL,
    student_status VARCHAR(15) NOT NULL DEFAULT 'Active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `pk_students_student_id` PRIMARY KEY (student_id),
    CONSTRAINT `uq_admission_number` UNIQUE (admission_number),
    CONSTRAINT `uq_email` UNIQUE (email),
    CONSTRAINT `chk_cgpa_range_between_0_00_and_10.00` CHECK (cgpa BETWEEN 0.00 AND 10.00)
);

ALTER TABLE students AUTO_INCREMENT = 101;

DROP TABLE students;

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, program_name, admission_date, cgpa) 
VALUES ('ST1234', 'Akshat', 'Kumar', 'akshat3@gmail.com', '9988776655', '2010-12-31', 'BTECH', '2026-08-31', 9.72);

INSERT INTO students (admission_number, first_name, last_name, email, phone, date_of_birth, program_name, admission_date, cgpa) 
VALUES ('ST4444', 'Neha', 'Gupta', 'neha@gmail.com', '9988998899', '2010-12-31', 'BTECH', '2026-08-31', 9.72);

SELECT * FROM students;
