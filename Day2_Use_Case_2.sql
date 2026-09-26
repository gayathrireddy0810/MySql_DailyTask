CREATE DATABASE cdg_hyd_jfs_058;

USE cdg_hyd_jfs_058;

CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    sku VARCHAR(20) NOT NULL,
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
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_products_product_id PRIMARY KEY (product_id),
    CONSTRAINT uq_products_sku UNIQUE (sku),
    CONSTRAINT chk_products_unit_price CHECK (unit_price > 0),
    CONSTRAINT chk_products_expiry_date CHECK (
        expiry_date IS NULL
        OR manufacture_date IS NULL
        OR expiry_date >= manufacture_date
    ),
    CONSTRAINT chk_products_status CHECK (
        product_status IN ('ACTIVE', 'OUT_OF_STOCK', 'DISCONTINUED')
    )
);

INSERT INTO products
(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES
('SKU-CBL-001', 'USB-C Cable', 'Accessories', 'TechLine', 399.00, 50, 10, NULL, NULL, 'ACTIVE');

INSERT INTO products
(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES
('SKU-KBD-002', 'Wireless Keyboard', 'Accessories', 'KeyPro', 1499.00, 8, 5, '2026-01-15', NULL, 'ACTIVE'),
('SKU-JCE-003', 'Orange Juice', 'Beverages', 'FreshDrop', 120.00, 0, 20, '2026-09-01', '2026-12-01', 'OUT_OF_STOCK');

INSERT INTO products
(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES
('SKU-NTB-004', 'A5 Notebook', 'Stationery', 'PaperNest', 75.00, 120, 25, NULL, NULL, 'ACTIVE'),
('SKU-OLD-005', 'Legacy Adapter', 'Accessories', 'WireMax', 299.00, 0, 0, NULL, NULL, 'DISCONTINUED');
SELECT * FROM products;

INSERT INTO products
(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES
('SKU-NEG-006', 'Invalid Product', 'Accessories', 'TestBrand', -100.00, 10, 5, NULL, NULL, 'ACTIVE');

INSERT INTO products
(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES
('SKU-DATE-007', 'Expired Product', 'Beverages', 'TestBrand', 100.00, 10, 5, '2026-10-01', '2026-09-01', 'ACTIVE');

INSERT INTO products
(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES
('SKU-CBL-001', 'Another Cable', 'Accessories', 'AnotherBrand', 299.00, 20, 5, NULL, NULL, 'ACTIVE');

UPDATE products
SET quantity_in_stock = quantity_in_stock + 60,
    product_status = 'ACTIVE'
WHERE sku = 'SKU-JCE-003';

SELECT sku, quantity_in_stock, product_status
FROM products
WHERE sku = 'SKU-JCE-003';

UPDATE products
SET unit_price = ROUND(unit_price * 1.05, 2)
WHERE category = 'Accessories';

SELECT sku, product_name, unit_price
FROM products
WHERE category = 'Accessories';

UPDATE products
SET brand = NULL
WHERE sku = 'SKU-NTB-004';

SELECT sku, product_name, brand
FROM products
WHERE sku = 'SKU-NTB-004';

UPDATE products
SET reorder_level = 15
WHERE product_status = 'ACTIVE'
AND quantity_in_stock < 10;

SELECT sku, quantity_in_stock, reorder_level, product_status
FROM products
WHERE product_status = 'ACTIVE'
AND quantity_in_stock < 10;

UPDATE products
SET quantity_in_stock = -1
WHERE sku = 'SKU-CBL-001';

SELECT sku, quantity_in_stock
FROM products
WHERE sku = 'SKU-CBL-001';

SELECT *
FROM products
WHERE sku = 'SKU-OLD-005';

DELETE FROM products
WHERE sku = 'SKU-OLD-005';

SELECT * FROM products WHERE sku = 'SKU-OLD-005';

INSERT INTO products(sku, product_name, category, brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status)
VALUES('SKU-TEMP-999', 'Temporary Product', 'Accessories', 'TempBrand', 199.00, 10, 5, NULL, NULL, 'ACTIVE');

SELECT * FROM products WHERE sku = 'SKU-TEMP-999';

DELETE FROM products WHERE sku = 'SKU-TEMP-999';

SELECT * FROM productsWHERE sku = 'SKU-TEMP-999';

SELECT * FROM products;