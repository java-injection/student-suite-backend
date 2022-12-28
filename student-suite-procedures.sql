-- procedures

 -- CLEANUP
 DROP PROCEDURE IF EXISTS Cleanup;
 
DELIMITER &&
CREATE DEFINER = 'application'@'localhost' PROCEDURE Cleanup()
    SQL SECURITY DEFINER
BEGIN
    -- svuotare tutte le tabelle dei relativi dati e rieseguire la load
    DELETE FROM assegnazione_tutor;
    DELETE FROM assegnazioni;
    DELETE FROM professori;
    DELETE FROM studenti;
    DELETE FROM tutors;
    DELETE FROM tasks;
    DELETE FROM esercizi;
    DELETE FROM tags_corsi;
    DELETE FROM corsi;
    DELETE FROM tags;

    CALL Load();

END &&
DELIMITER ;



  DROP PROCEDURE IF EXISTS shut_down;
					-- procedura di cleanup con annessa reset delle eventuali variabili e drop di eventi
 DELIMITER &&
CREATE DEFINER = 'application'@'localhost' PROCEDURE SHUT_DOWN()
    SQL SECURITY DEFINER
BEGIN
 
 END &&
 DELIMITER ;


-- select con limit
DROP PROCEDURE IF EXISTS _Select;

DELIMITER $$
CREATE DEFINER = 'application'@'localhost' PROCEDURE _Select()
    SQL SECURITY DEFINER
BEGIN
  IF (SELECT COUNT(*) FROM esercizi) < 1000
     AND (SELECT COUNT(*) FROM professori) < 1000
     AND (SELECT COUNT(*) FROM assegnazioni) < 1000
     AND (SELECT COUNT(*) FROM studenti) < 1000
     THEN
	select * from esercizi;
	select * from professori;
	select * from assegnazioni;
	select * from studenti;
    else
    select * from esercizi limit 1000;
	select * from professori limit 1000;
	select * from assegnazioni limit 1000;
	select * from studenti limit 1000; 
  END IF;
END $$
DELIMITER ;



DELIMITER $$
CREATE DEFINER = 'application'@'localhost' PROCEDURE _Select(
    IN tabella VARCHAR(30),
    IN _limit INT
)
SQL SECURITY DEFINER
BEGIN
    IF _limit < 0
    THEN


    ELSE
        SET @query = 'SELECT * FROM ? LIMIT ?';
        PREPARE stmt FROM @query;
        EXECUTE stmt USING tabella, _limit;
        DEALLOCATE PREPARE stmt;
    END IF;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS isTableExists;

DELIMITER $$
CREATE PROCEDURE isTableExists(
    IN tabella VARCHAR(30),
    OUT result BOOLEAN
)
BEGIN
    DECLARE query TEXT;

    SET @info_schema = 'student_suite_backend';
    SET @type = 'BASE TABLE';

    PREPARE stmt FROM 'SELECT COUNT(TABLE_NAME)
                       FROM
                           information_schema.TABLES
                       WHERE
                               TABLE_SCHEMA LIKE ? AND
                               TABLE_TYPE LIKE ? AND
                               TABLE_NAME = ? INTO @result_count';

    SET @tab = tabella;
    EXECUTE stmt USING @info_schema, @type, @tab;
    DEALLOCATE PREPARE stmt;

     IF @result_count = 1
     THEN
            SET result = TRUE;
     ELSE
            SET result =  FALSE;
     END IF;

END $$
DELIMITER ;

 
 
 