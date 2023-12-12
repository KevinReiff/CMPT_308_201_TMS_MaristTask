CREATE DATABASE IF NOT EXISTS ProjectPhaseDefaultValuesDemo;
USE ProjectPhaseDefaultValuesDemo;

DROP TABLE IF EXISTS DefaultValueExample;

-- Create a table with default value specifications
CREATE TABLE DefaultValueExample (
    myInt INT DEFAULT 0,
    myVarchar VARCHAR(45) DEFAULT 'No Data',
    myFloat FLOAT DEFAULT 1.0,
    myDate DATE DEFAULT (CURRENT_DATE + INTERVAL 1 DAY),
    myTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    myEnum ENUM('Value1', 'Value2', 'Value3') DEFAULT 'Value1',
    mySet SET('A', 'B', 'C') DEFAULT 'A,B'
);
