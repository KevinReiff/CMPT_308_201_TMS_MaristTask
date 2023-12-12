-- Use the previously created database and table
USE TheRightType;

-- Query to demonstrate that MEDIUMINT is sufficient for storing values between 1 and 99999
SELECT * FROM Example WHERE myMediumInt BETWEEN 1 AND 99999;

-- Query to show calculations with FLOAT type columns
SELECT myFloat / 2 AS 'HalfFloat' FROM Example;

-- Query to demonstrate high precision with DECIMAL
SELECT myDecimal + 0.0000000001 AS 'HighPrecisionDecimal' FROM Example;

-- Query to demonstrate speed with FLOAT but loss of precision
SELECT myFloat + 0.0000000001 AS 'LowPrecisionFloat' FROM Example;

-- Query to demonstrate range of SMALLINT
SELECT * FROM Example WHERE mySmallInt BETWEEN -32768 AND 32767;

-- Query to demonstrate range of TINYINT
SELECT * FROM Example WHERE myTinyInt BETWEEN -128 AND 127;
