-- functions
DROP FUNCTION IF EXISTS TABLE_EXISTS;

DELIMITER $$
CREATE FUNCTION TABLE_EXISTS(
    tabella VARCHAR(30)
)
    RETURNS BOOLEAN
    DETERMINISTIC
BEGIN
    DECLARE result INT;
    DECLARE query TEXT;
    SET @info_schema = 'student_suite_backend';
    SET @type = 'BASE TABLE';
    SET @table_name= 'tasks';

    PREPARE stmt FROM 'SELECT COUNT(TABLE_NAME)
                       FROM
                           information_schema.TABLES
                       WHERE
                               TABLE_SCHEMA LIKE ? AND
                               TABLE_TYPE LIKE ? AND
                               TABLE_NAME = ? INTO result';

    EXECUTE stmt USING @info_schema, @type, @table_name;
    DEALLOCATE PREPARE stmt;


    IF result = 1
    THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$
DELIMITER ;















SET @info_schema = 'student_suite_backend';
SET @type = 'BASE TABLE';

SELECT COUNT(TABLE_NAME)
FROM
    information_schema.TABLES
WHERE
        TABLE_SCHEMA LIKE 'student_suite_backend' AND
        TABLE_TYPE LIKE 'BASE TABLE' AND
        TABLE_NAME = 'tasks1'


PREPARE stmt1 FROM 'SELECT SQRT(POW(?,2) + POW(?,2)) AS hypotenuse';

SET @table_name = 'tasks';
PREPARE stm FROM 'SELECT COUNT(TABLE_NAME)
                  FROM
                      information_schema.TABLES
                  WHERE TABLE_ROWS > ?';


SET @qq = 'SELECT COUNT(*) FROM ?';

PREPARE stm FROM 'SELECT COUNT(TABLE_NAME)
                  FROM
                      information_schema.TABLES
                  WHERE
                          TABLE_SCHEMA LIKE ? AND
                          TABLE_TYPE LIKE ? AND
                          TABLE_NAME = ? INTO @result';
SET @table_name = 'tasks';
EXECUTE stm USING @table_name;

