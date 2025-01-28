-- Script d’un jeu de données SQL d’insertions (INSERT) qui marchent

INSERT INTO Services VALUES ('Structure de consultations');
INSERT INTO Services VALUES ('Jardins thérapeutiques');
INSERT INTO Services VALUES ('Serre de phytothérapie');
INSERT INTO Services VALUES ('Micro-ferme');
INSERT INTO Services VALUES ('Pharmacie');
INSERT INTO Services VALUES ('Cantine');


INSERT INTO Personnel VALUES (1, 'Alzheimer', 'Alois', 'Neurologue', 'Structure de consultations');
INSERT INTO Personnel VALUES (2, 'Pravaz', 'Charles', 'Médecin', 'Structure de consultations');
INSERT INTO Personnel VALUES (3, 'Parmentier', 'Antoine', 'Pharmacien', 'Pharmacie');
INSERT INTO Personnel VALUES (4, 'Durand', 'Pierre', 'Fermier', 'Micro-ferme');
INSERT INTO Personnel VALUES (5, 'Dupont', 'Françoise', 'Agent de restauration', 'Cantine');
INSERT INTO Personnel VALUES (6, 'Maslow', 'Abraham', 'Psychologue', 'Structure de consultations');
INSERT INTO Personnel VALUES (7, 'Stoeber', 'Victor', 'Ophtalmologue', 'Structure de consultations');


INSERT INTO Patients_base VALUES (1, 'Sparrow', 'Jack', '10-04-1983', 'Caraïbes');
INSERT INTO Patients_base VALUES (2, 'Simpson', 'Homer', '12-05-1956', 'Springfield');
INSERT INTO Patients_base VALUES (3, 'Potter', 'Harry', '31-07-1980', 'Surrey');
INSERT INTO Patients_base VALUES (4, 'Mouse', 'Mickey', '18-11-1928', 'Mickeyville');
INSERT INTO Patients_base VALUES (5, 'Ourson', 'Winnie', '21-08-1921', 'Hundred Acre Wood');


INSERT INTO PersonnelPatients VALUES (2, 2);
INSERT INTO PersonnelPatients VALUES (2, 1);
INSERT INTO PersonnelPatients VALUES (3, 1);


INSERT INTO PatientsServices VALUES (2, 'Structure de consultations');
INSERT INTO PatientsServices VALUES (2, 'Pharmacie');
INSERT INTO PatientsServices VALUES (1, 'Pharmacie');


INSERT INTO Maladies_base VALUES ('Grippe', 20.00);
INSERT INTO Maladies_base VALUES ('Myopie', 150.00);
INSERT INTO Maladies_base VALUES ('Sinusite', 30.00);
INSERT INTO Maladies_base VALUES ('Rhume', 15.00);
INSERT INTO Maladies_base VALUES ('Conjonctivite', 30.00);
INSERT INTO Maladies_base VALUES ('Gastro-entérite', 15.00);


INSERT INTO PatientsMaladies VALUES (2, 'Grippe', 3);
INSERT INTO PatientsMaladies VALUES (1, 'Sinusite', 2);
INSERT INTO PatientsMaladies VALUES (4, 'Rhume', 1);
INSERT INTO PatientsMaladies VALUES (3, 'Grippe', 4);
INSERT INTO PatientsMaladies VALUES (5, 'Gastro-entérite', 2);
INSERT INTO PatientsMaladies VALUES (1, 'Grippe', 1);


INSERT INTO ServicesMaladies VALUES ('Serre de phytothérapie', 'Grippe');
INSERT INTO ServicesMaladies VALUES ('Structure de consultations', 'Grippe');
INSERT INTO ServicesMaladies VALUES ('Structure de consultations', 'Myopie');
INSERT INTO ServicesMaladies VALUES ('Structure de consultations', 'Sinusite');
INSERT INTO ServicesMaladies VALUES ('Pharmacie', 'Rhume');


INSERT INTO Consultations VALUES (1, 2, 2, 'Visite médicale', 'Structure de consultations', '19-04-2023', 25.00);
INSERT INTO Consultations VALUES (2, 1, 3, 'Visite pharmacie', 'Pharmacie', '18-04-2023', 14.50);
INSERT INTO Consultations VALUES (3, 4, NULL, 'Soin', 'Serre de phytothérapie', '17-04-2023', 0.00);
INSERT INTO Consultations VALUES (8, 2, 2, 'Visite médicale', 'Structure de consultations', '25-04-2023', 20.00)