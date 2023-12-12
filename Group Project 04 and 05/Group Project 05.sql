-- Question 1: Creating a banking database with two tables: accounts and transactions.
CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
    account_number INT NOT NULL AUTO_INCREMENT,
    balance DECIMAL(10,2),
    PRIMARY KEY (account_number)
);

CREATE TABLE transactions (
    transaction_id INT NOT NULL AUTO_INCREMENT,
    account_number INT NOT NULL,
    transaction_type ENUM('deposit', 'withdrawal'),
    amount DECIMAL(10,2),
    transaction_date TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (account_number) REFERENCES accounts(account_number)
);

-- Question 2: Insert accounts with specific numbers and balances.
INSERT INTO accounts (account_number, balance)
VALUES (123, 200.00), (456, 400.00)
AS new ON DUPLICATE KEY UPDATE balance = new.balance;

-- Question 3: Transaction involving updates and inserts.
-- Ensuring the accounts exist before proceeding with the transaction.
START TRANSACTION;
    UPDATE accounts SET balance = balance - 100 WHERE account_number = 123;
    UPDATE accounts SET balance = balance + 100 WHERE account_number = 456;

    INSERT INTO transactions (account_number, transaction_type, amount) VALUES (123, 'withdrawal', 100.00);
    INSERT INTO transactions (account_number, transaction_type, amount) VALUES (456, 'deposit', 100.00);
COMMIT;

-- Question 4: Creating a Company database with specific tables and storage engines.
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS deposits;
DROP TABLE IF EXISTS login;

CREATE TABLE login (
    username VARCHAR(20),
    password CHAR(32) NOT NULL, -- MD5 hashes are 32 characters
    user_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (user_id)
) ENGINE=INNODB;

CREATE TABLE deposits (
    user_id VARCHAR(20),
    deposit DECIMAL(10,2),
    loan DECIMAL(10,2),
    time DATETIME DEFAULT NOW(),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES login(user_id)
) ENGINE=INNODB;

CREATE TABLE users (
    id INT,
    fname VARCHAR(20),
    lname VARCHAR(20),
    date_of_employment DATETIME DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES login(user_id)
) ENGINE=MyISAM;

-- Question 5: Insert three items in each table.
INSERT INTO login (username, password, user_id)
VALUES ('user1', MD5('password1'), 'id1'),
       ('user2', MD5('password2'), 'id2'),
       ('user3', MD5('password3'), 'id3')
AS new ON DUPLICATE KEY UPDATE password = new.password;

INSERT INTO deposits (user_id, deposit, loan)
VALUES ('id1', 1000.00, 500.00),
       ('id2', 2000.00, 1000.00),
       ('id3', 3000.00, 1500.00)
AS new ON DUPLICATE KEY UPDATE deposit = new.deposit, loan = new.loan;

INSERT INTO users (id, fname, lname)
VALUES (1, 'John', 'Doe'),
       (2, 'Jane', 'Doe'),
       (3, 'Jim', 'Beam')
AS new ON DUPLICATE KEY UPDATE fname = new.fname, lname = new.lname;

-- Question 6: Creating a join between login and deposit tables.
SELECT * FROM login
JOIN deposits ON login.user_id = deposits.user_id;

-- Question 7: Creating a view from tables users and deposits.
DROP VIEW IF EXISTS UserDeposits;
CREATE VIEW UserDeposits AS
SELECT users.id, users.fname, users.lname, deposits.deposit, deposits.loan
FROM users
JOIN deposits ON users.id = deposits.user_id;

-- Question 8: Inserting items in each table without FK constraints.
-- Assuming tables are created without FK constraints.
INSERT INTO login (username, password, user_id)
VALUES ('user4', MD5('password4'), 'id4'),
       ('user5', MD5('password5'), 'id5'),
       ('user6', MD5('password6'), 'id6')
AS new ON DUPLICATE KEY UPDATE password = new.password;

INSERT INTO deposits (user_id, deposit, loan)
VALUES ('id4', 4000.00, 2000.00),
       ('id5', 5000.00, 2500.00),
       ('id6', 6000.00, 3000.00)
AS new ON DUPLICATE KEY UPDATE deposit = new.deposit, loan = new.loan;

INSERT INTO users (id, fname, lname)
VALUES (4, 'Alice', 'Wonderland'),
       (5, 'Bob', 'Builder'),
       (6, 'Charlie', 'Brown')
AS new ON DUPLICATE KEY UPDATE fname = new.fname, lname = new.lname;

-- Question 9: Joining tables from different engines without FK.
SELECT * FROM login
JOIN deposits ON login.user_id = deposits.user_id;
