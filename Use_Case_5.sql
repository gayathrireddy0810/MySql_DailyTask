CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_number VARCHAR(15) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,

    biological_sex ENUM(
        'FEMALE',
        'MALE',
        'INTERSEX',
        'NOT_DISCLOSED'
    ) NOT NULL,

    blood_group ENUM(
        'A+',
        'A-',
        'B+',
        'B-',
        'AB+',
        'AB-',
        'O+',
        'O-'
    ) NULL,

    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NULL,
    emergency_contact_name VARCHAR(50) NOT NULL,
    emergency_contact_phone VARCHAR(20) NOT NULL,
    allergies VARCHAR(120) NULL,

    patient_status ENUM(
        'ACTIVE',
        'INACTIVE',
        'DECEASED'
    ) NOT NULL DEFAULT 'ACTIVE',

    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC patients;
INSERT INTO patients
(
    patient_number,
    first_name,
    last_name,
    date_of_birth,
    biological_sex,
    blood_group,
    phone,
    email,
    emergency_contact_name,
    emergency_contact_phone,
    allergies
)
VALUES
(
    'PAT001',
    'Ananya',
    'Sharma',
    '1998-06-15',
    'FEMALE',
    'A+',
    '9000000001',
    'ananya@example.com',
    'Rajesh Sharma',
    '9000000011',
    'Penicillin'
);
SELECT * FROM patients;
INSERT INTO patients
(
    patient_number,
    first_name,
    last_name,
    date_of_birth,
    biological_sex,
    blood_group,
    phone,
    emergency_contact_name,
    emergency_contact_phone
)
VALUES
(
    'PAT002',
    'Rahul',
    'Verma',
    '1995-03-20',
    'MALE',
    'C+',
    '9000000002',
    'Suresh Verma',
    '9000000012'
);
INSERT INTO patients
(
    patient_number,
    first_name,
    last_name,
    date_of_birth,
    biological_sex,
    blood_group,
    phone,
    emergency_contact_name,
    emergency_contact_phone
)
VALUES
(
    'PAT003',
    'Priya',
    'Reddy',
    '2000-11-10',
    'FEMALE',
    'O-',
    '9000000003',
    'Kiran Reddy',
    '9000000013'
);