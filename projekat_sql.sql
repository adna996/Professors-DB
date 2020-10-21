--DROP TABLE IF EXISTS tbl_asistent;
DROP TABLE IF EXISTS tbl_asistent_predavanja;
--DROP TABLE IF EXISTS tbl_predmet;
DROP TABLE IF EXISTS tbl_prof_predavanja;
DROP TABLE IF EXISTS tbl_smjer;
--DROP TABLE IF EXISTS tbl_student;
DROP TABLE IF EXISTS tbl_student_predmeti;
DROP TABLE IF EXISTS tbl_studij;
DROP TABLE IF EXISTS tbl_ciklus;
DROP TABLE IF EXISTS tbl_semestar;
DROP TABLE IF EXISTS tbl_anketa;
DROP TABLE IF EXISTS tbl_sekcija;
DROP TABLE IF EXISTS tbl_tip_pitanja;
DROP TABLE IF EXISTS tbl_pitanja;
DROP TABLE IF EXISTS tbl_student_odgovori;
DROP TABLE IF EXISTS tbl_profesor;
DROP TABLE IF EXISTS tbl_odsjek;

--kreiranje tabela
CREATE TABLE tbl_profesor(
    id_profesor bigserial NOT NULL PRIMARY KEY ,
    ime_profesor varchar(200),
    prezime_profesor varchar(200),
    datum_rodjenja date,
    mail varchar(200),
    telefon varchar(200)
);

CREATE TABLE tbl_asistent(
    asistent bigserial NOT NULL PRIMARY KEY ,
    ime_asistent varchar(200),
    prezime_asistent varchar(200),
    datum_rodjenja date,
    mail varchar(200),
    telefon varchar(200),
    adresa_stanovanja varchar(200));

CREATE TABLE tbl_asistent_predavanja(
    id_asistent bigserial NOT NULL ,
    id_predmet bigserial NOT NULL ,
    id_student bigserial NOT NULL,
    FOREIGN KEY (id_asistent) REFERENCES tbl_asistent(asistent),
    FOREIGN KEY (id_predmet) REFERENCES tbl_predmet(predmet),
    FOREIGN KEY (id_student) REFERENCES tbl_student(id_student)
);

CREATE TABLE tbl_student(
    id_student bigserial NOT NULL PRIMARY KEY ,
    ime_student varchar(200),
    prezime_student varchar(200),
    datum_rodjenja date,
    mail varchar(200),
    telefon varchar(200),
    adresa varchar(200),
    grad varchar(200),
    odsjek bigserial,
    smjer bigserial,
    semestar varchar,
    ciklus bigserial
);

CREATE TABLE tbl_student_odgovori(
     id_pitanja bigserial NOT NULL PRIMARY KEY ,
     tip_pitanja bigserial
);

CREATE TABLE tbl_predmet(
      predmet bigserial NOT NULL PRIMARY KEY ,
      naziv_predmet varchar(200),
      id_profesor bigserial NOT NULL ,
      id_asistent bigserial NOT NULL,
      student bigserial NOT NULL,
      FOREIGN KEY (student) REFERENCES tbl_student(id_student)
);

CREATE TABLE tbl_student_predmeti(
    student bigserial,
    profesor bigserial,
    asistent bigserial,
    predmet bigserial,
    FOREIGN KEY (student) REFERENCES tbl_student(id_student),
    FOREIGN KEY (profesor) REFERENCES tbl_profesor(id_profesor),
    FOREIGN KEY (asistent) REFERENCES tbl_asistent(asistent),
    FOREIGN KEY (predmet) REFERENCES tbl_predmet(predmet)
);

CREATE TABLE tbl_odsjek(
    id_odsjek bigserial NOT NULL PRIMARY KEY ,
    naziv_odsjek varchar(200)
);

CREATE TABLE tbl_prof_predavanja(
    id_profesor bigserial NOT NULL ,
    id_predmet bigserial NOT NULL ,
    id_student bigserial NOT NULL
);

CREATE TABLE tbl_smjer(
    id_smjer bigserial NOT NULL PRIMARY KEY ,
    naziv_smjer bigserial NOT NULL ,
    odsjek bigserial NOT NULL,
    FOREIGN KEY (odsjek) REFERENCES tbl_odsjek(id_odsjek)
);


CREATE TABLE tbl_ciklus(
    id_ciklus bigserial,
    PRIMARY KEY (id_ciklus)
);
CREATE TABLE tbl_semestar(
    id_semestar bigserial PRIMARY KEY ,
    id_ciklus bigserial
);

CREATE TABLE tbl_anketa(
    id_anekta bigserial PRIMARY KEY ,
    sekcija varchar(200),
    pitanja bigserial,
    FOREIGN KEY (pitanja) REFERENCES tbl_pitanja(id_pitanja),
    FOREIGN KEY (sekcija) REFERENCES tbl_sekcija(id_sekcija)
);

CREATE TABLE tbl_sekcija(
    id_sekcija varchar(200) PRIMARY KEY
);

CREATE TABLE tbl_tip_pitanja(
    id_pitanja bigserial PRIMARY KEY ,
    naziv_tip varchar(200)
);

CREATE TABLE tbl_pitanja(
    id_pitanja bigserial,
    tip_pitanja bigserial,
    id_studenta bigserial,
    id_predmeta bigserial,
    id_asistent bigserial,
    id_profesor bigserial,
    FOREIGN KEY (id_studenta) REFERENCES tbl_student_predmeti(student),
    FOREIGN KEY (id_predmeta) REFERENCES tbl_student_predmeti(predmet),
    FOREIGN KEY (id_profesor) REFERENCES tbl_student_predmeti(profesor),
    FOREIGN KEY (id_asistent) REFERENCES tbl_student_predmeti(asistent)
);


--Unos podataka u tabele
INSERT INTO tbl_profesor VALUES (2, 'Elmedin', 'Selmanovic', '1988-11-10','elmedinasel@unsa.ba','061/707-707','Himze Polovine 2a');
INSERT INTO tbl_profesor VALUES (3, 'Almasa', 'Odzak','1985-03-25','odzak.almasa@outlook.com','060/3001-442','Emerika Bluma 2');
INSERT INTO tbl_profesor VALUES (4, 'Adis', 'Alihodzic','1987-01-11','adis_alihodzic@hotmail.com','061/453-213','Hamdije Čemerlića 2');


INSERT INTO tbl_asistent VALUES (1, 'Sead', 'Delalic', '1993-12-08','sead_delalic@gmail.com', '062/555-555','Zmaja od Bosne 15');
INSERT INTO tbl_asistent VALUES (2, 'Admir', 'Besirevic', '1992-12-08','admirbe@gmail.com', '062/666-666','Grbavicka 14');
INSERT INTO tbl_asistent VALUES (3, 'Dina', 'Kamber', '1989-08-08','dina_ka@gmail.com', '062/777-777','Marka Marulica 10a');
INSERT INTO tbl_asistent VALUES (4, 'Harun', 'Hindija', '1993-10-28','harun.hindija@outlook.com', '062/888-888','Grbavicka bb');
INSERT INTO tbl_asistent VALUES (5, 'Franjo', 'Sarcevic', '1990-02-25', '062/555-666','Paromlinska bb');


INSERT INTO tbl_odsjek VALUES (1, 'Matematika');
INSERT INTO tbl_odsjek VALUES (2, 'Biologija');
INSERT INTO tbl_odsjek VALUES (3,'Geografija');


INSERT INTO tbl_smjer VALUES (1,'Teorijske kompjuterske nauke', 1);
INSERT INTO tbl_smjer VALUES (2,'Primjenjena matematika',1);
INSERT INTO tbl_smjer VALUES (3, 'Mikrobiologija',2);
INSERT INTO tbl_smjer VALUES (4,'Genetika',2);


INSERT INTO tbl_predmet VALUES (1,'Analiza I', 1, 5, 1);
INSERT INTO tbl_predmet VALUES (2,'Operaciona istrazivanja', 3, 3,2);
INSERT INTO tbl_predmet VALUES (3,'Web programiranje', 2, 1,3);
INSERT INTO tbl_predmet VALUES (4, 'Baze podataka',4,1,3);


INSERT INTO tbl_ciklus VALUES (1);
INSERT INTO tbl_ciklus VALUES (2);
INSERT INTO tbl_ciklus VALUES (3);


INSERT INTO tbl_semestar VALUES (1,1);
INSERT INTO tbl_semestar VALUES (2,1);
INSERT INTO tbl_semestar VALUES (3,1);
INSERT INTO tbl_semestar VALUES (4,1);
INSERT INTO tbl_semestar VALUES (5,1);


INSERT INTO tbl_student VALUES (1,'Adna', 'Cengic',  'adna.cengic@gmail.com','1996-03-25','062/656-454','Grabavicka 28','Sarajevo',1,1,5,1);
INSERT INTO tbl_student VALUES (2,'Zerina','Djuheric','zerdj@gmail.com','1996-06-17','Grbavicka 28',1,1,5,1);
INSERT INTO tbl_student VALUES (3,'Ahmed','Cengic','ahmed@gmail.com','1997-08-17','Zmaja od Bosne 5','Sarajevo',2,3,3,1);
INSERT INTO tbl_student VALUES (4,'Haris','Salcin','salcin_haris@gmail.com','060/4000-343','Patriotske lige 5','Sarajevo',1,1,3,1);


INSERT INTO tbl_tip_pitanja VALUES (1,'DA/NE');
INSERT INTO tbl_tip_pitanja VALUES (2,'Visestruki izbor');
INSERT INTO tbl_tip_pitanja VALUES (3,'Tekstualni odgovor');

