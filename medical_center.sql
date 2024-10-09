-- Part One: Medical Center
DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical
CREATE TABLE doctors(
    id serial PRIMARY KEY,
    fullname text,
    specialty text
);

CREATE TABLE patients(
    id serial PRIMARY KEY,
    first TEXT,
    last TEXT,
    DOB date
);

CREATE TABLE diseases(
    id serial PRIMARY KEY,
    name text,
    description text
);

CREATE TABLE visits(
    id serial PRIMARY KEY,
    patient_id int REFERENCES patients ON DELETE CASCADE,
    doctor_id int REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE diagnosis(
    id serial PRIMARY KEY,
    visit_id int REFERENCES visits ON DELETE CASCADE,
    disease_id int REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO doctors(fullname, specialty)
    VALUES ('Shanel Montalvo', 'neuro'),
('Cristina Yang', 'cardio'),
('Meredith Grey', 'general');

INSERT INTO patients(FIRST, LAST, DOB)
    VALUES ('Whitney', 'Houston', '1990-08-11'),
('Dejah', 'Cooper', '1999-03-04');

INSERT INTO diseases(name, description)
    VALUES ('eczema', 'skin inflamation'),
('IBS', 'irritable bowel syndome');

INSERT INTO visits(patient_id, doctor_id)
    VALUES (2, 1),
(1, 2),
(2, 2),
(1, 3);

INSERT INTO diagnosis(visit_id, disease_id)
    VALUES (1, 1),
(2, 2),
(2, 1);

