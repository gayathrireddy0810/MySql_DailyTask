CREATE DATABASE retailer_db;

USE retailer_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_code VARCHAR(12) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    date_of_birth DATE,
    city VARCHAR(80) NOT NULL,
    state VARCHAR(80) NOT NULL,
    postal_code VARCHAR(12) NOT NULL,
    customer_type VARCHAR(15) NOT NULL DEFAULT 'REGULAR',
    credit_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_customer_type
        CHECK (
            customer_type IN ('REGULAR', 'PREMIUM', 'CORPORATE')
        ),

    CONSTRAINT chk_credit_limit
        CHECK (credit_limit >= 0)
);

INSERT INTO customers
(customer_code, first_name, last_name, email, phone,
 date_of_birth, city, state, postal_code,
 customer_type, credit_limit, is_active)
VALUES
('CUS001', 'Gayathri', 'Reddy', 'gayathri@gmail.com', '9876543210',
 '2004-05-15', 'Hyderabad', 'Telangana', '500001',
 'REGULAR', 5000.00, TRUE);

 INSERT INTO customers
(customer_code, first_name, last_name, email, phone,
 city, state, postal_code)
VALUES
('CUS003', 'Harika', 'Lokam', 'harika@gmail.com', NULL,
 'Kadapa', 'Andhra Pradesh', '516001');

 INSERT INTO customers
(customer_code, first_name, last_name, email, phone,
 city, state, postal_code)
VALUES
('CUS004', 'Harshini', 'Maridi', 'harshini@gmail.com', '9876543210',
 'Chennai', 'Tamil Nadu', '600001');
 SELECT * FROM customers;