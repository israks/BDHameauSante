-- Implémentation du modèle logique en SQL

-- Pour activer les FKs
PRAGMA FOREIGN_KEYS=ON;

--DROP TABLE Consultations;
--DROP TABLE Maladies_base;
--DROP TABLE PatientsMaladies;
--DROP TABLE PatientsServices;
--DROP TABLE PersonnelPatients;
--DROP TABLE Patients_base;
--DROP TABLE Personnel;
--DROP TABLE Services;
--DROP TABLE ServicesMaladies;


CREATE TABLE IF NOT EXISTS Services (
	nom_service VARCHAR(30),
	CONSTRAINT pk_ser_nom PRIMARY KEY (nom_service)
);


CREATE TABLE IF NOT EXISTS Personnel (
	numero_personnel NUMBER(3,0),
	nom_personnel VARCHAR(30) NOT NULL,
	prenom_personnel VARCHAR(30) NOT NULL,
	fonction_personnel VARCHAR(30) NOT NULL,
	nom_service VARCHAR(30) NOT NULL,
	CONSTRAINT pk_per_num PRIMARY KEY (numero_personnel),
	CONSTRAINT fk_per_ser FOREIGN KEY (nom_service) REFERENCES Services (nom_service),
	CONSTRAINT ck_per_num CHECK (numero_personnel > 0)
);


CREATE TABLE IF NOT EXISTS Patients_base (
	numero_patient NUMBER(5,0),
	nom_patient VARCHAR(30) NOT NULL,
	prenom_patient VARCHAR(30) NOT NULL,
	date_naissance_patient DATE NOT NULL,
	adresse_patient VARCHAR(30) NOT NULL,
	CONSTRAINT pk_pat_num PRIMARY KEY (numero_patient),
	CONSTRAINT ck_pat_num CHECK (numero_patient > 0)
);


CREATE TABLE IF NOT EXISTS PersonnelPatients (
	numero_personnel NUMBER(3,0),
	numero_patient NUMBER(5,0),
	CONSTRAINT pk_pepa_num PRIMARY KEY (numero_personnel, numero_patient)
	CONSTRAINT fk_pepa_per FOREIGN KEY (numero_personnel) REFERENCES Personnel(numero_personnel),
	CONSTRAINT fk_pepa_pat FOREIGN KEY (numero_patient) REFERENCES Patients_base(numero_patient)
);


CREATE TABLE IF NOT EXISTS PatientsServices (
	numero_patient NUMBER(5,0),
	nom_service VARCHAR(30),
	CONSTRAINT pk_pase_nm PRIMARY KEY (numero_patient, nom_service)
	CONSTRAINT fk_pase_num FOREIGN KEY (numero_patient) REFERENCES Patients_base(numero_patient)
	CONSTRAINT fk_pase_nom FOREIGN KEY (nom_service) REFERENCES Services(nom_service)
);


CREATE TABLE IF NOT EXISTS Maladies_base (
	nom_maladie VARCHAR(50),
	prix_traitement_maladie NUMBER(5,2),
	CONSTRAINT pk_mal_prix PRIMARY KEY (nom_maladie)
);


CREATE TABLE IF NOT EXISTS PatientsMaladies (
	numero_patient NUMBER(5,0),
	nom_maladie VARCHAR(50) NOT NULL,
	gravite_patientmaladie VARCHAR(30),
	CONSTRAINT pk_pama_nm PRIMARY KEY (numero_patient, nom_maladie),
	CONSTRAINT fk_pama_num FOREIGN KEY (numero_patient) REFERENCES Patients_base(numero_patient),
	CONSTRAINT fk_pama_nom FOREIGN KEY (nom_maladie) REFERENCES Maladies_base(nom_maladie),
	CONSTRAINT ck_pama_grav CHECK (gravite_patientmaladie IN (0,1,2,3,4,5))
);


CREATE TABLE IF NOT EXISTS ServicesMaladies (
	nom_service VARCHAR(30),
	nom_maladie VARCHAR(50),
	CONSTRAINT pk_sema_nom PRIMARY KEY (nom_service, nom_maladie),
	CONSTRAINT fk_sema_ser FOREIGN KEY (nom_service) REFERENCES Services(nom_service),
	CONSTRAINT fk_sema_mal FOREIGN KEY (nom_maladie) REFERENCES Maladies_base(nom_maladie)
);
	

CREATE TABLE IF NOT EXISTS Consultations (
	code_consultation NUMBER(3,0),
	numero_patient NUMBER(5,0) NOT NULL,
	numero_personnel NUMBER(3,0),
	type_consultation VARCHAR(50) NOT NULL,
	nom_service VARCHAR(30) NOT NULL,
	date_consultation DATE NOT NULL,
	frais_consultation NUMBER(4,2),
	CONSTRAINT pk_cons_code PRIMARY KEY (code_consultation),
	CONSTRAINT fk_cons_pat FOREIGN KEY (numero_patient) REFERENCES Patients_base(numero_patient),
	CONSTRAINT fk_cons_per FOREIGN KEY (numero_personnel) REFERENCES Personnel(numero_personnel),
	CONSTRAINT ck_cons_code CHECK (code_consultation > 0)
);


--DROP VIEW Patients;
--DROP VIEW Maladies;


CREATE VIEW IF NOT EXISTS Patients AS
		SELECT numero_patient, nom_patient, prenom_patient, date_naissance_patient, adresse_patient, COUNT(code_consultation) AS Nbconsultations
		FROM Consultations JOIN Patients_base USING(numero_patient)
		GROUP BY numero_patient
;


CREATE VIEW IF NOT EXISTS Maladies AS
	SELECT nom_maladie, COUNT(numero_patient) * 100.0 / (SELECT COUNT(*) FROM PatientsMaladies) AS taux_maladie
	FROM PatientsMaladies
	GROUP BY nom_maladie
;