-- Création de la base de données
CREATE DATABASE IF NOT EXISTS yair_line;
USE yair_line;

-- Table Employé
CREATE TABLE Employe (
    ID_Employe INT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Adresse TEXT NOT NULL,
    Salaire DECIMAL(10,2) NOT NULL,
    Type_Employe ENUM('PILOTE', 'EQUIPAGE', 'SOL') NOT NULL,
    Licence VARCHAR(20),
    Fonction VARCHAR(50),
    CHECK (
        (Type_Employe = 'PILOTE' AND Licence IS NOT NULL) OR
        (Type_Employe = 'EQUIPAGE' AND Fonction IS NOT NULL) OR
        (Type_Employe = 'SOL')
    )
);

-- Table Avion
CREATE TABLE Avion (
    ID_Avion VARCHAR(20) PRIMARY KEY,
    Type_Avion VARCHAR(20) NOT NULL,
    Capacite INT NOT NULL
);

-- Table Route
CREATE TABLE Route (
    ID_Route INT PRIMARY KEY,
    Ville_Origine VARCHAR(50) NOT NULL,
    Ville_Destination VARCHAR(50) NOT NULL
);

-- Table Vol
CREATE TABLE Vol (
    ID_Vol VARCHAR(10) PRIMARY KEY,
    ID_Route INT,
    ID_Avion VARCHAR(20),
    Date_Debut_Validite DATE NOT NULL,
    Date_Fin_Validite DATE NOT NULL,
    Heure_Depart TIME NOT NULL,
    Heure_Arrivee TIME NOT NULL,
    FOREIGN KEY (ID_Route) REFERENCES Route(ID_Route),
    FOREIGN KEY (ID_Avion) REFERENCES Avion(ID_Avion)
);

-- Table Départ
CREATE TABLE Depart (
    ID_Depart INT PRIMARY KEY AUTO_INCREMENT,
    ID_Vol VARCHAR(10),
    Date_Depart DATE NOT NULL,
    Places_Libres INT NOT NULL,
    Places_Occupees INT NOT NULL,
    FOREIGN KEY (ID_Vol) REFERENCES Vol(ID_Vol)
);

-- Table Passager
CREATE TABLE Passager (
    ID_Passager INT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Adresse TEXT NOT NULL,
    Profession VARCHAR(50)
);

-- Table Billet
CREATE TABLE Billet (
    ID_Billet INT PRIMARY KEY,
    ID_Passager INT,
    ID_Depart INT,
    Date_Emission DATE NOT NULL,
    Prix DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Passager) REFERENCES Passager(ID_Passager),
    FOREIGN KEY (ID_Depart) REFERENCES Depart(ID_Depart)
);

-- Table d'association Participation
CREATE TABLE Participation (
    ID_Depart INT,
    ID_Employe INT,
    PRIMARY KEY (ID_Depart, ID_Employe),
    FOREIGN KEY (ID_Depart) REFERENCES Depart(ID_Depart),
    FOREIGN KEY (ID_Employe) REFERENCES Employe(ID_Employe)
);

-- Insertion de données de test
INSERT INTO Employe VALUES
(1, 'Dupont', 'Jean', '123 rue Paris', 65000, 'PILOTE', 'PIL001', NULL),
(2, 'Martin', 'Sophie', '456 rue Lyon', 55000, 'PILOTE', 'PIL002', NULL),
(3, 'Bernard', 'Marie', '789 rue Marseille', 35000, 'EQUIPAGE', NULL, 'HOTESSE'),
(4, 'Thomas', 'Pierre', '321 rue Lille', 35000, 'EQUIPAGE', NULL, 'STEWARD'),
(5, 'Robert', 'Julie', '654 rue Nice', 32000, 'SOL', NULL, NULL);

INSERT INTO Avion VALUES
('F-GPRT', 'A320', 180),
('F-HBAS', 'B747', 400),
('F-ABCD', 'A330', 300);

INSERT INTO Route VALUES
(1, 'Paris', 'Londres'),
(2, 'Paris', 'New York'),
(3, 'Londres', 'Tokyo');

INSERT INTO Vol VALUES
('AF100', 1, 'F-GPRT', '2025-01-01', '2025-12-31', '08:00', '09:00'),
('AF200', 2, 'F-HBAS', '2025-01-01', '2025-12-31', '10:00', '22:00'),
('AF300', 3, 'F-ABCD', '2025-01-01', '2025-12-31', '14:00', '09:00');

INSERT INTO Depart (ID_Vol, Date_Depart, Places_Libres, Places_Occupees) VALUES
('AF100', '2025-01-20', 150, 30),
('AF200', '2025-01-20', 350, 50),
('AF300', '2025-01-20', 250, 50);

INSERT INTO Passager VALUES
(1, 'Smith', 'John', '123 London Street', 'Businessman'),
(2, 'Johnson', 'Emma', '456 NY Avenue', 'Lawyer'),
(3, 'Brown', 'Michael', '789 Tokyo Road', 'Engineer');

INSERT INTO Billet VALUES
(1, 1, 1, '2025-01-15', 200.00),
(2, 2, 2, '2025-01-16', 1200.00),
(3, 3, 3, '2025-01-17', 800.00);

INSERT INTO Participation VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4);
