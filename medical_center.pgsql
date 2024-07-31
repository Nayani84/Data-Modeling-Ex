DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
phone_number INTEGER NOT NULL,
specialty TEXT NOT NULL
);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birthday DATE NOT NULL ,
    phone_number INTEGER NOT NULL,
    insurance TEXT NOT NULL
);

CREATE TABLE visits 
(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE diagnoses 
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE SET NULL,
    disease_id INTEGER REFERENCES disease ON DELETE SET NULL
);