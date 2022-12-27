-- create table
DROP DATABASE IF EXISTS student_suite_backend;
CREATE DATABASE IF NOT EXISTS student_suite_backend;

USE student_suite_backend;


DROP TABLE IF EXISTS corsi;
CREATE TABLE IF NOT EXISTS corsi(
    id_corso INT UNSIGNED,
    nome VARCHAR(50),
    livello ENUM ('BEGINNER','INTERMEDIATE','ADVANCED'),

    UNIQUE(nome),
    PRIMARY KEY(id_corso)
);



DROP TABLE IF EXISTS tags;
CREATE TABLE IF NOT EXISTS tags(
    id_tag INT UNSIGNED,
    nome VARCHAR (50) NOT NULL,

    PRIMARY KEY(id_tag),
    UNIQUE (nome)
);

DROP TABLE IF EXISTS tags_corsi;
CREATE TABLE IF NOT EXISTS tags_corsi(
    id_corso int unsigned not null,
    id_tag int unsigned not null,

    PRIMARY KEY (id_corso, id_tag),
    FOREIGN KEY(id_corso) REFERENCES corsi(Id_corso),
    FOREIGN KEY(id_tag) REFERENCES tags(id_tag)

);

DROP TABLE IF EXISTS esercizi;
CREATE TABLE IF NOT EXISTS esercizi(
    id_esercizio INT UNSIGNED,
    titolo VARCHAR(50) NOT NULL,
    descrizione TEXT NOT NULL,
    id_corso INT UNSIGNED NOT NULL,

    PRIMARY KEY(id_esercizio),
    FOREIGN KEY(id_corso) REFERENCES corsi(id_corso)
);



DROP TABLE IF EXISTS tasks;
CREATE TABLE IF NOT EXISTS tasks(
    id_task INT UNSIGNED,
    descrizione TEXT NOT NULL,
    parentTask INT UNSIGNED NULL,
    id_esercizio INT UNSIGNED NOT NULL,

    PRIMARY KEY (id_task),
    FOREIGN KEY (parentTask) REFERENCES tasks(id_task),
    FOREIGN KEY (id_esercizio) REFERENCES esercizi(id_esercizio)

);


DROP TABLE IF EXISTS studenti;
CREATE TABLE IF NOT EXISTS studenti(
    id_studente INT UNSIGNED,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    data_nascita DATE NOT NULL,

    PRIMARY KEY(id_studente)
);



DROP TABLE IF EXISTS professori;
CREATE TABLE IF NOT EXISTS professori(
    id_professore INT UNSIGNED,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    data_nascita DATE NOT NULL,

    PRIMARY KEY(id_professore)
);


DROP TABLE IF EXISTS tutors;
CREATE TABLE IF NOT EXISTS tutors(
    id_tutor INT UNSIGNED,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    data_nascita DATE NOT NULL,

    PRIMARY KEY(id_tutor)
);

DROP TABLE IF EXISTS assegnazioni;
CREATE TABLE IF NOT EXISTS assegnazioni(
    id_assegnazione INT UNSIGNED,
    id_esercizio INT UNSIGNED NOT NULL,
    id_professore INT UNSIGNED NOT NULL,
    id_studente INT UNSIGNED NOT NULL,
    data_assegnazione DATE NOT NULL,

    PRIMARY KEY(id_assegnazione),
    UNIQUE(id_esercizio, id_professore, id_studente),
    FOREIGN KEY(id_esercizio) REFERENCES esercizi(id_esercizio),
    FOREIGN KEY(id_professore) REFERENCES professori(id_professore),
    FOREIGN KEY(id_studente) REFERENCES studenti(id_studente)
);

DROP TABLE IF EXISTS assegnazione_tutor;
CREATE TABLE IF NOT EXISTS assegnazione_tutor(
    id_assegnazione_tutor INT UNSIGNED NOT NULL,
    id_tutor INT UNSIGNED NOT NULL,
    id_assegnazione INT UNSIGNED NOT NULL,

    PRIMARY KEY(id_assegnazione_tutor),
    UNIQUE (id_tutor, id_assegnazione),
    FOREIGN KEY(id_assegnazione) REFERENCES assegnazioni(id_assegnazione),
    FOREIGN KEY(id_tutor) REFERENCES tutors(id_tutor)
);


DROP TABLE IF EXISTS tutors_corsi;
CREATE TABLE IF NOT EXISTS tutors_corsi(
    id_corso INT UNSIGNED NOT NULL,
    id_tutor INT UNSIGNED NOT NULL,

    PRIMARY KEY(id_corso, id_tutor),
    FOREIGN KEY(id_corso) REFERENCES corsi(id_corso),
    FOREIGN KEY(id_tutor) REFERENCES tutors(id_tutor)
);











