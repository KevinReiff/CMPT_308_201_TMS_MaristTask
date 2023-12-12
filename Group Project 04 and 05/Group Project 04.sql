-- Question 1
-- Creating a new user named Laura Green with the password 'Future'
CREATE USER 'laural_green'@'localhost' IDENTIFIED BY 'Future';

-- Question 2
-- Granting Laura Green insertion privileges on the film table
GRANT INSERT ON sakila.film TO 'laural_green'@'localhost';

-- Question 3
-- Changing the password of Laura Green to 'Happiness'
ALTER USER 'laural_green'@'localhost' IDENTIFIED BY 'Happiness';

-- Question 4
-- a. Creating a database named 'future' and tables 'personnel', 'role', and 'task'
CREATE DATABASE future;
USE future;

CREATE TABLE personnel (
    personID INT,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    SSN VARCHAR(11),
    roleID INT
);

CREATE TABLE role (
    roleID INT,
    role VARCHAR(50)
);

CREATE TABLE task (
    TaskID INT,
    roleID INT,
    personID INT
);

-- b. Inserting values into 'personnel', 'role', and 'task' tables
INSERT INTO personnel VALUES (1, 'Jack', 'Brown', '000 000 000', 1);
INSERT INTO personnel VALUES (2, 'James', 'Fall', '111 111 111', 2);

INSERT INTO role VALUES (1, 'researcher');
INSERT INTO role VALUES (2, 'manager');

INSERT INTO task VALUES (1, 1, 1);
INSERT INTO task VALUES (2, 2, 2);

-- c. Creating a user 'Reza' with password 'DB' and granting all privileges on 'personnel' table
CREATE USER 'reza'@'localhost' IDENTIFIED BY 'DB';
GRANT ALL PRIVILEGES ON future.personnel TO 'reza'@'localhost';

-- d. Selecting data from all three tables using user 'Reza'
-- Note: This part needs to be run with 'Reza' user login
SELECT * FROM personnel;
SELECT * FROM role;
SELECT * FROM task;

-- e. Running a join query of Personnel and Role from Reza side
-- Note: For 'Reza' to run this, he needs SELECT privilege on both tables
-- If Reza can't run this, then grant the necessary privileges as follows:
-- GRANT SELECT ON future.role TO 'reza'@'localhost';
SELECT * FROM personnel INNER JOIN role ON personnel.roleID = role.roleID;

-- Question 5
-- Removing Laura Green from the user list
DROP USER 'laural_green'@'localhost';
