USE ProjectPhaseDefaultValuesDemo;

-- Inserts a row with all of the default values
INSERT INTO DefaultValueExample () VALUES();

-- Inserts a new row with only 3 values specified, the rest will be default
INSERT INTO DefaultValueExample (myInt, myVarchar, myDate) VALUES (99, 'Data', '2023-05-05');

SELECT * FROM DefaultValueExample;

SELECT CONCAT(
    myInt, ', ',
    myVarchar, ', ',
    myFloat, ', ',
    myDate, ', ',
    myTimestamp, ', ',
    myEnum, ', (',
    mySet, ')'
) AS allColumnConcatenation
FROM DefaultValueExample;
