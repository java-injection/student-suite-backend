-- procedures

 -- CLEANUP
 DROP PROCEDURE IF EXISTS Cleanup;
 
DELIMITER &&
CREATE DEFINER = 'select'@'localhost' PROCEDURE Cleanup()
    SQL SECURITY DEFINER
BEGIN
END &&
DELIMITER ;
 
  DROP PROCEDURE IF EXISTS shut_down;
					-- procedura di cleanup con annessa reset delle eventuali variabili e drop di eventi
 DELIMITER &&
CREATE DEFINER = 'select'@'localhost' PROCEDURE SHUT_DOWN()
    SQL SECURITY DEFINER
BEGIN
 
 END &&
 DELIMITER ;
					-- procedura di load dei dati nelle varie tabelle
DROP PROCEDURE IF EXISTS _Load;

DELIMITER &&
CREATE DEFINER = 'select'@'localhost' PROCEDURE _Load()
    SQL SECURITY DEFINER
BEGIN

    INSERT INTO corsi (nome, cognome, data_nascita)
    VALUES ('Luca', 'Coraci', '1985-04-22'),
           ('Davide', 'Cascella', '2005-07-11'),
           ('Massimo Michele', 'Morgantini', '2005-01-10'),
           ('Alessio', 'Pecilli', '2003-07-13');


	INSERT INTO professori (nome, cognome, data_nascita)
	VALUES ('Luca', 'Coraci', '1985-04-22'),
           ('Davide', 'Cascella', '2005-07-11'),
           ('Massimo Michele', 'Morgantini', '2005-01-10'),
           ('Alessio', 'Pecilli', '2003-07-13'),
           ('Francesco', 'Zanini', '2005-09-23'),
           ('Daide', 'Del Papa', '1978-02-16');


    INSERT INTO studenti (nome, cognome, data_nascita)
    VALUES ('acuL', 'Coraci', '1985-04-22'),
        ('edivaD', 'Cascella', '2005-07-11'),
        ('elehciM omissaM', 'Morgantini', '2005-01-10'),
        ('oissalA', 'Pecilli', '2005-01-10');


    INSERT INTO professori (nome, cognome, data_nascita)
    VALUES ('Luca', 'Coraci', '1985-04-22'),
        ('Davide', 'Cascella', '2005-07-11'),
        ('Massimo Michele', 'Morgantini', '2005-01-10'),
        ('Alessio', 'Pecilli', '2003-07-13');



END &&
DELIMITER ;
 
			-- select con limit
DROP PROCEDURE IF EXISTS _Select;

DELIMITER $$
CREATE DEFINER = 'select'@'localhost' PROCEDURE _Select()
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
 
 CALL _SELECT()
 
 
 
 