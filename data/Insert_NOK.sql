-- Script d’un jeu de données SQL d’insertions (INSERT) qui produit des erreurs à cause de contraintes implémentées


-- Erreur : Service existant
INSERT INTO Services VALUES ('Pharmacie');


-- Erreur : Personnel avec numéro existant
INSERT INTO Personnel VALUES (3, 'Pasteur', 'Louis', 'Medecin', 'Structure de consultations');
-- Erreur : Personnel sans nom
INSERT INTO Personnel VALUES (8, NULL, 'Laura', 'Medecin', 'Stucture de consultations');
-- Erreur : Personnel sans prenom
INSERT INTO Personnel VALUES (9, 'Gros', NULL, 'Pharmacien', 'Pharmacie');
-- Erreur : Personnel ayant une fonction inconnue
INSERT INTO Personnel VALUES (10, 'Laennec', 'René', 'Chercheur', 'Structure de consultations');
-- Erreur : Personnel dans service inconnu
INSERT INTO Personnel VALUES (11, 'Paré', 'Ambroise', 'Medecin', 'Bloc opératoire');
-- Erreur : Personnel avec numéro négatif
INSERT INTO Personnel VALUES (-1, 'Bichat', 'Xavier', 'Médecin', 'Structure de consultations');


-- Erreur : Patient avec numéro existant
INSERT INTO Patients_base VALUES (2, 'Bond', 'James', '13-04-1968', 'Chelsea');
-- Erreur : Patient sans nom
INSERT INTO Patients_base VALUES (6, NULL, 'Lucie', '30-12-1995', 'Paris');
-- Erreur : Patient sans prénom
INSERT INTO Patients_base VALUES (7, 'Kim', NULL, '01-09-1997', 'Lyon');
-- Erreur : Patient sans date de naissance
INSERT INTO Patients_base VALUES (8, 'Jones', 'Indiana', NULL, 'New York');
-- Erreur : Patient sans adresse
INSERT INTO Patients_base VALUES (9, 'Montana', 'Tony', '05-05-1974', NULL);
-- Erreur : Patient avec numéro négatif
INSERT INTO Patients_base VALUES (-3, 'Captain', 'America', '04-07-1921', 'New York');


-- Erreur : Couple personnel - patient existant
INSERT INTO PersonnelPatients VALUES (2, 2);
-- Erreur : Personnel existant mais patient inexistant
INSERT INTO PersonnelPatients VALUES (6,50);
-- Erreur : Personnel inexistant mais patient existant
INSERT INTO PersonnelPatients VALUES (18, 5);


-- Erreur : Couple patient - service existant
INSERT INTO PatientsServices VALUES (1, 'Pharmacie');
-- Erreur : Patient existant mais service inexistant
INSERT INTO PatientsServices VALUES (1, 'Cuisine');
-- Erreur : Patient inexistant dans service existant
INSERT INTO PatientsServices VALUES (20, 'Pharmacie');


-- Erreur : Maladie existante avec prix différent
INSERT INTO Maladies_base VALUES ('Grippe', 25.00);


-- Erreur : Couple patient - maladie existant
INSERT INTO PatientsMaladies VALUES (2, 'Grippe', 3);
-- Erreur : Patient existant mais maladie inexistante
INSERT INTO PatientsMaladies VALUES (3, 'Timidité', 5);
-- Erreur : Patient inexistant mais maladie existante
INSERT INTO PatientsMaladies VALUES (38, 'Conjonctivite', 2);
-- Erreur : Gravité non incluse entre 0 et 5
INSERT INTO PatientsMaladies VALUES (5, 'Gastro-entérite', -1);
INSERT INTO PatientsMaladies VALUES (3, 'Sinusite', 6);


-- Erreur : Couple service - maladie existant
INSERT INTO ServicesMaladies VALUES ('Pharmacie', 'Rhume');
-- Erreur : Service existant mais maladie inexistante
INSERT INTO ServicesMaladies VALUES ('Pharmacie', 'Verrue');
-- Erreur : Service inexistant avec maladie existante
INSERT INTO ServicesMaladies VALUES ('Laboratoire', 'Grippe');


-- Erreur : Code consultation existant
INSERT INTO Consultations VALUES (1, 1, 1, 'Renouvellement d''ordonnance', 'Service de consultations', '24-04-2023', 0.00);
-- Erreur : Numéro de patient inexistant
INSERT INTO Consultations VALUES (4, 26, 7, 'Visite médicale', 'Structure de consultations', '23-04-2023', 50.00);
-- Erreur : Type de consultation inexistant
INSERT INTO Consultations VALUES (5, 3, 4, NULL, 'Micro-ferme', '22-04-2023', 5.00);
-- Erreur : Nom service inexistant
INSERT INTO Consultations VALUES (6, 1, 2, 'Visite médicale', NULL, '21-02-2023', 26.50);
-- Erreur : Date consultation inexistante
INSERT INTO Consultations VALUES (7, 2, 2, 'Visite médicale', 'Structure de consultations', NULL, 20.00);
-- Erreur : Code consultation négatif
INSERT INTO Consultations VALUES (-6, 3, 2, 'Visite médicale', NULL, '21-02-2023', 25.50);