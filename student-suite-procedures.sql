-- procedures

 -- CLEANUP
 DROP PROCEDURE IF EXISTS Cleanup;
 
 DELIMITER &&
 CREATE PROCEDURE Cleanup()
 BEGIN
 END &&
 DELIMITER ;
 
  DROP PROCEDURE IF EXISTS shut_down;
					-- procedura di cleanup con annessa reset delle eventuali variabili e drop di eventi
 DELIMITER &&
 CREATE PROCEDURE SHUT_DOWN()
 BEGIN 
 
 END &
 DELIMITER ;
					-- procedura di load dei dati nelle varie tabelle
DROP PROCEDURE IF EXISTS _Load;

DELIMITER &&
CREATE PROCEDURE _Load()
BEGIN
	insert into 
END &
DELIMITER ;
 
			-- select con limit
DROP PROCEDURE IF EXISTS _select;

DELIMITER $$
CREATE PROCEDURE _Select()
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
 
 
 
 