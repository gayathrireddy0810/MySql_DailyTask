CREATE TABLE bank_accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,

    account_number CHAR(12) NOT NULL UNIQUE,

    account_holder_name VARCHAR(120) NOT NULL,

    account_type ENUM(
        'SAVINGS',
        'CURRENT',
        'FIXED_DEPOSIT'
    ) NOT NULL,

    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,

    currency_code CHAR(3) NOT NULL DEFAULT 'INR',

    branch_name VARCHAR(100) NOT NULL,

    opened_date DATE NOT NULL,

    interest_rate DECIMAL(5,2) NOT NULL DEFAULT 0.00,

    overdraft_limit DECIMAL(12,2) NOT NULL DEFAULT 0.00,

    account_status ENUM(
        'ACTIVE',
        'FROZEN',
        'DORMANT',
        'CLOSED'
    ) NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CHECK (balance >= 0.00),

    CHECK (overdraft_limit >= 0.00),

    CHECK (interest_rate >= 0.00 AND interest_rate <= 100.00)
);

INSERT INTO bank_accounts
(
    account_number,
    account_holder_name,
    account_type,
    balance,
    branch_name,
    opened_date,
    interest_rate,
    overdraft_limit
)
VALUES
(
    '123456789012',
    'Ananya Sharma',
    'SAVINGS',
    25000.00,
    'Hyderabad Main Branch',
    '2024-06-15',
    4.50,
    0.00
),
(
    '234567890123',
    'Rahul Verma',
    'CURRENT',
    75000.00,
    'Secunderabad Branch',
    '2023-09-20',
    2.00,
    10000.00
),
(
    '345678901234',
    'Priya Reddy',
    'FIXED_DEPOSIT',
    100000.00,
    'Kukatpally Branch',
    '2025-01-10',
    7.25,
    0.00
);
INSERT INTO bank_accounts
(
    account_number,
    account_holder_name,
    account_type,
    balance,
    branch_name,
    opened_date
)
VALUES
(
    '456789012345',
    'Test User',
    'SAVINGS',
    -5000.00,
    'Test Branch',
    '2026-01-01'
);

INSERT INTO bank_accounts
(
    account_number,
    account_holder_name,
    account_type,
    balance,
    branch_name,
    opened_date,
    overdraft_limit
)
VALUES
(
    '567890123456',
    'Test User',
    'CURRENT',
    5000.00,
    'Test Branch',
    '2026-01-01',
    -1000.00
);
INSERT INTO bank_accounts
(
    account_number,
    account_holder_name,
    account_type,
    balance,
    branch_name,
    opened_date,
    interest_rate
)
VALUES
(
    '678901234567',
    'Test User',
    'FIXED_DEPOSIT',
    50000.00,
    'Test Branch',
    '2026-01-01',
    105.00
);
SELECT
    account_number,
    currency_code,
    account_status,
    created_at,
    updated_at
FROM bank_accounts;