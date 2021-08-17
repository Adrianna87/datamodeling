DROP DATABASE IF EXISTS doctors;

CREATE DATABASE doctors;

\c doctors

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL,
);

CREATE TABLE visit
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors (id)
  patient_id INTEGER REFERENCES patients (id)
)

CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  disease_id INTEGER REFERENCES diseases (id)
  visit_id INTEGER REFERENCES visits (id)
)
