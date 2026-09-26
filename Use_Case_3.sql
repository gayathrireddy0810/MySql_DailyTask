CREATE DATABASE shop_db;

USE shop_db;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    sku VARCHAR(20) NOT NULL UNIQUE,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(80) NOT NULL,
    brand VARCHAR(80),
    unit_price DECIMAL(12,2) NOT NULL,
    quantity_in_stock INT UNSIGNED NOT NULL DEFAULT 0,
    reorder_level INT UNSIGNED NOT NULL DEFAULT 5,
    manufacture_date DATE,
    expiry_date DATE,
    product_status VARCHAR(15) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT chk_unit_price
        CHECK (unit_price > 0),

    CONSTRAINT chk_expiry_date
        CHECK (
            expiry_date IS NULL
            OR manufacture_date IS NULL
            OR expiry_date >= manufacture_date
        ),

    CONSTRAINT chk_product_status
        CHECK (
            product_status IN ('ACTIVE', 'OUT_OF_STOCK', 'DISCONTINUED')
        )
);
INSERT INTO products
(sku, product_name, category, brand, unit_price,
 quantity_in_stock, reorder_level, manufacture_date,
 expiry_date, product_status)
VALUES
('SKU001', 'Milk 1L', 'Dairy', 'Amul', 65.00,
 50, 10, '2026-09-01', '2026-09-30', 'ACTIVE');

 INSERT INTO products
(sku, product_name, category, brand, unit_price,
 quantity_in_stock, reorder_level, manufacture_date,
 expiry_date, product_status)
VALUES
('SKU001', 'Milk 1L', 'Dairy', 'Amul', 65.00,
 50, 10, '2026-09-01', '2026-09-30', 'ACTIVE');

 INSERT INTO products
(sku, product_name, category, brand, unit_price,
 quantity_in_stock, reorder_level, manufacture_date,
 expiry_date, product_status)
VALUES
('SKU002', 'Steel Water Bottle', 'Kitchen', 'Milton', 450.00,
 25, 5, '2026-08-15', NULL, 'ACTIVE');

 INSERT INTO products
(sku, product_name, category, brand, unit_price,
 quantity_in_stock, reorder_level, manufacture_date,
 expiry_date, product_status)
VALUES
('SKU003', 'Biscuits', 'Food', 'Parle', -20.00,
 30, 5, '2026-09-01', '2027-09-01', 'ACTIVE');
 SELECT * FROM products;