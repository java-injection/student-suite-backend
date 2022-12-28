-- insert data
-- procedura di load dei dati nelle varie tabelle

DROP PROCEDURE IF EXISTS _Load;

DELIMITER &&
CREATE DEFINER = 'application'@'localhost' PROCEDURE _Load()
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


    INSERT INTO tutors (nome, cognome, data_nascita)
    VALUES ('Luca', 'Coraci', '1985-04-22'),
           ('Davide', 'Cascella', '2005-07-11'),
           ('Massimo Michele', 'Morgantini', '2005-01-10'),
           ('Alessio', 'Pecilli', '2003-07-13');

END &&
DELIMITER ;
