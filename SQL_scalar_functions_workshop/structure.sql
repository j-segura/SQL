-- Autor: Juan David And Esteban

CREATE DATABASE scalar_functions

USE scalar_functions

CREATE TABLE systems(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(50) NOT NULL,
);

CREATE TABLE centers(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE diseases(
    cod INT PRIMARY KEY IDENTITY,
    name VARCHAR(50) NOT NULL,
    system_id INT FOREIGN KEY REFERENCES systems(id)
);

CREATE TABLE doctors(
    cod INT PRIMARY KEY IDENTITY,
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATETIME NOT NULL,
    address VARCHAR(50) NOT NULL,
    contract VARCHAR(10) NOT NULL,
    center_id INT FOREIGN KEY REFERENCES centers(id),
);

CREATE TABLE patients(
    nHistory INT PRIMARY KEY IDENTITY,
    name VARCHAR(30) NOT NULL,
    lastName VARCHAR(40) NOT NULL,
    dateOfBirth DATETIME NOT NULL,
    address VARCHAR(50) NOT NULL,
    doctor_cod INT FOREIGN KEY REFERENCES doctors(cod)
);

CREATE TABLE conditions(
    disease_cod INT FOREIGN KEY REFERENCES diseases(cod),
    patient_nHistory INT FOREIGN KEY REFERENCES patients(nHistory),
);

CREATE TABLE appointments(
    cod INT PRIMARY KEY IDENTITY,
    date DATETIME NOT NULL,
    patient_nHistory INT FOREIGN KEY REFERENCES patients(nHistory),
    doctor_cod INT FOREIGN KEY REFERENCES doctors(cod)
);

INSERT INTO systems (name)
VALUES
    ('Cardiovascular'),
    ('Respiratory'),
    ('Digestive'),
    ('Musculoskeletal'),
    ('Nervous'),
    ('Endocrine'),
    ('Immune'),
    ('Urinary'),
    ('Reproductive'),
    ('Integumentary');

INSERT INTO centers (name)
VALUES
    ('General Hospital'),
    ('City Medical Center'),
    ('Central Clinic'),
    ('Community Health'),
    ('Regional Hospital'),
    ('Family Care Center'),
    ('Wellness Clinic'),
    ('Medical Associates'),
    ('Urban Health Center'),
    ('CareFirst Medical');

INSERT INTO diseases (name, system_id)
VALUES
    ('Hypertension', 1),
    ('Asthma', 2),
    ('Gastritis', 3),
    ('Osteoarthritis', 4),
    ('Migraine', 5),
    ('Diabetes', 6),
    ('Allergy', 7),
    ('Urinary Tract Infection', 8),
    ('Infertility', 9),
    ('Eczema', 10);

INSERT INTO doctors (name, lastName, dateOfBirth, address, contract, center_id)
VALUES
    ('John', 'Smith', '15/05/1980', '123 Main St', '3', 1),
    ('Emily', 'Johnson', '22/09/1975', '456 Elm St', '2', 2),
    ('Michael', 'Williams', '12/07/1982', '789 Oak Ave', '1', 3),
    ('Jessica', 'Brown', '08/03/1984', '567 Pine Rd', '3', 4),
    ('David', 'Jones', '30/11/1978', '890 Cedar Ln', '2', 5),
    ('Olivia', 'Davis', '18/06/1981', '432 Maple Blvd', '3', 6),
    ('William', 'Miller', '25/12/1976', '765 Birch Dr', '3', 7),
    ('Sophia', 'Wilson', '10/08/1983', '987 Willow Ct', '1', 8),
    ('Ethan', 'Anderson', '03/04/1979', '654 Oakwood Ave', '1', 9),
    ('Ava', 'Taylor', '28/01/1985', '321 Juniper Ln', '2', 10);


INSERT INTO patients (name, lastName, dateOfBirth, address, doctor_cod)
VALUES
    ('Emma', 'Wilson', '15/03/1992', '1234 Elm St', 1),
    ('Liam', 'Davis', '02/09/1988', '5678 Oak Ave', 2),
    ('Olivia', 'Johnson', '20/07/1995', '9101 Pine Rd', 3),
    ('Noah', 'Smith', '12/05/1998', '2345 Cedar Ln', 4),
    ('Ava', 'Miller', '25/11/1990', '6789 Birch Dr', 5),
    ('Sophia', 'Anderson', '08/06/1993', '1234 Maple Blvd', 6),
    ('Jackson', 'Brown', '15/12/1996', '5678 Willow Ct', 7),
    ('Isabella', 'Jones', '30/08/1989', '9101 Oakwood Ave', 8),
    ('Aiden', 'Taylor', '23/04/1994', '2345 Juniper Ln', 9),
    ('Mia', 'Williams', '17/01/1997', '6789 Magnolia St', 10);

INSERT INTO conditions (disease_cod, patient_nHistory)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO appointments (date, patient_nHistory, doctor_cod)
VALUES
    ('23/06/2023 09:00:00', 1, 1),
    ('24/06/2023 10:30:00', 2, 2),
    ('25/06/2023 11:45:00', 3, 3),
    ('26/06/2023 14:15:00', 4, 4),
    ('27/06/2023 16:30:00', 5, 5),
    ('28/06/2023 08:30:00', 6, 6),
    ('29/06/2023 13:00:00', 7, 7),
    ('30/06/2023 15:45:00', 8, 8),
    ('01/07/2023 10:00:00', 9, 9),
    ('02/07/2023 12:30:00', 10, 10);


SELECT * FROM systems;
SELECT * FROM centers;
SELECT * FROM diseases;
SELECT * FROM doctors;
SELECT * FROM patients;
SELECT * FROM conditions;
SELECT * FROM appointments;